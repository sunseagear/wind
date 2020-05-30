package com.sunseagear.common.sms.utils.cloopen;

import org.apache.commons.codec.binary.Base64;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtil {

    public String md5Digest(String src) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] b = md.digest(src.getBytes("utf-8"));
        return byte2HexStr(b);
    }

    public String base64Encoder(String src) throws UnsupportedEncodingException {
        return Base64.encodeBase64String(src.getBytes("utf-8"));
    }

    public String base64Decoder(String dest) throws UnsupportedEncodingException {
        return new String(Base64.decodeBase64(dest.getBytes("utf-8")));
    }

    private String byte2HexStr(byte[] b) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < b.length; ++i) {
            String s = Integer.toHexString(b[i] & 0xFF);
            if (s.length() == 1)
                sb.append("0");

            sb.append(s.toUpperCase());
        }
        return sb.toString();
    }
}
