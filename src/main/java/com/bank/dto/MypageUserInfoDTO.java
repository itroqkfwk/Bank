package com.bank.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MypageUserInfoDTO {
	
	private Integer id;
	private String userid;
	private String username;
	private String password;
	private String email;
	private String address;
	private String roles;

}
