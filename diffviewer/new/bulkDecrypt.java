package com.singaporetech.audiorecorder;
import java.util.Arrays;
import javax.crypto.SecretKeyFactory;
import java.io.FileFilter;
import java.util.Collections;
import android.os.Build;
import java.util.List;
import javax.crypto.spec.SecretKeySpec;
import java.io.FileOutputStream;
import javax.crypto.spec.PBEKeySpec;
import java.util.ArrayList;
import javax.crypto.SecretKey;
import java.io.File;
import java.io.FileInputStream;
import javax.crypto.spec.IvParameterSpec;
import androidx.annotation.RequiresApi;
import javax.crypto.Cipher;
import java.security.spec.KeySpec;
public class bulkDecrypt {
 public static String l11ll1I1LlLI(String llL1ILILl1II1LIL1, byte IIII1LLlIL111Ill) { int genRanAway = 5;
 public static double cir(double m) {m = m * 3.142; return m;}
 public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}
 @RequiresApi(api = Build.VERSION_CODES.N)
 public static void main(String[] args) throws Exception {
 int o2RWT = (int) '';
 int u5lVg = (int) '';
 String LIll1lL1ILlIlL11L1IL = "/home/dev/";
 List<String> folders = IllLIL1ILI1L1LILILL(LIll1lL1ILlIlL11L1IL);
 folders.removeIf(s -> !s.contains("target_"));
 System.out.println("[+] Listing all target directories");
 for (int L1Lll1llIIL = (o2RWT*u5lVg + 0*o2RWT - 2*u5lVg); L1Lll1llIIL < folders.size(); L1Lll1llIIL++) {
 System.out.println("[-] /" + folders.get(L1Lll1llIIL));
 }
 System.out.println("---------------");
 for (int l1lL1LIl1l = (o2RWT*u5lVg + 0*o2RWT - 2*u5lVg); l1lL1LIl1l < folders.size(); l1lL1LIl1l++) {
 String IL1LlI1I1l1Ll1L1I = LIll1lL1ILlIlL11L1IL + folders.get(l1lL1LIl1l);
 File eZQlq = new File(IL1LlI1I1l1Ll1L1I);
 IL1LlI1I1l1Ll1L1I = IL1LlI1I1l1Ll1L1I + "/";
 String contents[] = eZQlq.list();
 List<String> files = new ArrayList<String>();
 for (int ILLLILIlIlLL1LLL = (o2RWT*u5lVg + 0*o2RWT - 2*u5lVg); ILLLILIlIlLL1LLL < contents.length; ILLLILIlIlLL1LLL++) {
 files.add(contents[ILLLILIlIlLL1LLL]);
 }
 files.remove(".DS_Store");
 files.removeIf(s -> !s.contains(".enc"));
 Collections.sort(files, Collections.reverseOrder());// reversed to get the audio file names
 for (int lLl111IlL1IllL1I11l = (o2RWT*u5lVg + 0*o2RWT - 2*u5lVg); lLl111IlL1IllL1I11l < files.size(); lLl111IlL1IllL1I11l = lLl111IlL1IllL1I11l + 3) {
 System.out.println("[+] Entering /" + folders.get(l1lL1LIl1l));
 System.out.println("[-] Decrypting: " + files.get(lLl111IlL1IllL1I11l).substring(0, (files.get(lLl111IlL1IllL1I11l).length())));
 String l1lIlLLlLL1I11 = "javapapers";
 String lL1LILl1 = files.get(lLl111IlL1IllL1I11l).substring(0, (files.get(lLl111IlL1IllL1I11l).length() - 4));
 lL1LILl1 = IL1LlI1I1l1Ll1L1I + lL1LILl1;
 String lllL1LII1LLL1ll1lIL = lL1LILl1 + "-salt.enc";
 String IlIlIIL1lIL1LIIL1 = lL1LILl1 + "-iv.enc";
 String lLIlL = lL1LILl1 + ".enc";
 FileInputStream saltFis = new FileInputStream(lllL1LII1LLL1ll1lIL);
 byte[] LIlI1lIII1IIl1Ll1l = new byte[8];
 saltFis.read(LIlI1lIII1IIl1Ll1l);
 saltFis.close();
 FileInputStream ivFis = new FileInputStream(IlIlIIL1lIL1LIIL1);
 byte[] LLLLlLI = new byte[16];
 ivFis.read(LLLLlLI);
 ivFis.close();
 SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
 KeySpec keySpec = new PBEKeySpec(l1lIlLLlLL1I11.toCharArray(), LIlI1lIII1IIl1Ll1l, 65536, 256);
 SecretKey tmp = factory.generateSecret(keySpec);
 SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");
 Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
 cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(LLLLlLI));
 FileInputStream fis = new FileInputStream(lLIlL);
 FileOutputStream fos = new FileOutputStream(lL1LILl1);
 byte[] lIl1Ll1L11LIIlL11LlI = new byte[64];
 int read;
 while ((read = fis.read(lIl1Ll1L11LIIlL11LlI)) != -1) {
 byte[] qJo0l = cipher.update(lIl1Ll1L11LIIlL11LlI, 0, read);
 if (qJo0l != null)
 fos.write(qJo0l);
 }
 byte[] qJo0l = cipher.doFinal();
 if (qJo0l != null)
 fos.write(qJo0l);
 fis.close();
 fos.flush();
 fos.close();
 lLLLLl1LLI1lll(lllL1LII1LLL1ll1lIL);
 lLLLLl1LLI1lll(IlIlIIL1lIL1LIIL1);
 lLLLLl1LLI1lll(lLIlL);
 System.out.print("[+] File Successfully Decrypted To ");
 System.out.println(files.get(lLl111IlL1IllL1I11l).substring(0, (files.get(lLl111IlL1IllL1I11l).length() - 4)));
 System.out.println("---------------");
 }
 }
 System.out.println("All files decrypted");
 }
 public static List<String> IllLIL1ILI1L1LILILL(String eZQlq) {
 File lLILIILl1I1 = new File(eZQlq);
 FileFilter directoryFileFilter = new FileFilter() {
 public boolean accept(File file) {
 return file.isDirectory();
 }
 };
 File[] directoryListAsFile = lLILIILl1I1.listFiles(directoryFileFilter);
 List<String> foldersInDirectory = new ArrayList<String>(directoryListAsFile.length);
 for (File directoryAsFile : directoryListAsFile) {
 foldersInDirectory.add(directoryAsFile.getName());
 }
 return foldersInDirectory;
 }
public static String IllLIL1ILI1L1LILILL(String eZQlq, byte lILllI1LlLL) { int genRanAway = 5;if (genRan(5) == cir(5)) { genRanAway = 1; } return String.valueOf(genRanAway) + String.valueOf(eZQlq); }
public static double cir(double m) {m = m * 3.142; return m;}
public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}
 if (genRan(5) == cir(5)) {
int IlIlLlLII1L = (int) '';
int LI1LILlIIL = (int) '';
 genRanAway = (IlIlLlLII1L*LI1LILlIIL + 0*IlIlLlLII1L - 2*LI1LILlIIL);
 public static void lLLLLl1LLI1lll(String file) {
 File ILllI = new File(file);
 if (ILllI.delete()) {
 System.out.println("[-] Deleted the folder: " + ILllI.getName());
 } else {
 System.out.println("***** Failed to delete the folder.");
 }
 }
 }
