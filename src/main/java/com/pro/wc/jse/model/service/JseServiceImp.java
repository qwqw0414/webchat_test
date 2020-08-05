package com.pro.wc.jse.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.wc.jse.model.dao.JseDAO;

@Service
public class JseServiceImp implements JseService{

	@Autowired
	private JseDAO jd;
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	@Override
	public List<Map<String, String>> selectAllProduct() throws Exception {
		return jd.selectAllProduct();
	}
	
	
	
}
