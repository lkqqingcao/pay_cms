package com.mobogenie.framework.service;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

/**
 * 类PropertyUtils.java的实现描述：TODO 类实现描述 
 * @author hongfengwang 
 */
@Component
public class PropertyProxy {
    private static final Logger LOGGER = LoggerFactory.getLogger(PropertyProxy.class);

    @Autowired
    private MessageSource customMessageSource;
    
    public String getProperty(String key){
        String result =null;
        try {
            result = customMessageSource.getMessage(key, null, Locale.getDefault());
        } catch (Exception e) {
            LOGGER.error("get property error ",e);
        }
        return result;
    }
    
}
