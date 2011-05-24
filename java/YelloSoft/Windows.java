import java.awt.*;

public class Windows {
	public static void centerOnScreen(Window window) {
		Dimension dimension=Toolkit.getDefaultToolkit().getScreenSize();
		window.setLocation(
			(dimension.width-window.getSize().width)/2,
			(dimension.height-window.getSize().height)/2
		);
	}
}