// By Joshua Li and Dingbang Chen
package app;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Song implements Comparable<Song> {
	StringProperty name;
	StringProperty artist;
	StringProperty album;
	StringProperty year;

	public Song() {
		this("", "");
	}

	public Song(String name, String artist) {
		this(name, artist, "", "");
	}

	public Song(String name, String artist, String album, String year) {
		this.name = new SimpleStringProperty(name);
		this.artist = new SimpleStringProperty(artist);
		this.album = new SimpleStringProperty(album);
		this.year = new SimpleStringProperty(year);
	}

	public String getName() {
		return name.get();
	}

	public void setName(String name) {
		this.name.set(name);
	}

	public StringProperty getNameProperty() {
		return name;
	}

	public String getArtist() {
		return artist.get();
	}

	public void setArtist(String artist) {
		this.artist.set(artist);
	}

	public StringProperty getArtistProperty() {
		return artist;
	}

	public String getAlbum() {
		return album.get();
	}

	public void setAlbum(String album) {
		this.album.set(album);
	}

	public StringProperty getAlbumProperty() {
		return album;
	}

	public String getYear() {
		return year.get();
	}

	public void setYear(String year) {
		this.year.set(year);
	}

	public StringProperty getYearProperty() {
		return year;
	}

	@Override
	public String toString() {
		return getName() + "\n" + getArtist() + "\n" + getAlbum() + "\n" + getYear() + "\n";
	}

	@Override
	public int compareTo(Song o) {
		if (getName().compareTo(o.getName()) == 0)
			return getArtist().compareTo(o.getArtist());
		return getName().compareTo(o.getName());
	}
}
