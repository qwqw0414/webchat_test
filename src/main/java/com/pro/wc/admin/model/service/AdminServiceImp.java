package com.pro.wc.admin.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.wc.admin.model.dao.AdminDao;

@Service
public class AdminServiceImp implements AdminService{
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	AdminDao ad;

	@Override
	public List<Map<String, String>> selectAllMember() {
		return ad.selectAllMember();
	}
	
	

}
