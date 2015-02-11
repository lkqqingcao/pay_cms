package com.mobogenie.pay.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Preconditions;
import com.mobogenie.framework.util.net.HttpClientUtils;
@Component
public  class UploadClient {
	
	@Value("#{application['imgUploadUrl']}")
	private String imgUploadUrl;
	
	@Value("#{application['uploadDir']}")
	private String uploadDir;
	
	public  String uploadPicToSocial(File file,String url,String size) throws FileNotFoundException, UnsupportedEncodingException{
		Preconditions.checkNotNull(file);
		Preconditions.checkNotNull(url);
		HttpPost httppost = new HttpPost(url);
		MultipartEntity entity = new MultipartEntity( HttpMultipartMode.BROWSER_COMPATIBLE );
		entity.addPart("file", new FileBody((( File ) file )));
		if (StringUtils.isNotBlank(size)) {
			entity.addPart("size", new StringBody(size));    
        }
		httppost.setEntity( entity );
		String response = HttpClientUtils.getContent(httppost);
		Preconditions.checkArgument(StringUtils.isNotBlank(response));
		return response;
	}
	
	
	public String uploadPicToSocial(File file,String size) throws FileNotFoundException, UnsupportedEncodingException {
		return uploadPicToSocial(file, imgUploadUrl, size);
	}

	public String uploadPicToSocial(MultipartFile file,String size) throws IllegalStateException, IOException {
		  String json = "";
		  File newfile = null;
		  try {
			  newfile = 	new File(uploadDir+System.currentTimeMillis()+file.getOriginalFilename());
			  if (!newfile.exists()) {
				   newfile.mkdirs();newfile.createNewFile();
			  }
			  file.transferTo(newfile);
			  json =  uploadPicToSocial(newfile, imgUploadUrl, size);
          } finally{
        	  if (newfile!=null) {
        		  newfile.delete();
              }
          }
		  return json;
		  
	}
	
	
//	public static void main(String[] args) {
//		HttpClient httpClient = new DefaultHttpClient();
//		HttpPost httppost = new HttpPost("http://stagingmy.social.voga360.com/imagefile/upload.htm");
//		File file = new File("D:\\home\\mobileweb\\upload\\dir\\1411637519745.jpg");
//		MultipartEntity entity = new MultipartEntity( HttpMultipartMode.BROWSER_COMPATIBLE );
//		entity.addPart("file", new FileBody((( File ) file )));
//		httppost.setEntity( entity );
//		String response = HttpClientUtils.getContent(httpClient, httppost);
//		System.out.println(response);
//    }
}
