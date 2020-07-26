package com.example.buukstore;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.google.firebase.database.*;

import java.util.ArrayList;

public class MainMenu extends AppCompatActivity {
    Button loginadmin,about;
    boolean backPressed = false;

    SwipeRefreshLayout swipeRefreshLayout;
    RecyclerView rcvBooks;
    BookAdapter adapterBook;
    ArrayList<Book> arrBooks;
    DatabaseReference mDatabase;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.mainmenu);

        initFirebase();
        addWidgets();
        setEventsWidget();
        initRecyclerView();
        retrieveFilms();

        loginadmin = findViewById(R.id.loginadmin);
        loginadmin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent login = new Intent(MainMenu.this, AdminLogin.class);
                startActivity(login);
            }
        });

        about = findViewById(R.id.about);
        about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent about = new Intent(MainMenu.this, About.class);
                startActivity(about);
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
                refreshListFilms();
            }
        });
    }

    private void refreshListFilms() {
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
        adapterBook = new BookAdapter(this, arrBooks);
        rcvBooks.setHasFixedSize(true);
        rcvBooks.setLayoutManager(new LinearLayoutManager(this));
        rcvBooks.setAdapter(adapterBook);
    }

    private void retrieveFilms() {
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

    @Override
    public void onBackPressed() {
        if(backPressed) {
            super.onBackPressed();
            Intent intent = new Intent(Intent.ACTION_MAIN);
            intent.addCategory(Intent.CATEGORY_HOME);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        } else {
            Toast.makeText(this,
                    "Press back button two times to exit the application",
                    Toast.LENGTH_LONG).show();
            backPressed = true;
            Handler handler = new Handler();
            handler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    backPressed = false;
                }
            }, 2000);
        }
    }
}