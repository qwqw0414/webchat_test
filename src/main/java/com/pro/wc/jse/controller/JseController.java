package com.pro.wc.jse.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pro.wc.jse.model.service.JseService;

@Controller
@RequestMapping("jse")
public class JseController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	private Gson gson = new Gson();
	@Autowired
	private JseService js;
	
	
	@RequestMapping("sudoku")
	public void sudoku() {
		
	}
	
	@RequestMapping("regexp")
	public void regexp() {
		
	}
	
	@RequestMapping("productView")
	public void productView(){
		
	}
	
	@RequestMapping("productList")
	@ResponseBody
	public String productList() {
		List<Map<String, String>> list = null;
		
		try {
			
			list = js.selectAllProduct();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return gson.toJson(list);
	}
	
	
	
	
	
	
	
	
	
	
}
