package com.example.buukstore;

import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;

public class ViewBookDetail extends AppCompatActivity {
    TextView judul, genre, keterangan, harga;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.viewbookdetail);

        final Book book = (Book) getIntent().getSerializableExtra("book");
        judul = findViewById(R.id.judul);
        genre = findViewById(R.id.genre);
        keterangan = findViewById(R.id.keterangan);
        harga = findViewById(R.id.harga);
        judul.setText(book.getJudul());
        genre.setText("Genre: " + book.getGenre());
        keterangan.setText("Keterangan: " + book.getKeterangan());
        harga.setText("Harga: " + book.getHarga());
    }
}