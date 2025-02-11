package com.bank.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bank.dto.MemberDTO;
import com.bank.service.MemberService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService service;
	

	// 회원가입
	/*
		Talend API 에서 다음과 같이 JSON 요청
		POST 요청 
		header 값 : Content-type : application/json
		{
			"userid" : "kim4832",
			"passwd" : "1234",
			"username" : "김유신"
		}
		
		위 JSON이 자바의 MemberDTO에 저장됨
	*/
	
	//회원가입 화면보기
	@GetMapping("/signup")
	public String signupForm() {
		return "memberForm";
	}

	@PostMapping("/signup")
	public ResponseEntity<MemberDTO> save(@Valid @RequestAttribute MemberDTO dto) {
		
		log.info("비번 암호화 전 : {}", dto.getPassword());
		// 비번을 암호화 해야됨
		String encodedPW = new BCryptPasswordEncoder().encode(dto.getPassword());
		dto.setPassword(encodedPW);
		log.info("비번 암호화 후 : {}", encodedPW);		
		
		dto.setPassword(encodedPW);
//		int n = service.save(dto);
		
		return ResponseEntity.created(null).build();	// 201 상태코드 반환됨
		
	}
	
	// 로그인 이후(인증 후)에 요청가능
	/*
 		로그인 후에 얻은 token 값을 항상 header에 저장해서 전달해야함
 		Authorization : Bearer 
	*/
//	@GetMapping("/mypage")
//	public void mypage() {
//		
//	}
	
}
