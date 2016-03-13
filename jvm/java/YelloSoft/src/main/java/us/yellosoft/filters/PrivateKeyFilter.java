package us.yellosoft.filters;

import java.io.File;
import javax.swing.filechooser.FileFilter;

/** Private key file selector */
public class PrivateKeyFilter extends FileFilter {
  /**
     <p>Accept only private key files</p>
     @param f file
     @return acceptibility
  */
  public final boolean accept(final File f) {
    // display all directories
    if (f.isDirectory()) {
      return true;
    }

    String extension = getExtension(f);

    // check to see if the extension is equal to "sk"
    return extension.equals("sk");
  }

  /**
     <p>Get description</p>
     @return description
  */
  public final String getDescription() {
    return "Private Key Files";
  }

  /**
     <p>Get file extension</p>
     @param f file
     @return file extension (lowercase)
  */
  private String getExtension(final File f) {
    String s = f.getName();
    int i = s.lastIndexOf('.');

    if (i > 0 && i < s.length() - 1) {
      return s.substring(i + 1).toLowerCase();
    } else {
      return "";
    }
  }
}
