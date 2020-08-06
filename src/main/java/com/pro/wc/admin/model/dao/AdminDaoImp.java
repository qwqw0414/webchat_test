package com.pro.wc.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImp implements AdminDao{

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Map<String, String>> selectAllMember() {
		
		return sst.selectList("admin.selectAllMember");
	}
	
}
