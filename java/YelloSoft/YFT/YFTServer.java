// Yellosoft File Transfer Server
// Andrew Pennebaker
// June 30, 2004 - October 16, 2004

import java.io.*;
import java.net.*;
import java.util.*;

import javax.swing.JOptionPane;

import java.security.*;
import javax.crypto.*;

import sun.misc.*;
public class YFTServer {
	public static int DEFAULT_PORT=7000;

	public static void main(String[] args) throws IOException {
		String algorithm="AES"; //JOptionPane.showInputDialog("Enter algorithm:");

		PassphraseDialog pd=new PassphraseDialog();
		int valPass=pd.showConfirmDialog(null, "Enter Session Passphrase");
		if (valPass==PassphraseDialog.APPROVE_OPTION) {
			char[] pass=pd.getPassphrase();

			boolean keepRunning=true;
			String info[]={algorithm, new String(pass), ""+false};

			System.out.println("--Listening--");
			boolean hadError=true;

			while(keepRunning) {
				try {
					hadError=true;
					keepRunning=acceptSecureConnection(info);
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}

			System.out.println("--Closing--");
			System.exit(1);
		}
	}

	public static boolean acceptSecureConnection(String[] sessionTerms) throws Exception {
		boolean shutDown=false;

		String algorithm=sessionTerms[0];
		String passphrase=sessionTerms[1];
		String newAlg=algorithm;
		String newPass=passphrase;

		ServerSocket server=new ServerSocket(DEFAULT_PORT);
		Socket socket=server.accept();

		System.out.println("--attempted to connect "+new Date()+"--");

		DataOutputStream out=new DataOutputStream(socket.getOutputStream());
		DataInputStream in=new DataInputStream(socket.getInputStream());

		// prove identity
		ObjectInputStream signingKeyIn=new ObjectInputStream(
			new FileInputStream("RSA.session.sk")
		);

		PrivateKey signingKey=(PrivateKey) signingKeyIn.readObject();
		signingKeyIn.close();

		int sigRand=0;
		String sigDate="";

		sigRand=Integer.parseInt(getString(in));
		sigDate=getString(in);

		sendString(
			out,
			makeSignature(signingKey, "YSES"+sigRand+sigDate)
		);

		String name="Andrew";

		if (secureLogin(in, out, name, passphrase)) {
			try {
				sessionTerms=yft(name, sessionTerms, socket);
			}
			catch(Exception e) {
				//e.printStackTrace();
			}
		}
		else {
			sendString(out, "false");
			System.out.println("--login attempt rejected "+(new Date())+"--");
		}

		// close connections
		in.close();
		out.close();
		socket.close();
		server.close();

		return !sessionTerms[2].equals("true");
	}

	public static boolean secureLogin(DataInputStream in, DataOutputStream out, String myName, String p) {
		try {
			SecureRandom rand=new SecureRandom();
			String randomNumber=""+rand.nextInt();
			Date d=new Date();
			String timeStamp=d.toString();

			sendString(out, timeStamp);
			sendString(out, randomNumber);

			String name="", clientsTicket="";
			name=getString(in);
			clientsTicket=getString(in);

			// calulate digest
			MessageDigest md=MessageDigest.getInstance("MD5");
			md.update(myName.getBytes());
			md.update(timeStamp.getBytes());
			md.update(randomNumber.getBytes());
			md.update(p.getBytes());
			byte[] raw=md.digest();
			BASE64Encoder encoder=new BASE64Encoder();
			String encodedDigest=encoder.encode(raw);

			return clientsTicket.equals(encodedDigest);
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public static String[] yft(String name, String[] params, Socket socket) throws Exception {
		DataInputStream in=new DataInputStream(socket.getInputStream());
		DataOutputStream out=new DataOutputStream(socket.getOutputStream());

		String alg=params[0];
		String newAlg=alg;
		String newPass=params[1];
		boolean shutDown=params[2].equals("true");
		boolean clientRan=false;
		sendString(
			out,
			"true"
		);

		System.out.println("--connected to Yellosoft Client "+new Date()+"--");

		SecretKey key;

		ObjectInputStream keyIn=new ObjectInputStream(
			new FileInputStream(alg+".session.ser")
		);
		key=(SecretKey) keyIn.readObject();
		keyIn.close();

		Cipher c1=Cipher.getInstance(alg+"/ECB/PKCS5Padding");
		Cipher c2=Cipher.getInstance(alg+"/ECB/PKCS5Padding");
		c1.init(Cipher.ENCRYPT_MODE, key);
		c2.init(Cipher.DECRYPT_MODE, key);

		String welcomeMessage=
			"\nWelcome to "+
			name+
			"'s Yellosoft Server\n"+
			new Date().toString()+
			"\n";

		EncryptedOutputStream eos=new EncryptedOutputStream(
			socket.getOutputStream(),
			c1
		);

		String welcomeEncrypted=makeEncryption(c1, welcomeMessage);
		sendString(out, ""+welcomeMessage.getBytes().length);
		sendString(out, welcomeEncrypted);///eos.writeString(welcomeMessage);

		boolean latherRinseRepeat=true;
		BASE64Encoder encoder=new BASE64Encoder();
		BASE64Decoder decoder=new BASE64Decoder();

		EncryptedInputStream eis=new EncryptedInputStream(
			socket.getInputStream(),
			c2
		);

		String message="";
		int decryptLen=Integer.parseInt(getString(in));
		//try {
			message=makeDecryption(c2, getString(in), decryptLen);//eis.readString();
		//}
		/*catch(SocketException e) {
			System.out.println("--client ran--");
			clientRan=true;
		}*/

		while (latherRinseRepeat&&!clientRan) {
			System.out.println("Client: "+message);

			if (message.length()>5&&message.substring(0, 4).equals("echo")) {
				String echoPhrase=message.substring(5);
				System.out.println("--sending echo--");
				sendString(out, ""+echoPhrase.getBytes().length);
				sendString(out, makeEncryption(c1, echoPhrase));//eos.writeString(echoPhrase);
				System.out.println("--echo sent--");
			}

			else if (
				message.length()>4&&
				message.substring(0,3).equals("get")&&
				message.indexOf(' ')!=message.lastIndexOf(' ')
			) {
				String fileToSend=message.substring(4, message.lastIndexOf(' '));
				System.out.println("--sending "+fileToSend+"--");

				FileInputStream fis=null;
				try {
					fis=new FileInputStream(fileToSend);
				}
				catch(IOException e) {
					System.out.println("--"+fileToSend+" not found--\n--sending fnf notice--");

					DataOutputStream dos=new DataOutputStream(
						new FileOutputStream("temp.dat")
					);
					dos.writeUTF("--"+fileToSend+" not found--");
					dos.close();

					fis=new FileInputStream("temp.dat");
				}

				ServerSocket fileServer=new ServerSocket(DEFAULT_PORT+1);
				Socket fileSocket=fileServer.accept();

				CipherOutputStream temp=new CipherOutputStream(
					fileSocket.getOutputStream(),
					c1
				);

				System.out.println("--writing "+fileToSend+"--");

				// encrypt file
				int d=getData(fis);
				while (d!=-1) {
					writeData(temp, d);
					d=getData(fis);
				}

				fis.close();

				temp.flush();
				temp.close();
				fileSocket.close();
				fileServer.close();

				System.out.println("--"+fileToSend+" sent--");
			}
			else if (
				message.length()>5&&
				message.substring(0, 4).equals("send")&&
				message.indexOf(' ')!=message.lastIndexOf(' ')
			) {
				String fileToReceive=message.substring(5, message.lastIndexOf(' '));
				String fileToSave=message.substring(message.lastIndexOf(' ')+1);

				System.out.println("--receiving "+fileToReceive+"--");

				FileOutputStream fos=new FileOutputStream(
					fileToSave
				);

				ServerSocket fileServer=new ServerSocket(DEFAULT_PORT+1);
				Socket fileSocket=fileServer.accept();

				CipherInputStream temp=new CipherInputStream(
					fileSocket.getInputStream(),
					c2
				);

				// decrypt file
				int d=getData(temp);
				while (d!=-1) {
					writeData(fos, d);
					d=getData(temp);
				}

				temp.close();
				fileSocket.close();
				fileServer.close();

				System.out.println("--"+fileToReceive+" received--");

				fos.flush();
				fos.close();

				System.out.println("--"+fileToSave+" saved "+new Date()+"--");
			}

			else if (message.length()>5&&message.substring(0, 6).equals("logout")) {
				latherRinseRepeat=false;
			}
			else if (message.length()>7&&message.substring(0, 8).equals("shutdown")) {
				shutDown=true;
				latherRinseRepeat=false;
			}

			if (latherRinseRepeat) {
				decryptLen=Integer.parseInt(getString(in));
				//try {
					message=makeDecryption(c2, getString(in), decryptLen);//eis.readString();
				//}
				/*catch(SocketException e) {
					message="";
					clientRan=true;
				}*/
			}
		}

		if (!shutDown&&!clientRan) {
			String passQuestion="Enter next session password: ";
			sendString(out, ""+passQuestion.getBytes().length);
			sendString(out, makeEncryption(c1, passQuestion));//eos.writeString(passQuestion);
			decryptLen=Integer.parseInt(getString(in));
			newPass=makeDecryption(c2, getString(in), decryptLen);//eis.readString();

			String algQuestion="Enter next session algorithm: ";
			sendString(out, ""+algQuestion.getBytes().length);
			sendString(out, makeEncryption(c1, algQuestion));//eos.writeString(algQuestion);
			decryptLen=Integer.parseInt(getString(in));
			newAlg=makeDecryption(c2, getString(in), decryptLen);//eis.readString();
		}

		eis.close();
		eos.close();
		in.close();
		out.close();

		if (!clientRan) {
			params[0]=newAlg;
			params[1]=newPass;
			System.out.println("--disconnected safely "+new Date()+"--");
		}
		else
			System.out.println("--ended transmission with disconnected client "+new Date()+"--");
		params[2]=""+shutDown;

		return params;
	}

	public static String makeEncryption(Cipher c, String plainText) {
		try {
			BASE64Encoder encoder=new BASE64Encoder();

			byte[] cipherBytes=new byte[0];
			YByteInputStream ybis=new YByteInputStream(plainText.getBytes());
			YByteOutputStream ybos=new YByteOutputStream(cipherBytes);

			// encrypt
			int d=getData(ybis);
			while (d!=-1) {
				writeData(ybos, d);
				d=getData(ybis);
			}

			return encoder.encode(ybos.getBytes());
		}
		catch(Exception e) {
			e.printStackTrace();
			return "[error encrypting]";
		}
	}

	public static String makeDecryption(Cipher c, String cipherText, int len) {
		try {
			BASE64Decoder decoder=new BASE64Decoder();

			byte[] plainBytes=new byte[0];
			byte[] cipherBytes=decoder.decodeBuffer(cipherText);
			YByteInputStream ybis=new YByteInputStream(cipherBytes);
			YByteOutputStream ybos=new YByteOutputStream(plainBytes);

			// decrypt
			int i=0;
			int d=getData(ybis);
			while (d!=-1) {
				writeData(ybos, d);
				d=getData(ybis);
			}

			byte[] temp=ybos.getBytes();
			byte[] finalBytes=new byte[len];

			for (int x=0; x<len; x++)
				finalBytes[x]=temp[x];

			return new String(finalBytes);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "[error decrypting]";
		}
	}

	public static String makeSignature(PrivateKey key, String plainText) {
		try {
			BASE64Encoder encoder=new BASE64Encoder();

			Signature sig=Signature.getInstance("SHA1withRSA");
			sig.initSign(key);

			YByteInputStream ybis=new YByteInputStream(plainText.getBytes());

			// calculate signature
			sig.update(getAllData(ybis));

			// get signature
			byte[] sigBytes=sigBytes=sig.sign();

			return encoder.encode(sigBytes);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "[error signing]";
		}
	}

	public static String getString(DataInputStream dis) {
		try {
			return dis.readUTF();
		}
		catch(IOException e) {
			return "";
		}
	}

	public static void sendString(DataOutputStream dos, String s) {
		try {
			dos.writeUTF(s);
			dos.flush();
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}

	public byte[] getDecoded(String u) {
		BASE64Decoder decoder=new BASE64Decoder();

		try {
			return decoder.decodeBuffer(u);
		}
		catch(IOException e) {
			e.printStackTrace();

			byte[] temp={(byte) 0};

			return temp;
		}
	}

	public static int getData(InputStream is) {
		try {
			int i=is.read();
			return i;
		}
		catch(IOException e) {
			e.printStackTrace();
			return -1;
		}
	}

	/*public static int getDataAndLen(InputStream is, byte[] buf) {
		try {
			return is.read(buf);
		}
		catch(IOException e) {
			return -1;
		}
	}

	public static void getData(InputStream is, byte[] buf) {
		try {
			int i=is.read(buf);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}*/

	public static byte[] getAllData(InputStream in) {
		byte[] buf;
		try {
			buf=new byte[in.available()];
			int i=in.read(buf);
		}
		catch(IOException e) {
			buf=new byte[0];
		}

		return buf;
	}

	public static void writeData(OutputStream os, int data) {
		try {
			os.write(data);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
}