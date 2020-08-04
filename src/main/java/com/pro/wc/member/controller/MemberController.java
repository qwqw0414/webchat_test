package com.pro.wc.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pro.wc.member.model.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	private Gson gson = new Gson();

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private MemberService ms;

	@RequestMapping("memberEnroll")
	public void memberEnroll() {

	}

	@ResponseBody
	@RequestMapping(value = "idDuplicate", produces = "text/plain;charset=UTF-8")
	public String idDuplicate(String memberId) {
		int result = 0;
		
		try {
			result = ms.countMemberId(memberId);
		} catch (Exception e) {
			log.error("아이디 중복검사 실패");
		}
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "memberEnrollEnd", produces = "text/plain;charset=UTF-8")
	public String memberEnrollEnd(String memberId, String password, String memberName) {

		Map<String, String> param = new HashMap<String, String>();
		int result = 0;

		try {
//			비밀번호 암호화
			password = passwordEncoder.encode(password);

			param.put("member_id", memberId);
			param.put("password", password);
			param.put("member_name", memberName);

			log.debug(param.toString());

			result = ms.insertMember(param);
			
		} catch (Exception e) {
			log.error("회원 가입 오류");
		}

		return String.valueOf(result);
	}

}
