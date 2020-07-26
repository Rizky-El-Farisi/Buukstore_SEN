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

import java.util.List;

public class AdminEditBook extends AppCompatActivity {
    EditText idbook, judul, genre, keterangan, harga;
    Button edit, delete, cancel;
    int id;
    String test;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_editbook);

        final Book book = (Book) getIntent().getSerializableExtra("book");
        id = getIntent().getExtras().getInt("id") + 1;
        idbook = findViewById(R.id.idbook);
        judul = findViewById(R.id.judul);
        genre = findViewById(R.id.genre);
        keterangan = findViewById(R.id.keterangan);
        harga = findViewById(R.id.harga);

        idbook.setText(Integer.toString(id));
        test = idbook.getText().toString();
        judul.setText(book.getJudul());
        genre.setText(book.getGenre());
        keterangan.setText(book.getKeterangan());
        harga.setText(book.getHarga());

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

        edit = findViewById(R.id.Editbook);
        edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String sIdbook = idbook.getText().toString();
                final String sJudul = judul.getText().toString();
                final String sGenre = genre.getText().toString();
                final String sKeterangan = keterangan.getText().toString();
                final String sHarga = harga.getText().toString();

                book.setJudul(judul.getText().toString());
                book.setGenre(genre.getText().toString());
                book.setKeterangan(keterangan.getText().toString());
                book.setHarga(harga.getText().toString());

                if (sIdbook.equals("") || sJudul.equals("") || sGenre.equals("") ||
                        sKeterangan.equals("") || sHarga.equals("")
                ) {
                    Toast.makeText(AdminEditBook.this,
                            "Please input all required fields before continue!",
                            Toast.LENGTH_LONG).show();
                } else {
                    final AlertDialog.Builder builder = new AlertDialog.Builder(AdminEditBook.this);
                    builder.setTitle("Proceed to update " + sJudul + " book data?");
                    builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            new FirebaseDatabaseHelper().updateBuuk(test, book, new FirebaseDatabaseHelper.DataStatus() {
                                @Override
                                public void dataIsLoad(List<Book> books, List<String> keys) {}

                                @Override
                                public void dataIsUpdate() {
                                    Toast.makeText(AdminEditBook.this,
                                            sJudul + " book data are updated successfully.",
                                            Toast.LENGTH_LONG).show();
                                    finish();
                                }

                                @Override
                                public void dataIsDeleted() {}
                            });
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

        delete = findViewById(R.id.deletebook);
        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String sIdbook = idbook.getText().toString();
                final String sJudul = judul.getText().toString();
                book.setJudul(judul.getText().toString());
                if (sIdbook.equals("")) {
                    Toast.makeText(AdminEditBook.this,
                            "Error in deleting a book!",
                            Toast.LENGTH_LONG).show();
                } else {
                    final AlertDialog.Builder builder = new AlertDialog.Builder(AdminEditBook.this);
                    builder.setTitle("Proceed to delete " + sJudul + " from book list?");
                    builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            new FirebaseDatabaseHelper().deleteBuuk(test, new FirebaseDatabaseHelper.DataStatus() {
                                @Override
                                public void dataIsLoad(List<Book> book, List<String> keys) {}

                                @Override
                                public void dataIsUpdate() {}

                                @Override
                                public void dataIsDeleted() {
                                    Toast.makeText(AdminEditBook.this,
                                            "A new book, " + sJudul + ", has been deleted successfully.",
                                            Toast.LENGTH_LONG).show();
                                    finish();
                                }
                            });
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
}