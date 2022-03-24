import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import javax.crypto.Cipher;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Key;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

public class Server {
    private static DataOutputStream dataOutputStream = null;
    private static DataInputStream dataInputStream = null;
    private static String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJrof4+Y82eHWBlZY2EFmI18z1JHnG+aFAI5bcKUdQEbaSfhfLXlgve9xtDYdn7xVysMPniu+P3edKqPCIueNYjg5EA2y3NbFfkqBYzPQOvw7OZZdhvriDZi0CCEt9zgh0kJ3eLrN8hFOQoP7U4Oiw6GNTPJuG1nGy680H4FNOjTAgMBAAECgYAyrpLdposseimm0YokOjJ5SDaEkw1prh2RxLxWhz/oxtEWzT2CPb8l0x9zQP8z9T4xxWXDEmxAk0HUc8u18mNNCWHCqKO7foIpAdP6GC3tUEeftztLVieTLMeASnWmGMm5P1/xuq35G35Ls30/SIABJoem+kQn9p3TC9wskbqCQQJBAPwwTrEhUmCKImF4VJJNRLipt/fXijzWkhF7tMUM8yWOb4gcCrdN6rBDsnp1+uk7mv9rZFMlKX/l8JwbcolGqZECQQCdP9KMDy40VgXfJxfC+xXeor4SNja8fBc3V49gLcKEUQ5QDVWzNnIu7ueSr1WPe2pf7bq2vyzBe5GJ5pZcoxojAkEAntjOuEOE38oiXcKtgnmpD6fXeQUKzcdZuilxc6z0enN9TP5cwZkSenQpt3kY0k/5EWlTiAugWC89nxaqzkz0AQJAF2kyEnIMIfSQqTlruzageeXmwFVb7tHWrwGVMe9+Hy7mH5rsoGLBuyUMSvVZmqP4IVIGU0DBDAk2kL5IsoAB2wJAfGcHsrTw0vQ2MOAsaNr7s5Gz8Ei5RXn40YlykMulBZTe/NxPeGmCjBZtQbFbMmKjBqUoEDtxAzVOeeOzP3QxwQ==";
    public static void main(String[] args) {
        //String folderPath = "~!\";// TODO make this path dynamic
        while (true) {
            try (ServerSocket serverSocket = new ServerSocket(80)) {
                System.out.println("listening to port:80");
                Socket clientSocket = serverSocket.accept();
                System.out.println(clientSocket + " connected.");
                dataInputStream = new DataInputStream(clientSocket.getInputStream());
                dataOutputStream = new DataOutputStream(clientSocket.getOutputStream());

                receiveFile();

                dataInputStream.close();
                dataOutputStream.close();
                clientSocket.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static String decrypt(byte[] cipherTextArray, Key privateKey) throws Exception
    {
        //System.out.println("Private Key: " + Base64.getEncoder().encodeToString(privateKey.getEncoded()));

        // Get Cipher Instance
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        // Initialize Cipher for DECRYPT_MODE
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        // Perform Decryption
        byte[] decryptedTextArray = cipher.doFinal(cipherTextArray);
        return new String(decryptedTextArray);
    }


    public static Key decodePrivateKeyFromString(String keyStr) throws NoSuchAlgorithmException, InvalidKeySpecException {
        /* Decodes a Base64 encoded String into a byte array */
        byte[] decodedKey = Base64.getDecoder().decode(keyStr);
        Key clientRSAKey = KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(decodedKey));
        return clientRSAKey;
    }


    private static void receiveFile() throws Exception {
        int bytes = 0;
        String folderPath = "/home/dev/";// TODO make this path dynamic

        String encrypted_filename = dataInputStream.readUTF();//read file name
        byte[] BAFN = encrypted_filename.getBytes();
        String filename = decrypt(BAFN, decodePrivateKeyFromString(privateKey));
        //TODO check if deviceID is in list of folders in directory
        //get deviceID from filename
        String deviceID = filename.split("_")[0];
        //get list of folders in directory
        List<String> folders = findFoldersInDirectory(folderPath);

        //check if deviceID is in list of folders in directory
        if(!folders.contains(deviceID)) {
            //if no existing: mkdir and write file to new directory
            File f1 = new File(folderPath + "target_" + deviceID);
            f1.mkdir();
        }



        //change file name
        filename = folderPath+"target_" + deviceID+"/"+filename;

        FileOutputStream fileOutputStream = new FileOutputStream(filename);

        //long size = dataInputStream.readLong(); // read file size
        byte[] buffer = new byte[4 * 1024];
        while ((bytes = dataInputStream.read(buffer)) != -1) {
            fileOutputStream.write(buffer, 0, bytes);
        }
        fileOutputStream.close();
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

}