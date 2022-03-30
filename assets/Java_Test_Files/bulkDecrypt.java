package com.singaporetech.audiorecorder;

import android.os.Build;

import androidx.annotation.RequiresApi;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.spec.KeySpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class bulkDecrypt {
    @RequiresApi(api = Build.VERSION_CODES.N)
    public static void main(String[] args) throws Exception {
        String rootDir = "/home/dev/";
        // TODO change path to dynamic
        List<String> folders = findFoldersInDirectory(rootDir);
        //List<String> folders = findFoldersInDirectory("/Users/seanteo/Documents/SIT Uni/Yr1 Tri2/ICT2207 - Mobile Security/Assignment 1_Decryptor/spy_test_target/");

        // filter folders and remove stuff without "target_"
        folders.removeIf(s -> !s.contains("target_"));
        // filtered folders print out
        System.out.println("[+] Listing all target directories");
        for (int i = 0; i < folders.size(); i++) {
            System.out.println("[-] /" + folders.get(i));
        }
        System.out.println("---------------");
        for (int x = 0; x < folders.size(); x++) {
            // ---------------------------------------------start of loop for each target
            // dir-------------------------------------------------------------------------------

            // get all file names in the directory and store as an array
            // Creating a File object for directory
            // TODO change path to dynamic
            String folderPath = rootDir + folders.get(x);
            //String folderPath = "/Users/seanteo/Documents/SIT Uni/Yr1 Tri2/ICT2207 - Mobile Security/Assignment 1_Decryptor/spy_test_target/" + folders.get(x);
            File directoryPath = new File(folderPath);
            folderPath = folderPath + "/";

            // List of all files and directories
            String contents[] = directoryPath.list();
            List<String> files = new ArrayList<String>();

            // copy array to arraylist
            for (int a = 0; a < contents.length; a++) {
                files.add(contents[a]);
            }

            // remove .DS_Store //for mac file system
            files.remove(".DS_Store");

            // TODO remove the txt files
            files.removeIf(s -> !s.contains(".enc"));

            // sort arraylist
            Collections.sort(files, Collections.reverseOrder());// reversed to get the audio file names

            // sorted print out
            //System.out.println("Listing files in " + folders.get(x));
            //for (int l = 0; l < files.size(); l++) {
            //      System.out.println(files.get(l));
            //}

            // TODO loop through each set of file, add 3 to counter at every iteration
            //System.out.println("List of audio files");
            for (int m = 0; m < files.size(); m = m + 3) {
                System.out.println("[+] Entering /" + folders.get(x));
                System.out.println("[-] Decrypting: " + files.get(m).substring(0, (files.get(m).length())));

                String password = "javapapers";
                String FN = files.get(m).substring(0, (files.get(m).length() - 4));
                FN = folderPath + FN;
                String saltFN = FN + "-salt.enc";
                String ivFN = FN + "-iv.enc";
                String encFileFN = FN + ".enc";

                // reading the salt
                // user should have secure mechanism to transfer the
                // salt, iv and password to the recipient
                FileInputStream saltFis = new FileInputStream(saltFN);
                byte[] salt = new byte[8];
                saltFis.read(salt);
                saltFis.close();

                // reading the iv
                FileInputStream ivFis = new FileInputStream(ivFN);
                byte[] iv = new byte[16];
                ivFis.read(iv);
                ivFis.close();

                SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
                KeySpec keySpec = new PBEKeySpec(password.toCharArray(), salt, 65536, 256);
                SecretKey tmp = factory.generateSecret(keySpec);
                SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");

                // file decryption
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(iv));
                FileInputStream fis = new FileInputStream(encFileFN);
                FileOutputStream fos = new FileOutputStream(FN);
                byte[] in = new byte[64];
                int read;
                while ((read = fis.read(in)) != -1) {
                    byte[] output = cipher.update(in, 0, read);
                    if (output != null)
                        fos.write(output);
                }

                byte[] output = cipher.doFinal();
                if (output != null)
                    fos.write(output);
                fis.close();
                fos.flush();
                fos.close();

                //delete enc files
                deleteFile(saltFN);
                deleteFile(ivFN);
                deleteFile(encFileFN);

                System.out.print("[+] File Successfully Decrypted To ");
                System.out.println(files.get(m).substring(0, (files.get(m).length() - 4)));
                System.out.println("---------------");
            }
        }
        System.out.println("All files decrypted");

    }

    public static List<String> findFoldersInDirectory(String directoryPath) {
        File directory = new File(directoryPath);

        FileFilter directoryFileFilter = new FileFilter() {
            public boolean accept(File file) {
                return file.isDirectory();
            }
        };

        File[] directoryListAsFile = directory.listFiles(directoryFileFilter);
        List<String> foldersInDirectory = new ArrayList<String>(directoryListAsFile.length);
        for (File directoryAsFile : directoryListAsFile) {
            foldersInDirectory.add(directoryAsFile.getName());
        }

        return foldersInDirectory;
    }

    public static void deleteFile(String file) {
        File myObj = new File(file);
        if (myObj.delete()) {
            System.out.println("[-] Deleted the folder: " + myObj.getName());
        } else {
            System.out.println("***** Failed to delete the folder.");
        }
    }

}