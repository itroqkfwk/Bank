package com.bank.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

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
	
	
	public RegisterMemberDTO(String userid, String username, String password, String email, String address1,
			String address2, String address3, String address4, String address5, String roles) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.address1 = address1 == null ? address1 : " ";
		this.address2 = address2 == null ? address2 : " ";
		this.address3 = address3 == null ? address3 : " ";
		this.address4 = address4 == null ? address4 : " ";
		this.roles = roles;
	}
	
	

}