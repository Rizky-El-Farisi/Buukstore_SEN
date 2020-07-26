package com.example.buukstore;

import java.io.Serializable;

public class Book implements Serializable {
    private String judul, genre, keterangan,
            harga, image;

    public Book() {}

    public Book(String judul, String genre, String keterangan
    ) {
        this.judul = judul;
        this.genre = genre;
        this.keterangan = keterangan;
        this.harga = harga;
    }

    public String getJudul() {
        return judul;
    }
    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getKeterangan() {return keterangan;}
    public void setKeterangan(String keterangan) {this.keterangan = keterangan;}

    public String getHarga() {return harga;}
    public void setHarga(String harga) {this.harga = harga;}

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
}