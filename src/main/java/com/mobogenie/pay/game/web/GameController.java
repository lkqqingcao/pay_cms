/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.game.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mobogenie.framework.util.PageData;
import com.mobogenie.framework.util.RetMsg;
import com.mobogenie.pay.game.domain.Game;
import com.mobogenie.pay.game.service.GameService;

/**
 * 
 * @author wanghongfeng
 * @date 2014年9月17日
 */
@RequestMapping("game")
@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	
	@RequestMapping("doList")
	public String doList(Game vo,ModelMap modelMap){
		PageData<Game> pageData = gameService.getPageData(vo);
		modelMap.put("ps", pageData);
		modelMap.put("vo", vo);
		return returnByType(vo);
	}
	
	@RequestMapping("toEdit")
	public String toEdit(Game vo,ModelMap modelMap){
		if (vo!=null&&vo.getId()!=null) {
	        vo = gameService.getOne(vo);
        }
		modelMap.put("vo", vo);
		return "/game/gameEdit";
	}
	
	@RequestMapping("doEdit")
	public String doEdit(Game vo,ModelMap modelMap){
		MultipartFile file = vo.getFile();
		if (file!=null&&!file.isEmpty()) {
			//do something
		}
		gameService.saveOne(vo);
		vo.setMsg("success");
		modelMap.put("vo", vo);
		vo.setMsg("success");
		return "/game/gameEdit";
	}
	

	@ResponseBody
	@RequestMapping("doDel")
	public RetMsg doDelete(Game vo,ModelMap modelMap){
		gameService.delete(vo);
		modelMap.put("vo", vo);
		vo.setMsg("success");
		return RetMsg.getDefault();
	}

	private String returnByType(Game game) {
	    if (game.getExtQt()==null||game.getExtQt()==0) {
	        return "/game/gameList";
        }else {
			return "/game/gameTable";
		}
    }

}
