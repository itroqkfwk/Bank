package com.bank.controller;

import com.bank.service.AccountService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import com.bank.dto.AccountDTO;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")

public class AccountController {

    private final AccountService accountService;
    
    @Autowired
    private HttpSession session;
    
    @RequestMapping("/mypage")
    public String viewAccounts(Model model) {
        // 서비스에서 데이터 가져오기
        List<AccountDTO> accounts = accountService.getAllAccounts();

        // 데이터를 모델에 추가하여 JSP로 전달
        model.addAttribute("accounts", accounts);
        System.out.println("Accounts: " + accounts);  // 데이터 확인용 로그

        // JSP 페이지 반환
        return "mypage"; // JSP 파일 이름 (mypage.jsp)
        
        
    }
    
    @GetMapping("/mypages")
    public String accountPage(Model m, 
                              @RequestParam(defaultValue = "0") int page, 
                              @RequestParam(defaultValue = "5") int size) {
    	
    	// 세션에 로그인 정보 강제로 설정 (테스트용)
//    	session.setAttribute("user_id", 1);  // 여기서 1은 테스트용 user_id
    	
        Integer user_id = (Integer) session.getAttribute("user_id");

        if (user_id != null) {
            List<AccountDTO> accounts = accountService.getAccountsByUserId(user_id, page, size);
            if (accounts.isEmpty()) {
                m.addAttribute("message", "계좌가 없습니다. 계좌를 개설해주세요.");
            } else {
                m.addAttribute("accounts", accounts);
                int totalAccounts = accountService.getTotalAccountsByUserId(user_id);
                int totalPages = (int) Math.ceil((double) totalAccounts / size);
                m.addAttribute("totalPages", totalPages);
                m.addAttribute("currentPage", page);
            }
        } else {
            m.addAttribute("message", "로그인 후 이용해 주세요.");
        }
        return "redirect:/mypage";  
    }

    
    @PostMapping("/my-account-management")
    public List<AccountDTO> getAllAccounts() {
        return accountService.getAllAccounts();
    }
    
    @PostMapping("/add")
    public String addAccount(@RequestParam String account_name, 
                             @RequestParam String account_no, 
                             @RequestParam double money,
                             RedirectAttributes redirectAttributes) {

    	//로그인 없이 test위해 주석처리
        Integer user_id = (Integer) session.getAttribute("user_id");
//        if (user_id == null) {
//            redirectAttributes.addFlashAttribute("message", "사용자 정보가 없습니다. 로그인 후 다시 시도해주세요.");
//            return "redirect:/login-page";  
//        }

        if (accountService.existsByAccountNo(account_no)) {
            redirectAttributes.addFlashAttribute("message", "중복된 계좌 번호입니다. 다른 계좌 번호를 입력해주세요.");
            return "redirect:/mypage";
        }

        if (account_name == null || account_name.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "계좌 이름을 입력해주세요.");
            return "redirect:/mypage";
        }

        if (account_no == null || account_no.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "계좌 번호를 입력해주세요.");
            return "redirect:/mypage";
        }

        AccountDTO account = new AccountDTO(account_name, account_no, money, 1);  //추후에 1을 user_id로 변경 해야됨
        accountService.addAccount(account);  

        redirectAttributes.addFlashAttribute("message", "씨뱅크 계좌 추가 성공!");
        return "redirect:/mypage";
    }
    
    
}