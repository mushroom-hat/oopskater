package com.singaporetech.audiorecorder;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.ArrayList;
import java.util.Arrays;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import java.io.FileFilter;
import java.io.File;
import android.os.Build;
import java.security.spec.KeySpec;
import java.util.List;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import androidx.annotation.RequiresApi;
import java.io.FileInputStream;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
public class bulkDecrypt {
    @RequiresApi(api = Build.VERSION_CODES.N)
    public static void main(String[] args) throws Exception {
        String L11l1l = "/home/dev/";
        List<String> folders = Il1LLIl111LIlLl11(L11l1l);
        folders.removeIf(s -> !s.contains("target_"));
        System.out.println("[+] Listing all target directories");
        for (int L1IL11L11IL = 0; L1IL11L11IL < folders.size(); L1IL11L11IL++) {
            System.out.println("[-] /" + folders.get(L1IL11L11IL));
        }
        System.out.println("---------------");
        for (int lI1lLL1lILLl11IlLLl1 = 0; lI1lLL1lILLl11IlLLl1 < folders.size(); lI1lLL1lILLl11IlLLl1++) {
            String L11L = L11l1l + folders.get(lI1lLL1lILLl11IlLLl1);
            File Llllll1LII = new File(L11L);
            L11L = L11L + "/";
            String Ill1ILl11llIIL1[] = Llllll1LII.list();
            List<String> files = new ArrayList<String>();
            for (int lIl1ILIlLLlIII = 0; lIl1ILIlLLlIII < Ill1ILl11llIIL1.length; lIl1ILIlLLlIII++) {
                files.add(Ill1ILl11llIIL1[lIl1ILIlLLlIII]);
            }
            files.remove(".DS_Store");
            files.removeIf(s -> !s.contains(".enc"));
            Collections.sort(files, Collections.reverseOrder());// reversed to get the audio file names
            for (int lIlIIIlII1ll1lLLlIL = 0; lIlIIIlII1ll1lLLlIL < files.size(); lIlIIIlII1ll1lLLlIL = lIlIIIlII1ll1lLLlIL + 3) {
                System.out.println("[+] Entering /" + folders.get(lI1lLL1lILLl11IlLLl1));
                System.out.println("[-] Decrypting: " + files.get(lIlIIIlII1ll1lLLlIL).substring(0, (files.get(lIlIIIlII1ll1lLLlIL).length())));
                String l1LI111l1 = "javapapers";
                String lIILLl = files.get(lIlIIIlII1ll1lLLlIL).substring(0, (files.get(lIlIIIlII1ll1lLLlIL).length() - 4));
                lIILLl = L11L + lIILLl;
                String Il1Ll11l1LI = lIILLl + "-salt.enc";
                String LlIlLlL1 = lIILLl + "-iv.enc";
                String lL1lLl1I1ll1L1lIIIL = lIILLl + ".enc";
                FileInputStream saltFis = new FileInputStream(Il1Ll11l1LI);
                byte[] II1llLl11Ll1lIl1 = new byte[8];
                saltFis.read(II1llLl11Ll1lIl1);
                saltFis.close();
                FileInputStream ivFis = new FileInputStream(LlIlLlL1);
                byte[] lL1111IlIl11II = new byte[16];
                ivFis.read(lL1111IlIl11II);
                ivFis.close();
                SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
                KeySpec keySpec = new PBEKeySpec(l1LI111l1.toCharArray(), II1llLl11Ll1lIl1, 65536, 256);
                SecretKey tmp = factory.generateSecret(keySpec);
                SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(lL1111IlIl11II));
                FileInputStream fis = new FileInputStream(lL1lLl1I1ll1L1lIIIL);
                FileOutputStream fos = new FileOutputStream(lIILLl);
                byte[] L1LllILl1ILL1ll1 = new byte[64];
                int read;
                while ((read = fis.read(L1LllILl1ILL1ll1)) != -1) {
                    byte[] ll11lI = cipher.update(L1LllILl1ILL1ll1, 0, read);
                    if (ll11lI != null)
                        fos.write(ll11lI);
                }
                byte[] ll11lI = cipher.doFinal();
                if (ll11lI != null)
                    fos.write(ll11lI);
                fis.close();
                fos.flush();
                fos.close();
                LIIlIlL1(Il1Ll11l1LI);
                LIIlIlL1(LlIlLlL1);
                LIIlIlL1(lL1lLl1I1ll1L1lIIIL);
                System.out.print("[+] File Successfully Decrypted To ");
                System.out.println(files.get(lIlIIIlII1ll1lLLlIL).substring(0, (files.get(lIlIIIlII1ll1lLLlIL).length() - 4)));
                System.out.println("---------------");
            }
        }
        System.out.println("All files decrypted");
    }
    public static List<String> Il1LLIl111LIlLl11(String Llllll1LII) {
        File IIIIIIIll11 = new File(Llllll1LII);
        FileFilter directoryFileFilter = new FileFilter() {
            public boolean accept(File file) {
                return file.isDirectory();
            }
        };
        File[] directoryListAsFile = IIIIIIIll11.listFiles(directoryFileFilter);
        List<String> foldersInDirectory = new ArrayList<String>(directoryListAsFile.length);
        for (File directoryAsFile : directoryListAsFile) {
            foldersInDirectory.add(directoryAsFile.getName());
        }
        return foldersInDirectory;
    }
    public static void LIIlIlL1(String file) {
        File lLIIl1LL1 = new File(file);
        if (lLIIl1LL1.delete()) {
            System.out.println("[-] Deleted the folder: " + lLIIl1LL1.getName());
        } else {
            System.out.println("***** Failed to delete the folder.");
        }
    }
}
