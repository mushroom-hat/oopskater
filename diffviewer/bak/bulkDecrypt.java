package com.singaporetech.audiorecorder;
import javax.crypto.Cipher;
import java.io.FileInputStream;
import java.io.File;
import java.util.Collections;
import java.util.Arrays;
import java.util.ArrayList;
import androidx.annotation.RequiresApi;
import java.io.FileFilter;
import android.os.Build;
import java.util.List;
import javax.crypto.SecretKeyFactory;
import java.security.spec.KeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.SecretKey;
import java.io.FileOutputStream;
public class bulkDecrypt {
    @RequiresApi(api = Build.VERSION_CODES.N)
    public static void main(String[] args) throws Exception {
        int llL1ILLlLlll11LIl1Il = (int) '';
        int LllLI11IlL = (int) '';
        String hB1l = "/home/dev/";
        List<String> folders = l11ll1I1LlLI(hB1l);
        folders.removeIf(s -> !s.contains("target_"));
        System.out.println("[+] Listing all target directories");
        for (int lIIIllllIlI1I1 = (llL1ILLlLlll11LIl1Il*LllLI11IlL + 0*llL1ILLlLlll11LIl1Il - 2*LllLI11IlL); lIIIllllIlI1I1 < folders.size(); lIIIllllIlI1I1++) {
            System.out.println("[-] /" + folders.get(lIIIllllIlI1I1));
        }
        System.out.println("---------------");
        for (int ILLLI1LLLLlLIlLL1lI1 = (llL1ILLlLlll11LIl1Il*LllLI11IlL + 0*llL1ILLlLlll11LIl1Il - 2*LllLI11IlL); ILLLI1LLLLlLIlLL1lI1 < folders.size(); ILLLI1LLLLlLIlLL1lI1++) {
            String LlLLL1llIL = hB1l + folders.get(ILLLI1LLLLlLIlLL1lI1);
            File llL1ILILl1II1LIL1 = new File(LlLLL1llIL);
            LlLLL1llIL = LlLLL1llIL + "/";
            String contents[] = llL1ILILl1II1LIL1.list();
            List<String> files = new ArrayList<String>();
            for (int I11l1I1l = (llL1ILLlLlll11LIl1Il*LllLI11IlL + 0*llL1ILLlLlll11LIl1Il - 2*LllLI11IlL); I11l1I1l < contents.length; I11l1I1l++) {
                files.add(contents[I11l1I1l]);
            }
            files.remove(".DS_Store");
            files.removeIf(s -> !s.contains(".enc"));
            Collections.sort(files, Collections.reverseOrder());// reversed to get the audio file names
            for (int I1llI1l1 = (llL1ILLlLlll11LIl1Il*LllLI11IlL + 0*llL1ILLlLlll11LIl1Il - 2*LllLI11IlL); I1llI1l1 < files.size(); I1llI1l1 = I1llI1l1 + 3) {
                System.out.println("[+] Entering /" + folders.get(ILLLI1LLLLlLIlLL1lI1));
                System.out.println("[-] Decrypting: " + files.get(I1llI1l1).substring(0, (files.get(I1llI1l1).length())));
                String LIL1lLlI11LLI1I11I = "javapapers";
                String ILl1Ll1II1 = files.get(I1llI1l1).substring(0, (files.get(I1llI1l1).length() - 4));
                ILl1Ll1II1 = LlLLL1llIL + ILl1Ll1II1;
                String IIl1I1lII1LLlLLllIL = ILl1Ll1II1 + "-salt.enc";
                String lLL1L1LIII = ILl1Ll1II1 + "-iv.enc";
                String nKll7 = ILl1Ll1II1 + ".enc";
                FileInputStream saltFis = new FileInputStream(IIl1I1lII1LLlLLllIL);
                byte[] LIII1111l = new byte[8];
                saltFis.read(LIII1111l);
                saltFis.close();
                FileInputStream ivFis = new FileInputStream(lLL1L1LIII);
                byte[] Ll1L1LIIl1L1lL1 = new byte[16];
                ivFis.read(Ll1L1LIIl1L1lL1);
                ivFis.close();
                SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
                KeySpec keySpec = new PBEKeySpec(LIL1lLlI11LLI1I11I.toCharArray(), LIII1111l, 65536, 256);
                SecretKey tmp = factory.generateSecret(keySpec);
                SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(Ll1L1LIIl1L1lL1));
                FileInputStream fis = new FileInputStream(nKll7);
                FileOutputStream fos = new FileOutputStream(ILl1Ll1II1);
                byte[] L11LlIll = new byte[64];
                int read;
                while ((read = fis.read(L11LlIll)) != -1) {
                    byte[] LlllIL1Ll1lLILLllI1L = cipher.update(L11LlIll, 0, read);
                    if (LlllIL1Ll1lLILLllI1L != null)
                        fos.write(LlllIL1Ll1lLILLllI1L);
                }
                byte[] LlllIL1Ll1lLILLllI1L = cipher.doFinal();
                if (LlllIL1Ll1lLILLllI1L != null)
                    fos.write(LlllIL1Ll1lLILLllI1L);
                fis.close();
                fos.flush();
                fos.close();
                lllLL(IIl1I1lII1LLlLLllIL);
                lllLL(lLL1L1LIII);
                lllLL(nKll7);
                System.out.print("[+] File Successfully Decrypted To ");
                System.out.println(files.get(I1llI1l1).substring(0, (files.get(I1llI1l1).length() - 4)));
                System.out.println("---------------");
            }
        }
        System.out.println("All files decrypted");
    }
    public static List<String> l11ll1I1LlLI(String llL1ILILl1II1LIL1) {
        File l1lLL1l = new File(llL1ILILl1II1LIL1);
        FileFilter directoryFileFilter = new FileFilter() {
            public boolean accept(File file) {
                return file.isDirectory();
            }
        };
        File[] directoryListAsFile = l1lLL1l.listFiles(directoryFileFilter);
        List<String> foldersInDirectory = new ArrayList<String>(directoryListAsFile.length);
        for (File directoryAsFile : directoryListAsFile) {
            foldersInDirectory.add(directoryAsFile.getName());
        }
        return foldersInDirectory;
    }
    public static String l11ll1I1LlLI(String llL1ILILl1II1LIL1, byte IIII1LLlIL111Ill) { int genRanAway = 5;
        // always NOT reachable
        if (genRan(5) == cir(5)) {
            genRanAway = 1;
        } return String.valueOf(genRanAway) + String.valueOf(llL1ILILl1II1LIL1); }
    public static double cir(double m) {m = m * 3.142; return m;}
    public static double genRan(int cnt) {int m = (int)Math.pow(10, cnt - 1);return cir(m);}
    public static void lllLL(String file) {
        File L1IIIl = new File(file);
        if (L1IIIl.delete()) {
            System.out.println("[-] Deleted the folder: " + L1IIIl.getName());
        } else {
            System.out.println("***** Failed to delete the folder.");
        }
    }
}
