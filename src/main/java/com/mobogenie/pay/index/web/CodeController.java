package com.mobogenie.pay.index.web;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.mobogenie.framework.constant.CommonConstant;
import com.mobogenie.framework.util.CaptchaGenerator;


@Controller
@RequestMapping(value = "index")
public class CodeController {
	
	/**
	 * 生成验证码
	 * date:Jan 5, 2013
	 * author:muchao
	 * description:
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "getCode")
	public void getCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		String codeValue = CaptchaGenerator.generatorCode(response.getOutputStream());
		// 将四位数字的验证码保存到Session中。
		WebUtils.setSessionAttribute(request, CommonConstant.CAPTCHA_CODE, codeValue);
		
	}

}