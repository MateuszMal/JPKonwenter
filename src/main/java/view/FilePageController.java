package view;

import controller.Translator;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.DirectoryChooser;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import utils.DialogUtils;

import java.io.File;
import java.io.IOException;

public class FilePageController {

    private String inputPath;
    private String outputPath;

    @FXML
    private Button jpkFaButton1;
    @FXML
    private Label inputFilePath;
    @FXML
    private Label outputFilePath;


    @FXML
    private void switchToPrimary() throws IOException {
        App.setRoot("/fxml/startPage");
    }

    @FXML
    private void chooseInputFile(ActionEvent event) {
        FileChooser fc = new FileChooser();
        fc.setTitle("Wskaż plik");
        fc.getExtensionFilters().add(new FileChooser.ExtensionFilter("XML Files", "*.xml"));
        File file = fc.showOpenDialog(null);
        if (file != null) {
            System.out.println(file.getPath());
            inputPath = file.getPath();
            inputFilePath.setText(inputPath);
        }
    }

    @FXML
    private void chooseOutputFile(ActionEvent event) {
        Stage stage = (Stage) jpkFaButton1.getScene().getWindow();
        DirectoryChooser dc = new DirectoryChooser();
        File file = dc.showDialog(stage);

        if (file != null) {
            System.out.println(file.getPath());
            outputPath = file.getPath() + "/output.xml";
            outputFilePath.setText(outputPath);
        }
    }

    @FXML
    private void onMakeTransform(ActionEvent event) {
        if (inputPath != null) {
            if (outputPath != null) {
                Translator translator = new Translator(inputPath, outputPath);
                translator.transform();
                DialogUtils.succesAction();
            } else {
                DialogUtils.noOutputFile();
            }
        } else {
            DialogUtils.noInputFile();
        }
    }
}