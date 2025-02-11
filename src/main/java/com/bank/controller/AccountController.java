package com.bank.controller;

import com.bank.service.AccountService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import com.bank.dto.AccountDTO;
import com.bank.exception.AccountException;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class AccountController {

    private final AccountService accountService;
    
    @Autowired
    private HttpSession session;
    
    @GetMapping("/mypagess")
    public String showMypage(@ModelAttribute("accounts") List<AccountDTO> accounts, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("accounts", accounts);
        return "redirect:/mypage"; 
    }
    
    @GetMapping("/mypages")
    public String accountPage(@RequestParam(defaultValue = "0") int page, 
                              @RequestParam(defaultValue = "5") int size,
                              RedirectAttributes redirectAttributes) {
    	
        session.setAttribute("user_id", 1);  // 여기서 1은 테스트용 user_id
    	Integer user_id = (Integer) session.getAttribute("user_id");

        if (user_id != null) {
            int offset = page * size;
            List<AccountDTO> accounts = accountService.getAccountsByUserId(user_id, offset, size);

            redirectAttributes.addFlashAttribute("accounts", accounts);
            
            int totalAccounts = accountService.getTotalAccountsByUserId(user_id);
            int totalPages = (int) Math.ceil((double) totalAccounts / size);
            
            redirectAttributes.addFlashAttribute("totalPages", totalPages);
            redirectAttributes.addFlashAttribute("currentPage", page);
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인 후 이용해 주세요.");
        }
        return "redirect:/mypage";
    }


    
    @PostMapping("/my-account-management")
    @ResponseBody
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

        if (accountService.existsByAccountNo(account_no) > 0) {
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
    
    @PostMapping("/deposit")
    public String deposit(@RequestParam String account_no, 
                          @RequestParam double amount,
                          RedirectAttributes redirectAttributes) {
        try {
        	log.info("account:{}, amount:{}", account_no,amount);
//            accountService.deposit(account_no, amount);
            redirectAttributes.addFlashAttribute("message", "입금 성공!");
        } catch (AccountException e) {
            redirectAttributes.addFlashAttribute("message", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "알 수 없는 오류 발생. 다시 시도해주세요.");
        }

        return "redirect:/mypage";
    }

    @PostMapping("/withdraw")
    public String withdraw(@RequestParam String account_no, 
                           @RequestParam double amount,
                           RedirectAttributes redirectAttributes) {
        try {
            accountService.withdraw(account_no, amount);
            redirectAttributes.addFlashAttribute("message", "출금 성공!");
        } catch (AccountException e) {
            redirectAttributes.addFlashAttribute("message", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "알 수 없는 오류 발생. 다시 시도해주세요.");
        }

        return "redirect:/mypage";
    }
    
    
}