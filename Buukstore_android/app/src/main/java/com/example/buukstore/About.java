package com.example.buukstore;

import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.database.*;

public class About extends AppCompatActivity {
    DatabaseReference reference;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.about);

        String frameMap =
            "<html>" +
                "<body>" +
                    "<iframe width=\"335\" height=\"210\"" +
                    " src=\"https://www.google.com/maps/embed/v1/place?key=AIzaSyDdxPuSDIqfKBnj6GXm577fmgaRHlj_ZOA&q=CEP+CCIT+FTUI\"" +
                    " frameborder=\"0\"></iframe>" +
                "</body>" +
            "</html>";

        WebView displayMap = findViewById(R.id.mapView);
        displayMap.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return false;
            }
        });
        WebSettings webSettings = displayMap.getSettings();
        webSettings.setJavaScriptEnabled(true);
        displayMap.loadData(frameMap, "text/html", "utf-8");

    }
}