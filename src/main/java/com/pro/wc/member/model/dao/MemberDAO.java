package com.pro.wc.member.model.dao;

import java.util.Map;

public interface MemberDAO {

	int insertMember(Map<String, String> param) throws Exception;

	int countMemberId(String memberId) throws Exception;

	Map<String, String> selectOneMember(Map<String, String> param) throws Exception;

}
