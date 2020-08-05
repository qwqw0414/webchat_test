package com.pro.wc.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImp implements MemberDAO{

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertMember(Map<String, String> param) throws Exception{
		return sst.insert("member.insertMember", param);
	}

	@Override
	public int countMemberId(String memberId) throws Exception {
		return sst.selectOne("member.countMemberId", memberId);
	}

	@Override
	public Map<String, String> selectOneMember(Map<String, String> param) throws Exception {
		return sst.selectOne("member.selectOneMember", param);
	}
	
	
}
