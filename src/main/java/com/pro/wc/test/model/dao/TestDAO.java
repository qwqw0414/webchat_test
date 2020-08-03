package com.pro.wc.test.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TestDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public List<Map<String, String>> selectAllMsg() {
		return sst.selectList("test.selectAllMsg");
	}

}
