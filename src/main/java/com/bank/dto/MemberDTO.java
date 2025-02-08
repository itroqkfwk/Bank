package com.bank.dto;

import org.apache.ibatis.type.Alias;

import jakarta.validation.constraints.NotBlank;
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
@Alias("MemberDTO")
public class MemberDTO {
	
//	@NotBlank(message = "userid 필수")
	private String userid;
	private String username;
	private String password;
	String email;
	String address;
	String roles;

}