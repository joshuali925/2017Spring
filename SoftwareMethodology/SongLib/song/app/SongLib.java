// By Joshua Li and Dingbang Chen
package app;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import view.SongController;

public class SongLib extends Application {
	@Override
	public void start(Stage primaryStage) throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("/view/Song.fxml"));
		AnchorPane root = (AnchorPane) loader.load();

		SongController listController = loader.getController();
		listController.start(primaryStage);

		Scene scene = new Scene(root, 600, 300);
		primaryStage.setScene(scene);
		primaryStage.setResizable(false);
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch(args);
	}
}
