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

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ContextClassLoaderLocal;

/**
 * 
 * @author wanghongfeng
 * @date 2014年8月27日
 */
public class NullAwareBeanUtils extends BeanUtilsBean {
	private static final ContextClassLoaderLocal 
       BEANS_BY_CLASSLOADER = new ContextClassLoaderLocal() {
                // Creates the default instance used when the context classloader is unavailable
                protected Object initialValue() {
                    return new NullAwareBeanUtils();
                }
            };
            
    public static BeanUtilsBean getInstance() {
                return (NullAwareBeanUtils) BEANS_BY_CLASSLOADER.get();
    }
	
    public static void copyPropertiesIgnoreNull(Object dest, Object orig){
    	try {
	        NullAwareBeanUtils.getInstance().copyProperties(dest, orig);
        } catch (Exception e) {
	        throw new RuntimeException("NullAwareBeanUtils.copyProperties has encounter an problem", e);
        } 
    }
    
	@Override
    public void copyProperty(Object dest, String name, Object value)
            throws IllegalAccessException, InvocationTargetException {
        if(value==null)return;
        super.copyProperty(dest, name, value);
    }
	

}
