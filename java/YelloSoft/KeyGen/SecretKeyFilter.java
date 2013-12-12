//
// SecretKeyFilter
// Andrew Pennebaker
// June 12, 2004
//

import java.io.File;
import javax.swing.filechooser.FileFilter;

/** Secret key file selector */
public class SecretKeyFilter extends FileFilter {
  /**
     <p>Accept only secret key files</p>
     @param f file
     @return acceptibility
  */
  public final boolean accept(final File f) {
    // display all directories
    if (f.isDirectory()) {
      return true;
    }

    String extension = getExtension(f);

    // check to see if the extension is equal to "ser"
    return extension.equals("ser");
  }

  /**
     <p>Get description</p>
     @return description
  */
  public final String getDescription() {
    return "Secret keys";
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
    }
    else {
      return "";
    }
  }
}
