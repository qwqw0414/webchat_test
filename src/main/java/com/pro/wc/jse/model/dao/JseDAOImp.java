package com.pro.wc.jse.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JseDAOImp implements JseDAO{

	@Autowired
	private SqlSessionTemplate sst;
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	@Override
	public List<Map<String, String>> selectAllProduct() throws Exception {
		return sst.selectList("jse.selectAllProduct");
	}
	
	
}
