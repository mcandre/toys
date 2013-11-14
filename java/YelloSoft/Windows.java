import java.awt.Window;
import java.awt.Dimension;
import java.awt.Toolkit;

public final class Windows {
  private Windows() {}

  public static void centerOnScreen(final Window window) {
    Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
    window.setLocation(
      (dimension.width - window.getSize().width) / 2,
      (dimension.height - window.getSize().height) / 2
    );
  }
}
