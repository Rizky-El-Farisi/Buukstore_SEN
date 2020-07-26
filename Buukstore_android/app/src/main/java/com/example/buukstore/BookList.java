package com.example.buukstore;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class BookList extends RecyclerView.Adapter<BookList.ViewHolder> {

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        public TextView judul, genre;

        public ViewHolder(View itemView) {
            super(itemView);
            judul = itemView.findViewById(R.id.judul);
            genre = itemView.findViewById(R.id.genre);
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View view) {
            int position = getAdapterPosition();
            if (position != RecyclerView.NO_POSITION) {
                Book book = listBooks.get(position);
                Intent intent = new Intent(context, AdminEditBook.class);
                intent.putExtra("id", position);
                intent.putExtra("book", book);
                context.startActivity(intent);
            }
        }
    }

    @Override
    public BookList.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(R.layout.bookfragment_admin, parent, false);
        return new ViewHolder(view);
    }

    Context context;
    ArrayList<Book> listBooks;

    public BookList(Context context, ArrayList<Book> listBooks) {
        this.context = context;
        this.listBooks = listBooks;
    }

    @Override
    public int getItemCount() {
        return listBooks.size();
    }

    @Override
    public void onBindViewHolder(BookList.ViewHolder holder, int position) {
        Book item = listBooks.get(position);
        holder.judul.setText(item.getJudul());
        holder.genre.setText(item.getGenre());
    }

    public void remove(int position) {
        listBooks.remove(position);
        notifyItemRemoved(position);
    }

    public void add(Book text, int position) {
        listBooks.add(position, text);
        notifyItemInserted(position);
    }
}