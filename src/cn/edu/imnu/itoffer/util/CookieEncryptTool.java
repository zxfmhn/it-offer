package cn.edu.imnu.itoffer.util;

import java.io.UnsupportedEncodingException;

import org.apache.tomcat.util.codec.binary.Base64;

public class CookieEncryptTool {
	public static String encodeBase64(String cleartext) {
		try {
			cleartext = new String(Base64.encodeBase64(cleartext.getBytes("UTF-8")));
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return cleartext;
	}
	public static String decodeBase64(String ciphertext) {
		try {
			ciphertext = new String(Base64.decodeBase64(ciphertext.getBytes()),"UTF-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
			
		}
		return ciphertext;
	}


}
