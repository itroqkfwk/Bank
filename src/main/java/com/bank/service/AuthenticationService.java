package com.bank.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bank.dto.MemberDTO;


public interface AuthenticationService {
	
//	public MemberDTO authenticate(Map<String, String> map);
	public MemberDTO findByUserid(String userid);
	
}
