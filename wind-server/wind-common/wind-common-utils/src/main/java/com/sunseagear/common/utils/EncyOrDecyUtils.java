package com.sunseagear.common.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;
import java.security.spec.KeySpec;

public class EncyOrDecyUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(EncyOrDecyUtils.class);
    private static final int SALT_SIZE = 32;
    private static final int ITERATIONCOUNT = 50000;
    private static final String DEFAULT_KEY = "Tr7WE0J2z3uJod4p";

    public static final String MD5(byte[] data) {
        return DigestUtils.md5Hex(data);
    }

    public static final String MD5(String data) {
        return DigestUtils.md5Hex(data);
    }

    public static final String generateKey(char[] password, int keyLength) {
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            byte[] salt = new byte[SALT_SIZE];
            random.nextBytes(salt);
            KeySpec keyspec = new PBEKeySpec(password, salt, ITERATIONCOUNT, keyLength * 2 * 3);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            SecretKey secretkey = factory.generateSecret(keyspec);
            return Base64.encodeBase64String(secretkey.getEncoded());
        } catch (Exception e) {
            LOGGER.error("generate Key error", e);
        }
        return null;
    }

    public static final String desEncrypt(String content) {
        return desEncrypt(content, DEFAULT_KEY);
    }

    public static final String desDecrypt(String content) {
        return desDecrypt(content, DEFAULT_KEY);
    }

    public static String desEncrypt(String sSrc, String sKey) {
        try {
            if (sKey == null) {
                LOGGER.warn("Key为空null");
                return null;
            }

            if (sKey.length() != 16) {
                LOGGER.warn("Key长度不是16位");
                return null;
            }
            byte[] raw = sKey.getBytes();
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            IvParameterSpec iv = new IvParameterSpec("0102030405060708".getBytes());
            cipher.init(1, skeySpec, iv);
            byte[] encrypted = cipher.doFinal(sSrc.getBytes());
            return Base64.encodeBase64String(encrypted);
        } catch (Exception e) {
            LOGGER.error("des encrypt string error", e);
        }
        return null;
    }

    public static String desDecrypt(String sSrc, String sKey) {
        try {
            if (sKey == null) {
                LOGGER.warn("Key为空null");
                return null;
            }

            if (sKey.length() != 16) {
                LOGGER.warn("Key长度不是16位");
                return null;
            }
            byte[] raw = sKey.getBytes("ASCII");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            IvParameterSpec iv = new IvParameterSpec("0102030405060708".getBytes());
            cipher.init(2, skeySpec, iv);
            byte[] encrypted1 = Base64.decodeBase64(sSrc);
            try {
                byte[] original = cipher.doFinal(encrypted1);
                String originalString = new String(original);
                return originalString;
            } catch (Exception e) {
                return null;
            }
        } catch (Exception e) {
            LOGGER.error("des decrypt string error", e);
        }
        return null;
    }
}
