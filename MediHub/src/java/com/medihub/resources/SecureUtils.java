package com.medihub.resources;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecureUtils {

    public static String generatePasswordHash(String password) {
        String generatedPassword = null;
        if (!password.isEmpty()) {
            try {
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] generatedPasswordbytes = md.digest(password.getBytes(StandardCharsets.UTF_8));
                generatedPassword = bytesToHex(generatedPasswordbytes);
            } catch (NoSuchAlgorithmException e) {
                return null;
            }
        }
        return generatedPassword;
    }


    private static String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    public static String generatePasswordHashvalue(String value) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}