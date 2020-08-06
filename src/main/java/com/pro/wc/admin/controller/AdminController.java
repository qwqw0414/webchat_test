package com.pro.wc.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pro.wc.admin.model.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	private Gson gson = new Gson();
	
	@Autowired
	private AdminService as;
	
	
	@RequestMapping("memberList.do")
	public void memberList() {
		
	}
	
	@ResponseBody
	@RequestMapping(value ="selectAllMember", produces = "text/plain;charset=UTF-8" )
	public String selectAllMember() {
		List<Map<String,String>>list = null;
		
		list = as.selectAllMember();
		log.debug(list+"");
		
		
		return gson.toJson(list);
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}



