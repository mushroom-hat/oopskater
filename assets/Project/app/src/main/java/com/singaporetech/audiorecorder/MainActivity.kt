package com.singaporetech.audiorecorder

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.Window
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.singaporetech.notepad.R
import com.singaporetech.notepad.old.activity.MainActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            val pref = getSharedPreferences(packageName + "_preferences", MODE_PRIVATE)
            val theme = pref.getString("theme", "light-sans")
            var navbarColorId = -1
            var navbarDividerColorId = -1
            var sysUiVisibility = -1
            if (theme!!.contains("light")) {
                navbarColorId = R.color.navbar_color_light
                navbarDividerColorId = R.color.navbar_divider_color_light
                sysUiVisibility = View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
            }
            if (theme!!.contains("dark")) {
                navbarColorId = R.color.navbar_color_dark
                navbarDividerColorId = R.color.navbar_divider_color_dark
                sysUiVisibility = View.SYSTEM_UI_FLAG_VISIBLE
            }
            window.navigationBarColor = ContextCompat.getColor(this, navbarColorId)
            findViewById<View>(Window.ID_ANDROID_CONTENT).systemUiVisibility =
                sysUiVisibility
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) window.navigationBarDividerColor =
                ContextCompat.getColor(this, navbarDividerColorId)
        }

        // TODO findviewbyid for the UI elements

        // TODO set onClickListeners to all the buttons here
        //  or declare the onclick method within the layout XML?

        val redirectToRecordingIntent = findViewById(R.id.button_recordings) as Button
        // set on-click listener
        redirectToRecordingIntent.setOnClickListener {
            // your code to perform when the user clicks on the button
            //Toast.makeText(this@MainActivity, "You clicked me.", Toast.LENGTH_SHORT).show()
            val intent = Intent(this, RecordingActivity::class.java);
            // start your next activity
            startActivity(intent)
        }

        val redirectToTakeNotesIntent = findViewById(R.id.button_notes) as Button
        // set on-click listener
        redirectToTakeNotesIntent.setOnClickListener {
            // your code to perform when the user clicks on the button
            //Toast.makeText(this@MainActivity, "You clicked me.", Toast.LENGTH_SHORT).show()
            val intent = Intent(this, MainActivity::class.java);
            // start your next activity
            startActivity(intent)
        }

    }
}