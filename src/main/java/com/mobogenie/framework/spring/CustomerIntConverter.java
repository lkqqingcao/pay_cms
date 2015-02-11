/**
 * 
 */
package com.mobogenie.framework.spring;

import org.springframework.core.convert.converter.Converter;

/**
 * @author hongfeng
 *
 */
public class CustomerIntConverter implements Converter<String, Integer> {

	@Override
	public Integer convert(String source) {
		try {
			return Integer.parseInt(source.trim());
		} catch (Exception e) {
			return null;
		}
	}

}
