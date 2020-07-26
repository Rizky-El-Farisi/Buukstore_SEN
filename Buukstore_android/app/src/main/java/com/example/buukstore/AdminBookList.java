package com.example.buukstore;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.google.firebase.database.*;

import java.util.ArrayList;

public class AdminBookList extends AppCompatActivity {

    SwipeRefreshLayout swipeRefreshLayout;
    RecyclerView rcvBooks;
    BookList adapterBook;
    ArrayList<Book> arrBooks;
    DatabaseReference mDatabase;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_booklist);

        initFirebase();
        addWidgets();
        setEventsWidget();
        initRecyclerView();
        retrieveBooks();

        findViewById(R.id.addbook).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent addbook = new Intent(AdminBookList.this, AdminAddBook.class);
                startActivity(addbook);
            }
        });

        findViewById(R.id.logout).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final AlertDialog.Builder builder = new AlertDialog.Builder(AdminBookList.this);
                builder.setTitle("Do you want to log out?");
                builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        Preferences.clearLoggedInUser(getBaseContext());
                        startActivity(new Intent(getBaseContext(),MainMenu.class));
                        finish();
                    }
                });
                builder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {}
                });
                builder.create().show();
            }
        });
    }

    private void addWidgets() {
        swipeRefreshLayout = findViewById(R.id.swipeRefreshLayout);
    }

    private void setEventsWidget() {
        swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                refreshListBooks();
            }
        });
    }

    private void refreshListBooks() {
        mDatabase.child("listbuku").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot == null) return;
                arrBooks.clear();
                for (DataSnapshot item : dataSnapshot.getChildren()) {
                    arrBooks.add(item.getValue(Book.class));
                }
                adapterBook.notifyDataSetChanged();
                swipeRefreshLayout.setRefreshing(false);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {}
        });
    }

    private void initFirebase() {
        mDatabase = FirebaseDatabase.getInstance().getReference();
    }

    private void initRecyclerView() {
        rcvBooks = findViewById(R.id.rcvBooks);
        arrBooks = new ArrayList<Book>();
        adapterBook = new BookList(this, arrBooks);
        rcvBooks.setHasFixedSize(true);
        rcvBooks.setLayoutManager(new LinearLayoutManager(this));
        rcvBooks.setAdapter(adapterBook);
    }

    private void retrieveBooks() {
        mDatabase.child("listbuku").addChildEventListener(new ChildEventListener() {
            @Override
            public void onChildAdded(DataSnapshot dataSnapshot, String s) {
                if (dataSnapshot == null) return;
                arrBooks.add(dataSnapshot.getValue(Book.class));
                adapterBook.notifyItemInserted(arrBooks.size()-1);
            }

            @Override
            public void onChildChanged(DataSnapshot dataSnapshot, String s) {}

            @Override
            public void onChildRemoved(DataSnapshot dataSnapshot) {}

            @Override
            public void onChildMoved(DataSnapshot dataSnapshot, String s) {}

            @Override
            public void onCancelled(DatabaseError databaseError) {}
        });
    }
}