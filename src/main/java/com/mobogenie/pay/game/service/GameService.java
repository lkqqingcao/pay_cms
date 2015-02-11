/**
 *  Copyright (c)  2011-2020 Changyou, Inc.
 *  All rights reserved.
 *
 *  This software is the confidential and proprietary information of Changyou, 
 *  Inc. ("Confidential Information"). You shall not
 *  disclose such Confidential Information and shall use it only in
 *  accordance with the terms of the license agreement you entered into with Changyou.
 */
package com.mobogenie.pay.game.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobogenie.framework.util.PageData;
import com.mobogenie.pay.game.dao.GameMapper;
import com.mobogenie.pay.game.domain.Game;

/**
 * 
 * @author wanghongfeng
 * @date 2014年9月16日
 */
@Service
public class GameService {
	@Autowired
	private GameMapper gameMapper;
	
	public List<Game> getList(Game game){
		return  gameMapper.query(game);
	}
	
	public Integer getCount(Game game){
		return  gameMapper.count(game);
	}
	
	public PageData<Game> getPageData(Game game){
		
		List tt=gameMapper.querycount();
		return PageData.buildPage(getList(game),getCount(game),game.getPageSize(), game.getPageNum());
	}
	
	public Game getOne(Game game){
		return gameMapper.queryOne(game);
	}
	
	public void saveOne(Game game){
		if (game!=null&&game.getId()!=null) {
			game.setUpdateTime(new Date());
			gameMapper.update(game);
        }else {
        	game.setUpdateTime(new Date());
        	game.setCreateTime(new Date());
		    gameMapper.insert(game);	
		}
		
	}

	public void delete(Game vo) {
	    gameMapper.delete(vo);
	    
    }
	

}
