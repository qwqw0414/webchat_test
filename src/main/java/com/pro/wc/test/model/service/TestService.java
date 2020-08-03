package com.pro.wc.test.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.wc.test.model.dao.TestDAO;

@Service
public class TestService {

	@Autowired
	private TestDAO testDAO;
	
	public List<Map<String, String>> selectAllMsg(){
		return testDAO.selectAllMsg();
	}
	
}
