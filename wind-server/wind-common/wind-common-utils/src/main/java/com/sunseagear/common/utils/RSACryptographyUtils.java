package com.sunseagear.common.utils;


import javax.crypto.Cipher;
import java.math.BigInteger;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.Base64;

public class RSACryptographyUtils {

    public static String data = "test";

    //公钥模
    public static String modulusString = "110164495849272711202946616459372319079286499719250901440671340574963041290097354511674847858255163623581724687248801829049425284007804858435579993841022410424572621928291217650718515503750189445424238314989884966610984102758500224037057166856928439759722922436560678668443479105219017648052800023516140485813";
    //公钥指数
    public static String publicExponentString = "65537";
    //私钥指数
    public static String privateExponentString = "60961374589464335329448433595001243934409634234376812970495854819286962409427814192294429595915006240334693799041229338119023717134245555884839770765193981465801650715324507756935907255074388128225545291549661142722809494073282145759411807472927750931464002229391265490987569890138799235618523643438558669377";

    public static void main(String[] args) throws Exception {
        printKeyPairInfo();
        encyAndDecy();
    }

    //加密解密测试
    private static void encyAndDecy() throws Exception {
        //由n和e获取公钥
        PublicKey publicKey = getPublicKey(modulusString, publicExponentString);

        //由n和d获取私钥
        PrivateKey privateKey = getPrivateKey(modulusString, privateExponentString);

        System.out.println("加密前：" + data);
        byte[] encryptedBytes = encrypt(data.getBytes(), privateKey);
        byte[] ret = AscToBcdUtils.ASCII_To_BCD(encryptedBytes, encryptedBytes.length);
        System.out.println("加密后：" + AscToBcdUtils.bcd2Str(encryptedBytes));

        //私钥解密
        byte[] decryptedBytes = decrypt(encryptedBytes, publicKey);
        System.out.println("解密后：" + new String(decryptedBytes));
    }

    //打印公钥私钥信息，请妥善保管
    public static void printKeyPairInfo() throws Exception {
        KeyPair keyPair = genKeyPair(1024);

        //获取公钥，并以base64格式打印出来
        RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();
        System.out.println("公钥：" + new String(Base64.getEncoder().encode(rsaPublicKey.getEncoded())));
        System.out.println("公钥模：" + rsaPublicKey.getModulus());
        System.out.println("公钥指数：" + rsaPublicKey.getPublicExponent());

        //获取私钥，并以base64格式打印出来
        RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyPair.getPrivate();
        System.out.println("私钥：" + new String(Base64.getEncoder().encode(rsaPrivateKey.getEncoded())));
        System.out.println("私钥模：" + rsaPrivateKey.getModulus());
        System.out.println("私钥指数：" + rsaPrivateKey.getPrivateExponent());
//        modulusString = String.valueOf(rsaPrivateKey.getModulus());
//        publicExponentString = String.valueOf(rsaPublicKey.getPublicExponent());
//        privateExponentString = String.valueOf(rsaPrivateKey.getPrivateExponent());

    }

    //生成密钥对
    public static KeyPair genKeyPair(int keyLength) throws Exception {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(1024);
        return keyPairGenerator.generateKeyPair();
    }

    //将base64编码后的公钥字符串转成PublicKey实例
    public static PublicKey getPublicKey(String modulusStr, String exponentStr) throws Exception {
        BigInteger modulus = new BigInteger(modulusStr);
        BigInteger exponent = new BigInteger(exponentStr);
        RSAPublicKeySpec publicKeySpec = new RSAPublicKeySpec(modulus, exponent);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(publicKeySpec);
    }

    //将base64编码后的私钥字符串转成PrivateKey实例
    public static PrivateKey getPrivateKey(String modulusStr, String exponentStr) throws Exception {
        BigInteger modulus = new BigInteger(modulusStr);
        BigInteger exponent = new BigInteger(exponentStr);
        RSAPrivateKeySpec privateKeySpec = new RSAPrivateKeySpec(modulus, exponent);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePrivate(privateKeySpec);
    }

    //公钥加密
    public static byte[] encrypt(byte[] content, PrivateKey publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");//java默认"RSA"="RSA/ECB/PKCS1Padding"
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        return cipher.doFinal(content);
    }

    //私钥解密
    public static byte[] decrypt(byte[] content, PublicKey privateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        return cipher.doFinal(content);
    }

}
