package com.hu.parking.common;

import com.hu.parking.util.Digests;
import com.hu.parking.util.Encodes;

/**
 * 通用加密
 * 
 * @author leeyuan
 *
 */
public class Encryption {

	private final int SALT_SIZE = 8;
	
	private final int ITERATIONS= 1024;

	/**
	 * 对密码进行加密
	 * 
	 * @param password
	 * @return
	 */
	public String encryptionPwd(String password) {
		// 得到8位盐
		byte[] salts = Digests.generateSalt(SALT_SIZE);
		// 将8位byte数组装换为string
		String salt = Encodes.encodeHex(salts);
		// 将string转化为8位byte数组
		salts = Encodes.decodeHex(salt);
		// 对密码加盐进行1024次SHA1加密
		byte[] hashPassword = Digests.sha1(password.getBytes(), salts, ITERATIONS);
		// 将加密后的密码数组转换成字符串
		return salt+Encodes.encodeHex(hashPassword);
	}
	
	/**
	 * 对密码进行加密
	 * 
	 * @param password , salt
	 * @return
	 */
	public String encryptionPwd(String password, String salt) {		
		// 将string转化为8位byte数组
		byte[] salts = Encodes.decodeHex(salt);		
		// 对密码加盐进行1024次SHA1加密
		byte[] hashPassword = Digests.sha1(password.getBytes(), salts, ITERATIONS);
		// 将加密后的密码数组转换成字符串
		return salt+Encodes.encodeHex(hashPassword);
	}
	
}
