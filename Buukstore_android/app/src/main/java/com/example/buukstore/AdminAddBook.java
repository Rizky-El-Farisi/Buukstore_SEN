package com.example.buukstore;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.database.*;

public class AdminAddBook extends AppCompatActivity {
    EditText idbook,judul, keterangan, genre, harga;
    Button add, cancel;
    DatabaseReference mDatabase;

    Book book = new Book();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_add_book);

        idbook = findViewById(R.id.idbook);
        judul = findViewById(R.id.judul);
        genre = findViewById(R.id.genre);
        keterangan = findViewById(R.id.keterangan);
        harga = findViewById(R.id.harga);

        AutoCompleteTextView autogenre;
        String[] arr = {"Comedy","Adventure","Psikologi","Fantasi","Drama"};
        autogenre = findViewById(R.id.genre);
        ArrayAdapter<String> adapter = new ArrayAdapter<>
                (this, android.R.layout.select_dialog_item, arr);
        autogenre.setThreshold(1);
        autogenre.setAdapter(adapter);

        AutoCompleteTextView autoketerangan;
        String[] arr2 = {"English","Indonesian","Japanese","Mandarin","Korean"};
        autoketerangan = findViewById(R.id.keterangan);
        ArrayAdapter<String> adapter2 = new ArrayAdapter<>
                (this, android.R.layout.select_dialog_item, arr2);
        autoketerangan.setThreshold(1);
        autoketerangan.setAdapter(adapter2);

        AutoCompleteTextView autoharga;
        String[] arr3 = {"Rp.20.000","Rp.40.000","Rp.60.000","Rp.100.000"};
        autoharga = findViewById(R.id.harga);
        ArrayAdapter<String> adapter3 = new ArrayAdapter<>
                (this, android.R.layout.select_dialog_item, arr3);
        autoharga.setThreshold(1);
        autoharga.setAdapter(adapter3);

        add = findViewById(R.id.addbook);
        mDatabase= FirebaseDatabase.getInstance().getReference("listbuku");
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String sIdbuku = idbook.getText().toString();
                final String sJudul = judul.getText().toString();
                final String sGenre = genre.getText().toString();
                final String sKeterangan = keterangan.getText().toString();
                final String sHarga = harga.getText().toString();
                getVelue();

                if (sIdbuku.equals("") || sJudul.equals("") || sGenre.equals("") ||
                        sKeterangan.equals("") || sHarga.equals("")
                        ) {
                    Toast.makeText(AdminAddBook.this,
                            "Please input all required fields before continue!",
                            Toast.LENGTH_LONG).show();
                } else {
                    final AlertDialog.Builder builder = new AlertDialog.Builder(AdminAddBook.this);
                    builder.setTitle("Proceed to add " + sJudul + " as a new book?");
                    builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            mDatabase.child(sIdbuku).setValue(book);
                            Toast.makeText(AdminAddBook.this,
                                    "A new book, " + sJudul + ", has been added successfully.",
                                    Toast.LENGTH_LONG).show();
                            finish();
                        }
                    });
                    builder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {}
                    });
                    builder.create().show();
                }
            }
        });

        cancel= findViewById(R.id.cancel);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void getVelue() {
        book.setJudul(judul.getText().toString());
        book.setGenre(genre.getText().toString());
        book.setKeterangan(keterangan.getText().toString());
        book.setHarga(harga.getText().toString());
    }
}