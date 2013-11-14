// PrivateKeyFilter
// Andrew Pennebaker
// June 12, 2004

import java.io.File;
import javax.swing.filechooser.FileFilter;

public class PrivateKeyFilter extends FileFilter {
  public final boolean accept(final File f) {
    // display all directories
    if (f.isDirectory()) {
      return true;
    }

    String extension = getExtension(f);

    // check to see if the extension is equal to "sk"
    return extension.equals("sk");
  }

  public final String getDescription() {
    return "Private Key Files";
  }

  // get extension of a file (lowercase)
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
