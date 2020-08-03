package com.pro.wc.test.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pro.wc.test.model.service.TestService;

@Controller
@RequestMapping("test")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@RequestMapping("/msgList")
	public ModelAndView msgList(ModelAndView mav) {
		
		List<Map<String, String>> list = testService.selectAllMsg();
		
		mav.addObject("list",list);
		mav.setViewName("test/msgList");
		
		return mav;
	}
	
}
