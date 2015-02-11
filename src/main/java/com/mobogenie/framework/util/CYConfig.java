package com.mobogenie.framework.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * 类名称：CYConfig
 * 类描述：(读取配置文件)
 * 创建人：litaijun
 * 创建时间：2014-6-4 下午02:22:57
 * 修改人：
 * 修改时间：2014-6-4 下午02:22:57
 * 修改备注：
 * 
 * @version 1.0.0
 */
public class CYConfig {
	public CYConfig() {
	}

	private static Properties props = new Properties();
	static {
		try {
			props = PropertiesUtils.loadProperties("application.properties");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String getValue(String key) {
		return props.getProperty(key).trim();
	}

	public static void updateProperties(String key, String value) {
		props.setProperty(key, value);
	}
}
