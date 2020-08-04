package com.pro.wc.member.model.service;

import java.util.Map;

public interface MemberService {

	int insertMember(Map<String, String> param) throws Exception;

	int countMemberId(String memberId) throws Exception;

}
