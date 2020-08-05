package com.pro.wc.jse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("jse")
public class JseController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("sudoku")
	public void sudoku() {
		
	}
	
	@RequestMapping("regexp")
	public void regexp() {
		
	}
}
