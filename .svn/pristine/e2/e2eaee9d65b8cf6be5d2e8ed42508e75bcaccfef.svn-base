package com.mobogenie.framework.util.net;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.impl.NoConnectionReuseStrategy;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 类HttpClientUtils.java的实现描述：TODO 类实现描述 
 * @author hongfengwang 
 */
public class HttpClientUtils {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(HttpClientUtils.class);
    private static PoolingHttpClientConnectionManager poolingmgr;
    private static  HttpClient                   httpClient;
	static {
		RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(240000)
		        .setSocketTimeout(120000).build();
		poolingmgr = new PoolingHttpClientConnectionManager(RegistryBuilder
		        .<ConnectionSocketFactory> create()
		        .register("http", PlainConnectionSocketFactory.getSocketFactory()).build());
		poolingmgr.setDefaultMaxPerRoute(10);
		poolingmgr.setMaxTotal(100);
		httpClient = HttpClientBuilder.create().setDefaultRequestConfig(requestConfig)
		        .setUserAgent("pay cms agent").setConnectionManager(poolingmgr)
		        .setConnectionReuseStrategy(new NoConnectionReuseStrategy()).build();
	}
    
    
    public static String getContent(HttpUriRequest request){
        
        ResponseHandler<String> responseHandler = new BasicResponseHandlerExt();
        String content = null;
        try {
            content = httpClient.execute(request, responseHandler);
        } catch (ClientProtocolException e) {
            LOGGER.error(request.getURI().toString(), e);
            request.abort();
        } catch (IOException e) {
            LOGGER.error(request.getURI().toString(), e);
            request.abort();
        }catch (Exception e) {
            LOGGER.error(request.getURI().toString(), e);
            request.abort();
        }
        return content;
    }
    
   
}
