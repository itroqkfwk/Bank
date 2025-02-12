package com.bank.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class RegisterMemberDTO {
	
//	@NotBlank(message = "userid 필수")
	private String userid;
	private String username;
	private String password;
	String email;
	String address1;
	String address2;
	String address3;
	String address4;
	String address5;
	String roles;

}