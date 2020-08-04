package com.pro.wc.member.model.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.wc.member.model.dao.MemberDAO;

@Service
public class MemberServiceImp implements MemberService{

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberDAO md;

	@Override
	public int insertMember(Map<String, String> param) throws Exception{
		return md.insertMember(param);
	}

	@Override
	public int countMemberId(String memberId) throws Exception {
		return md.countMemberId(memberId);
	}
	
}
