package com.pro.wc.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.wc.member.model.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService ms;
	
	
	
	
	
	
	
}
