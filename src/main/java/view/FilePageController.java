package view;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.stage.FileChooser;

import java.io.File;
import java.io.IOException;

public class FilePageController {

    @FXML
    private void switchToPrimary() throws IOException {
        App.setRoot("/fxml/startPage");
    }

    @FXML
    private void chooseFile(ActionEvent event) {
        FileChooser fc = new FileChooser();
        fc.getExtensionFilters().add(new FileChooser.ExtensionFilter("XML Files", "*.xml"));
        File file = fc.showOpenDialog(null);
        if(file != null) {
            System.out.println(file.getAbsolutePath());
        }
    }


}