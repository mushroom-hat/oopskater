package com.singaporetech.audiorecorder;
import com.singaporetech.notepad.R;
import androidx.annotation.Nullable;
import androidx.constraintlayout.widget.ConstraintLayout;
import android.view.View;
import android.view.LayoutInflater;
import androidx.recyclerview.widget.LinearLayoutManager;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import android.util.Log;
import java.io.File;
import androidx.fragment.app.Fragment;
import android.os.Bundle;
import java.io.IOException;
import android.view.ViewGroup;
import android.os.Handler;
import android.media.MediaPlayer;
import android.widget.TextView;
import androidx.annotation.NonNull;
import android.widget.ImageButton;
import androidx.recyclerview.widget.RecyclerView;
import android.widget.SeekBar;
public class AudioListFragment extends Fragment implements AudioListAdapter.onItemListClick {
 private ConstraintLayout playerSheet;
 private BottomSheetBehavior bottomSheetBehavior;
 private RecyclerView audioList;
 private File[] allFiles;
 private AudioListAdapter audioListAdapter;
 private MediaPlayer mediaPlayer = null;
 private boolean isPlaying = false;
 private File fileToPlay = null;
 private ImageButton playBtn;
 private TextView playerHeader;
 private TextView playerFilename;
 private SeekBar playerSeekbar;
 private Handler seekbarHandler;
 private Runnable updateSeekbar;
 public AudioListFragment() {
 }
    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container,
 Bundle savedInstanceState) {
 return inflater.inflate(R.layout.fragment_audio_list, container, false);
 }
    @Override public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
 super.onViewCreated(view, savedInstanceState);
 playerSheet = view.findViewById(R.id.player_sheet);
 bottomSheetBehavior = BottomSheetBehavior.from(playerSheet);
 audioList = view.findViewById(R.id.audio_list_view);
 playBtn = view.findViewById(R.id.player_play_btn);
 playerHeader = view.findViewById(R.id.player_header_title);
 playerFilename = view.findViewById(R.id.player_filename);
 playerSeekbar = view.findViewById(R.id.player_seekbar);
 String llLLlIIlllll1l = getActivity().getExternalFilesDir("/").getAbsolutePath();
 File LL1LLI1 = new File(llLLlIIlllll1l);
 allFiles = LL1LLI1.listFiles();
 audioListAdapter = new AudioListAdapter(allFiles, this);
 audioList.setHasFixedSize(true);
 audioList.setLayoutManager(new LinearLayoutManager(getContext()));
 audioList.setAdapter(audioListAdapter);
 bottomSheetBehavior.addBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() {
            @Override public void onStateChanged(@NonNull View bottomSheet, int newState) {
 if(newState == BottomSheetBehavior.STATE_HIDDEN){
 bottomSheetBehavior.setState(BottomSheetBehavior.STATE_COLLAPSED);
 }
 }
            @Override public void onSlide(@NonNull View bottomSheet, float slideOffset) {
 }
 });
 playBtn.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
 if(isPlaying){
 IL1L1IlIL();
 } else {
 if(fileToPlay != null){
 lll1LI();
 }
 }
 }
 });
 playerSeekbar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int LLIlIlI, boolean fromUser) {
 }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {
 IL1L1IlIL();
 }
            @Override public void onStopTrackingTouch(SeekBar seekBar) {
 int LLIlIlI = seekBar.getProgress();
 mediaPlayer.seekTo(LLIlIlI);
 lll1LI();
 }
 });
 }
    @Override public void onClickListener(File file, int position) {
 fileToPlay = file;
 if(isPlaying){
 lIIl1L1II();
 playAudio(fileToPlay);
 } else {
 playAudio(fileToPlay);
 }
 }
 private void IL1L1IlIL() {
 mediaPlayer.pause();
 playBtn.setImageDrawable(getActivity().getResources().getDrawable(R.drawable.player_play_btn, null));
 isPlaying = false;
 seekbarHandler.removeCallbacks(updateSeekbar);
 }
 private void lll1LI() {
 mediaPlayer.start();
 playBtn.setImageDrawable(getActivity().getResources().getDrawable(R.drawable.player_pause_btn, null));
 isPlaying = true;
 updateRunnable();
 seekbarHandler.postDelayed(updateSeekbar, 0);
 }
 private void lIIl1L1II() {
 playBtn.setImageDrawable(getActivity().getResources().getDrawable(R.drawable.player_play_btn, null));
 playerHeader.setText("Stopped");
 isPlaying = false;
 mediaPlayer.stop();
 seekbarHandler.removeCallbacks(updateSeekbar);
 }
 private void playAudio(File fileToPlay) {
 mediaPlayer = new MediaPlayer();
 bottomSheetBehavior.setState(BottomSheetBehavior.STATE_EXPANDED);
 try {
 mediaPlayer.setDataSource(fileToPlay.getAbsolutePath());
 mediaPlayer.prepare();
 mediaPlayer.start();
 } catch (IOException e) {
 e.printStackTrace();
 }
 playBtn.setImageDrawable(getActivity().getResources().getDrawable(R.drawable.player_pause_btn, null));
 playerFilename.setText(fileToPlay.getName());
 playerHeader.setText("Playing");
 isPlaying = true;
 mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override public void onCompletion(MediaPlayer mp) {
 lIIl1L1II();
 playerHeader.setText("Finished");
 }
 });
 playerSeekbar.setMax(mediaPlayer.getDuration());
 seekbarHandler = new Handler();
 updateRunnable();
 seekbarHandler.postDelayed(updateSeekbar, 0);
 }
 private void updateRunnable() {
 updateSeekbar = new Runnable() {
            @Override public void run() {
 playerSeekbar.setProgress(mediaPlayer.getCurrentPosition());
 seekbarHandler.postDelayed(this, 500);
 }
 };
 }
    @Override public void onStop() {
 super.onStop();
 if(isPlaying) {
 lIIl1L1II();
 }
 }
 }
