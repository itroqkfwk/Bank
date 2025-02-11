package com.bank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bank.service.MemberService;

@Controller
//@SessionAttributes(value = {"login"}) // Model에 "login" 키를 사용하면 HttpSession에 저장됨.
public class LoginController {
	
	MemberService memberService;
	
	public LoginController(MemberService memberService) {
		this.memberService = memberService;
	}
	@GetMapping("/login-page")
	public String loginPage(Model model) {
		return "login-page";
	}
	
	@GetMapping("/signup-page")
	public String signupPage(Model model) {
		return "signup-page";
	}
}