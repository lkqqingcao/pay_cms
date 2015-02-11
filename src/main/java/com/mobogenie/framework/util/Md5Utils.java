/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.framework.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.security.crypto.codec.Hex;
import org.springframework.security.crypto.codec.Utf8;

import com.google.gdata.util.common.base.CharMatcher;

/**
 * 
 * @author wanghongfeng
 * @date 2014年7月16日
 */
public final class Md5Utils {

	  public static final MessageDigest getMessageDigest() throws IllegalArgumentException {
	        try {
	            return MessageDigest.getInstance("MD5");
	        } catch (NoSuchAlgorithmException e) {
	            throw new IllegalArgumentException("No such algorithm [ MD5 ]");
	        }
	    }
	
	/**
	 * 执行md5加密，salt可选，有salt情况下是password{slat}的md5值
	 * @param rawPass
	 * @param salt
	 * @return
	 * @author wanghongfeng
	 * @date 2014年7月16日
	 */
	 public static String encodeString(String rawPass, Object salt) {
	        String saltedPass = mergePasswordAndSalt(rawPass, salt, false);
	        MessageDigest messageDigest = getMessageDigest();
	        byte[] digest = messageDigest.digest(Utf8.encode(saltedPass));
            return new String(Hex.encode(digest));
	    }
	 
	 
	 /**
	  *   String saltedPass = mergePasswordAndSalt(rawPass, salt, false);

        MessageDigest messageDigest = getMessageDigest();

        byte[] digest = messageDigest.digest(Utf8.encode(saltedPass));

        // "stretch" the encoded value if configured to do so
        for (int i = 1; i < iterations; i++) {
            digest = messageDigest.digest(digest);
        }

        if (getEncodeHashAsBase64()) {
            return Utf8.decode(Base64.encode(digest));
        } else {
            return new String(Hex.encode(digest));
        }
	  */
	 
	 
	 
	 /**
	  * 
	  * @param password
	  * @param salt
	  * @param strict
	  * @return
	  * @author wanghongfeng
	  * @date 2014年7月16日
	  */
	  public static String mergePasswordAndSalt(String password, Object salt, boolean strict) {
	        if (password == null) {
	            password = "";
	        }

	        if (strict && (salt != null)) {
	            if ((salt.toString().lastIndexOf("{") != -1) || (salt.toString().lastIndexOf("}") != -1)) {
	                throw new IllegalArgumentException("Cannot use { or } in salt.toString()");
	            }
	        }
	        if ((salt == null) || "".equals(salt)) {
	            return password;
	        } else {
	            return password + "{" + salt.toString() + "}";
	        }
	    }
	  
	  public static void main(String[] args) {
		  System.out.println(CharMatcher.inRange('a','z').or(CharMatcher.inRange('A','Z')).or(CharMatcher.DIGIT).matchesAllOf("Z4f"));
    }
}
