package com.bank.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class homeController {
	
	@GetMapping("/")
	public String homePage(Model model) {
		return "home-page";
	}
	
	@GetMapping("/login-page")
	public String loginPage(Model model) {
		return "login-page";
	}
	
	@GetMapping("/signup-page")
	public String signupPage(Model model) {
		return "signup-page";
	}
	
	@GetMapping("/mypage")
	public String myPage(Model model) {
		return "my-page";
		
	}
	
}
