package com.example.buukstore;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.database.*;

import java.util.ArrayList;
import java.util.List;

public class FirebaseDatabaseHelper {

    private DatabaseReference mReferenceBook;
    private FirebaseDatabase mDatabase;
    private List<Book> book = new ArrayList<>();

    public interface DataStatus {
        void dataIsLoad(List<Book> book, List<String> keys);
        void dataIsUpdate();
        void dataIsDeleted();
    }

    public FirebaseDatabaseHelper() {
        mDatabase = FirebaseDatabase.getInstance();
        mReferenceBook = mDatabase.getReference("listbuku");
    }

    public void readBook(final DataStatus dataStatus) {
        mReferenceBook.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                book.clear();
                List<String> keys = new ArrayList<>();
                for(DataSnapshot keyNode:dataSnapshot.getChildren()) {
                    keys.add(keyNode.getKey());
                    Book buuk = keyNode.getValue(Book.class);
                    book.add(buuk);
                }
                dataStatus.dataIsLoad(book,keys);
            }
            @Override
            public void onCancelled(DatabaseError databaseError) {}
        });
    }

    public void updateBuuk(String key, Book book, final DataStatus dataStatus) {
        mReferenceBook.child(key).setValue(book).addOnSuccessListener(new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(Void aVoid) {
                dataStatus.dataIsUpdate();
            }
        });
    }

    public void deleteBuuk(String key, final DataStatus dataStatus) {
        mReferenceBook.child(key).setValue(null).addOnSuccessListener(new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(Void aVoid) {
                dataStatus.dataIsDeleted();
            }
        });
    }
}