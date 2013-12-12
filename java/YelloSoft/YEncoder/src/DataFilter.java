//
// DataFilter
// Andrew Pennebaker
// June 10, 2004
//

import java.io.File;
import javax.swing.filechooser.FileFilter;

/** Data filter */
public class DataFilter extends FileFilter {
  /**
     <p>Select data files</p>
     @param f file
     @return whether the file is acceptable
  */
  public final boolean accept(final File f) {
    // display all directories
    if (f.isDirectory()) {
      return true;
    }

    String extension = getExtension(f);

    // check to see if the extension is equal to "dat" or ""
    return extension.equals("dat") || extension.equals("");
  }

  /**
     <p>Get description</p>
     @return description
  */
  public final String getDescription() {
    return "Data files";
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
