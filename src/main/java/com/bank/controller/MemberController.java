package com.bank.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.bank.dto.MemberDTO;
import com.bank.dto.RegisterMemberDTO;
import com.bank.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService service;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	// 회원가입 화면보기
	@GetMapping("/signup-page")
	public String signupForm(Model model) {
		return "signup-page";
	}
	
	// 로그인 화면보기
	@GetMapping("/login-page")
	public String loginPage(Model model) {
		return "login-page";
	}	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logoutPage(HttpServletRequest httpServletRequest, Model model) {
		 httpServletRequest.getSession().invalidate();
		return "redirect:/";
	}	
	
	
	@PostMapping("/signup-page")
	public String signup(@Valid @ModelAttribute("RegisterMemberDTO") RegisterMemberDTO dto, BindingResult result) {
		
		// 에러발생
		if(result.hasErrors()) {
			return "redirect:/";
		}
		
		logger.info("LOGGER: dto: {}" , dto);
		
		String address = "(" + dto.getAddress1() + ")" + dto.getAddress2() + dto.getAddress3() + dto.getAddress4();
		
		// 비밀번호 암호화 (필수***************, 안하면 에러남)
		String pw = dto.getPassword();	// 암호화 되지 않은 pw : 1234
		
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPW = passwordEncoder.encode(pw);
		
		// raw 비번 (1234) 암호 비번(~~) 비교
		boolean result2 = passwordEncoder.matches(pw, encodedPW);
		log.info("비밀번호 일치함? :{} = {} => {}", pw, encodedPW, result2);
		
	    MemberDTO memberDTO = MemberDTO.builder()
									   .userid(dto.getUserid())
									   .password(encodedPW)
									   .username(dto.getUsername())
									   .address(address)
									   .roles("ROLE_USER")
									   .email(dto.getEmail()).build();
		
		// 회원 저장
		int n = service.memberAdd(memberDTO);
		
		// 성공한 경우
		return "redirect:login-page";
	}
	
	@PostMapping("/login-page")
	public String register( @RequestParam String userid,
							@RequestParam String password,
							HttpServletRequest httpServletRequest,
							Model model) {
		
		Map<String, String> loginInfo = new HashMap<>();
		
		loginInfo.put("userid", userid);
		loginInfo.put("password", password);
		
		MemberDTO memberDto = service.findByUserid(userid);
		
		logger.info("LOGGER: 평문 비밀번호 {}" , password);

        if (memberDto != null ) {
        	
    		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    		boolean isLogin = passwordEncoder.matches(password, memberDto.getPassword());
    		log.info("비밀번호 일치함? :{} ", isLogin);
    		if (passwordEncoder.matches(password, memberDto.getPassword())) {
    			
    			logger.info("LOGGER: 로그인 성공 {}" , memberDto);
    			
    			 httpServletRequest.getSession().invalidate();
    		        HttpSession session = httpServletRequest.getSession(true);  // Session이 없으면 생성
    		        // 세션에 userId를 넣어줌
    		        session.setAttribute("id", memberDto.getId());
    		        session.setAttribute("userid", memberDto.getUserid());
    		        session.setAttribute("username", memberDto.getUsername());
    		        session.setMaxInactiveInterval(1800); // Session이 30분동안 유지
    		}
    		return "redirect:/";
        	
            
        } else {
            model.addAttribute("error", "로그인 아이디 또는 비밀번호가 틀렸습니다.");
            return "login-page"; // login page
        }
		
		
	}
	
}
	