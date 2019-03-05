// By Joshua Li and Dingbang Chen

package view;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import app.Song;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

public class SongController {
    @FXML
    TableView<Song> tableView;
    @FXML
    TableColumn<Song, String> nameCol;
    @FXML
    TableColumn<Song, String> artistCol;
    @FXML
    Button addButton;
    @FXML
    Button editButton;
    @FXML
    Button deleteButton;
    @FXML
    Button clearButton;
    @FXML
    TextField nameText;
    @FXML
    TextField artistText;
    @FXML
    TextField albumText;
    @FXML
    TextField yearText;

    private ObservableList<Song> list;
    private Stage mainStage;

    public void start(Stage mainStage) {
        this.mainStage = mainStage;
    }

    @FXML
    private void initialize() {
        nameCol.setCellValueFactory(new PropertyValueFactory<>("name"));
        artistCol.setCellValueFactory(new PropertyValueFactory<>("artist"));
        list = FXCollections.observableArrayList();
        tableView.setItems(list);
        loadFromFile();
        FXCollections.sort(list);

        if (list.size() > 0) tableView.getSelectionModel().select(0);
        showDetails();
        tableView.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> showDetails());
    }

    public void addSong(ActionEvent e) {
        if (!popConfirm("Add this song?")) {
            showDetails();
            return;
        }
        Song oldSong = tableView.getSelectionModel().getSelectedItem();
        if (nameText.getText().trim().length() == 0 || artistText.getText().trim().length() == 0) {
            popAlert("Failed. Missing name or artist.");
            showDetails(oldSong);
            return;
        }
        Song newSong = new Song();
        newSong.setName(nameText.getText().trim());
        newSong.setArtist(artistText.getText().trim());
        newSong.setAlbum(albumText.getText().trim());
        newSong.setYear(yearText.getText().trim());

        for (int i = 0; i < list.size(); i++)
            if (list.get(i).getName().equalsIgnoreCase(newSong.getName())
                    && list.get(i).getArtist().equalsIgnoreCase(newSong.getArtist())) {
                popAlert("Failed. Duplicate song.");
                showDetails(oldSong);
                return;
            }
        int index = searchInsertPos(newSong);

        list.add(index, newSong);
        saveToFile();

        tableView.getSelectionModel().select(index);
        showDetails();
    }

    public void editSong(ActionEvent e) {
        int index = tableView.getSelectionModel().getSelectedIndex();
        if (index < 0) {
            popAlert("Need to select a song.");
            return;
        }
        if (!popConfirm("Edit this song?")) {
            showDetails();
            return;
        }
        Song oldSong = tableView.getSelectionModel().getSelectedItem();
        if (nameText.getText().trim().length() == 0 || artistText.getText().trim().length() == 0) {
            popAlert("Failed. Missing name or artist.");
            showDetails(oldSong);
            return;
        }
        Song newSong = new Song();
        newSong.setName(nameText.getText().trim());
        newSong.setArtist(artistText.getText().trim());
        newSong.setAlbum(albumText.getText().trim());
        newSong.setYear(yearText.getText().trim());

        for (int i = 0; i < list.size(); i++)
            if (i != index && list.get(i).getName().equalsIgnoreCase(newSong.getName())
                    && list.get(i).getArtist().equalsIgnoreCase(newSong.getArtist())) {
                popAlert("Failed. Duplicate song.");
                showDetails(oldSong);
                return;
            }

        list.remove(index);
        index = searchInsertPos(newSong);
        list.add(index, newSong);
        saveToFile();

        tableView.getSelectionModel().select(index);
        showDetails();
    }

    public void deleteSong(ActionEvent e) {
        int index = tableView.getSelectionModel().getSelectedIndex();
        if (index < 0) {
            popAlert("Need to select a song.");
            return;
        }
        if (!popConfirm("Delete this song?")) {
            showDetails();
            return;
        }
        list.remove(index);
        saveToFile();

        if (list.size() == 0) return;
        if (list.size() == index) index--;
        tableView.getSelectionModel().select(index);
    }

    public void clearText() {
        showDetails(null);
        tableView.getSelectionModel().select(null);
    }

    public void showDetails(Song song) {
        if (song != null) {
            nameText.setText(song.getName());
            artistText.setText(song.getArtist());
            albumText.setText(song.getAlbum());
            yearText.setText(song.getYear());
        } else {
            nameText.setText("");
            artistText.setText("");
            albumText.setText("");
            yearText.setText("");
        }
    }

    public void showDetails() {
        Song song = tableView.getSelectionModel().getSelectedItem();
        showDetails(song);
    }

    public void saveToFile() {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(new File("./song/app/data.txt")));
            for (Song song : list)
                writer.write(song.toString() + "=======================\n");
            writer.close();
        } catch (IOException e) {
            // e.printStackTrace();
        }
    }

    public void loadFromFile() {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(new File("./song/app/data.txt")));
            String name, artist, album, year;

            while ((name = reader.readLine()) != null) {
                if ((artist = reader.readLine()) == null) break;
                if ((album = reader.readLine()) == null) break;
                if ((year = reader.readLine()) == null) break;
                list.add(new Song(name, artist, album, year));
                if (reader.readLine() == null) break;
            }
            reader.close();
        } catch (IOException e) {
            // e.printStackTrace();
        }
    }

    public int searchInsertPos(Song song) {
        int lo = 0, hi = list.size() - 1, mid;
        while (lo <= hi) {
            mid = (lo + hi) / 2;
            if (list.get(mid).compareTo(song) > 0)
                hi = mid - 1;
            else if (list.get(mid).compareTo(song) < 0)
                lo = mid + 1;
            else
                return mid;
        }
        return lo;
    }

    public void popAlert(String message) {
        Alert alert = new Alert(AlertType.ERROR);
        alert.initOwner(mainStage);
        alert.setTitle("Alert");
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public boolean popConfirm(String message) {
        Alert alert = new Alert(AlertType.CONFIRMATION);
        alert.initOwner(mainStage);
        alert.setTitle("Confirmation");
        alert.setHeaderText(null);
        alert.setContentText(message);
        return alert.showAndWait().get() == ButtonType.OK;
    }
}
