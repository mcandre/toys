package us.yellosoft;

import java.awt.Window;
import java.awt.Dimension;
import java.awt.Toolkit;

/** GUI window */
public final class Windows {
  /** utility class */
  private Windows() {}

  /**
     <p>Center window on screen</p>
     @param window a window
  */
  public static void centerOnScreen(final Window window) {
    Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
    window.setLocation(
      (dimension.width - window.getSize().width) / 2,
      (dimension.height - window.getSize().height) / 2
    );
  }
}
