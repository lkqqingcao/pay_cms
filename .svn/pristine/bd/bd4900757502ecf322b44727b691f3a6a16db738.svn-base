/*
 * Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.mobogenie.framework.sso;

import static org.springframework.security.crypto.util.EncodingUtils.concatenate;
import static org.springframework.security.crypto.util.EncodingUtils.subArray;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.security.crypto.codec.Hex;
import org.springframework.security.crypto.encrypt.BytesEncryptor;
import org.springframework.security.crypto.keygen.BytesKeyGenerator;

/**
 * see org.springframework.security.crypto.encrypt.AesBytesEncryptor
 *
 * @author Keith Donald
 */
final class AESBytesEncryptor implements BytesEncryptor {

    private final SecretKey secretKey;

    private final Cipher encryptor;

    private final Cipher decryptor;

    /**
     * iv key must 16-bytes length
     */
    private final BytesKeyGenerator ivGenerator;

    /**
     * 
     * @param password must 16-bytes , 24-bytes or 42-bytes length
     * @param salt     have an even number of characters 
     */
    public AESBytesEncryptor(String password, CharSequence salt) {
        this(password, salt, null);
    }

    public AESBytesEncryptor(String password, CharSequence salt, BytesKeyGenerator ivGenerator) {
        PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray(), Hex.decode(salt), 1024, 256);
        SecretKey secretKey = CipherUtils.newSecretKey("PBEWithMD5AndDES", keySpec);
        this.secretKey = new SecretKeySpec(secretKey.getEncoded(), AES);
        encryptor = CipherUtils.newCipher(AES_ALGORITHM);
        decryptor = CipherUtils.newCipher(AES_ALGORITHM);
        this.ivGenerator = ivGenerator != null ? ivGenerator : NULL_IV_GENERATOR;
    }

    public byte[] encrypt(byte[] bytes) {
        synchronized (encryptor) {
            byte[] iv = ivGenerator.generateKey();
            CipherUtils.initCipher(encryptor, Cipher.ENCRYPT_MODE, secretKey, new IvParameterSpec(iv));
            byte[] encrypted = CipherUtils.doFinal(encryptor, bytes);
            return ivGenerator != NULL_IV_GENERATOR ? concatenate(iv, encrypted) : encrypted;
        }
    }

    public byte[] decrypt(byte[] encryptedBytes) {
        synchronized (decryptor) {
            byte[] iv = iv(encryptedBytes);
            CipherUtils.initCipher(decryptor, Cipher.DECRYPT_MODE, secretKey, new IvParameterSpec(iv));
            return CipherUtils.doFinal(decryptor, ivGenerator != NULL_IV_GENERATOR ? encrypted(encryptedBytes, iv.length) : encryptedBytes);
        }
    }

    // internal helpers

    private byte[] iv(byte[] encrypted) {
        return ivGenerator != NULL_IV_GENERATOR ? subArray(encrypted, 0, ivGenerator.getKeyLength()) : NULL_IV_GENERATOR.generateKey();
    }

    private byte[] encrypted(byte[] encryptedBytes, int ivLength) {
        return subArray(encryptedBytes, ivLength, encryptedBytes.length);
    }

    private static final String AES = "AES";
    private static final String AES_ALGORITHM = "AES/CBC/PKCS5Padding";
    
    private static final BytesKeyGenerator NULL_IV_GENERATOR = new BytesKeyGenerator() {

        private final byte[] VALUE = new byte[16];

        public int getKeyLength() {
            return VALUE.length;
        }

        public byte[] generateKey() {
            return VALUE;
        }

    };
}
