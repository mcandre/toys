// Andrew Pennebaker
// Copyright 2007 Andrew Pennebaker
//
// Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

/** Proof that Java is retarded. Instead of an easy gmtime() method, I have to use
the deprecated Date class; I absolutely refuse to use java.util.Calendar with all its
get(Calendar.CONSTANT) and set(Calendar.CONSTANT) methods. C uses gmtime(), Perl uses
gmtime(), Ruby uses gmtime(), Python uses gmtime(), even Lua has os.date("%z")! **/

import java.util.Date;

public class Swatch {
	public static int getTimezone(Date d) {
		return d.getTimezoneOffset()/60;
	}

	public static double beat() {
		Date d=new Date();
		int hour=d.getHours()+getTimezone(d), min=d.getMinutes(), sec=d.getSeconds();

		int utc=hour*3600+min*60+sec; // Greenwich, England

		int bmt=utc+3600; // Biel, Switzerland

		double beat=bmt/86.4;

		if (beat>1000)
			beat-=1000;

		return beat;
	}

	public static String swatch() {
		return String.format("@%06.2f", beat());
	}

	public static void main(String[] args) {
		System.out.println(swatch());
	}
}