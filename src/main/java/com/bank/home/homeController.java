package com.bank.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
public class homeController {
	
	@GetMapping("/")
	public String homePage(Model model) {
		return "home-page";
	}

	
	@GetMapping("/deposit-page")
	public String depositPage(Model model) {
		return "deposit-page";
	}	
	
	@GetMapping("/withdrawal-page")
	public String withdrawalPage(Model model) {
		return "withdrawal-page";
	}	
}
