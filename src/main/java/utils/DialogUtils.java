package utils;

import javafx.scene.control.Alert;

public class DialogUtils {
    public static void noInputFile(){
        Alert noInputFileAlert = new Alert(Alert.AlertType.INFORMATION);
        noInputFileAlert.setTitle("Uwaga!");
        noInputFileAlert.setHeaderText("Nie możesz wykonać");
        noInputFileAlert.setContentText("Nie wskazałeś pliku wejściowego!");
        noInputFileAlert.showAndWait();
    }

    public static void noOutputFile(){
        Alert noOutputFileAlert = new Alert(Alert.AlertType.INFORMATION);
        noOutputFileAlert.setTitle("Uwaga!");
        noOutputFileAlert.setHeaderText("Nie możesz wykonać");
        noOutputFileAlert.setContentText("Nie wskazałeś pliku wyjściowego!");
        noOutputFileAlert.showAndWait();
    }

    public static void succesAction(){
        Alert succesAlert = new Alert(Alert.AlertType.INFORMATION);
        succesAlert.setTitle("Uwaga!");
        succesAlert.setHeaderText("Udało się!");
        succesAlert.setContentText("Ta czynność zakończyła się pomyślnie");
        succesAlert.showAndWait();
    }
}
