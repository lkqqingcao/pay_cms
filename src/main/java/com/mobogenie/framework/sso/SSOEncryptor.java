package com.mobogenie.framework.sso;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.keygen.BytesKeyGenerator;

/**
 * 
 * 
 * @author wanghongfeng
 * @date 2014年10月8日
 */
public final class SSOEncryptor {
	private static final Logger LOGGER = LoggerFactory.getLogger(SSOEncryptor.class);
	private static final String defaultSalt     = "mobo-cms";
    private static final String defaultPassword = "mobo-sso-cms-pwd";
    private static final BytesKeyGenerator DEAULT_IV_GENERATOR = new BytesKeyGenerator() {
        private final byte[] VALUE = "mobo-sso-ivivivi".getBytes();
        public int getKeyLength() {
            return VALUE.length;
        }
        public byte[] generateKey() {
            return VALUE;
        }
    };
    private static final AESBytesEncryptor defaultAESEncryptor = new AESBytesEncryptor(defaultPassword, defaultSalt,DEAULT_IV_GENERATOR);
   
    /**
     * encrypt with default salt,password,ivGenerator
     * @param src
     * @return
     */
    public static String encrypt(String src){
    	byte[] binaryData = null;
    	try {
    		binaryData =  defaultAESEncryptor.encrypt(src.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
        	LOGGER.error(e.getMessage(), e);
	        throw new IllegalArgumentException("illegal src which to be encrypt");//not happend
        }
    	return Base64.encodeBase64String(binaryData);
    }
    
    /**
     * decrypt with default salt,password,ivGenerator
     * @param dest
     * @return
     */
    public static String decrypt(String dest){
    	byte[] binaryData = null;
    	try {
    		binaryData = defaultAESEncryptor.decrypt(dest.getBytes("UTF-8"));
    		return new String(binaryData,"UTF-8");
        } catch (UnsupportedEncodingException e) {
        	 LOGGER.error(e.getMessage(), e);
        	 throw new IllegalArgumentException("illegal dest which to be decrypt");//not happend
        }
    }
    /**
     * encrypt with custom salt,password,ivGenerator
     * @param src
     * @param salt
     * @param pwd
     * @param ivKeyGenerator
     * @return
     */
    public static final String encryptCustom(String src,String salt,String pwd,BytesKeyGenerator ivKeyGenerator){
    	AESBytesEncryptor aesBytesEncryptor = new AESBytesEncryptor(pwd==null?defaultPassword:pwd, salt==null?defaultSalt:salt, ivKeyGenerator);
    	byte[] binaryData = null;
    	try {
    		binaryData =  aesBytesEncryptor.encrypt(src.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
        	LOGGER.error(e.getMessage(), e);
	        throw new IllegalArgumentException("illegal src which to be encrypt");//not happend
        }
    	return Base64.encodeBase64String(binaryData);
    }
    /**
     * decrypt with custom salt,password,ivGenerator
     * @param dest
     * @param salt
     * @param pwd
     * @param ivKeyGenerator
     * @return
     */
    public static String decrypt(String dest,String salt,String pwd,BytesKeyGenerator ivKeyGenerator){
    	AESBytesEncryptor aesBytesEncryptor = new AESBytesEncryptor(pwd==null?defaultPassword:pwd, salt==null?defaultSalt:salt, ivKeyGenerator);
    	byte[] binaryData = null;
    	try {
    		binaryData = aesBytesEncryptor.decrypt(dest.getBytes("UTF-8"));
    		return new String(binaryData,"UTF-8");
        } catch (UnsupportedEncodingException e) {
        	 LOGGER.error(e.getMessage(), e);
        	 throw new IllegalArgumentException("illegal dest which to be decrypt");//not happend
        }
    }
    
    private SSOEncryptor(){}
}
