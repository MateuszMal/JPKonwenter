package view;

import java.io.IOException;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class StartPageController {

    @FXML
    private Button exitButton;

    @FXML
    private void onStartButton() throws IOException {
        App.setRoot("/fxml/filePage");
    }

    @FXML
    private void onExitButton() {
        Stage stage = (Stage) exitButton.getScene().getWindow();
        stage.close();
    }
}
