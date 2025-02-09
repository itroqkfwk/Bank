package com.bank.controller;

import com.bank.service.AccountService;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import com.bank.dto.AccountDTO;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")

public class AccountController {

    private final AccountService accountService;

    @PostMapping("/my-page")
    public String accoutpage(Model m) {
    	m.addAttribute("allaccount");
        return "my-page"; 
    }
    
    @PostMapping("/my-account-management")
    public List<AccountDTO> getAllAccounts() {
        return accountService.getAllAccounts();
    }
    
    @PostMapping("/add")
    public String addAccount(@RequestParam String account_name, @RequestParam String account_no, @RequestParam double money) {
        AccountDTO account = new AccountDTO(account_name, account_no, money, 1);  
        accountService.addAccount(account);
        return "씨뱅크 계좌 추가 성공!";
    }
    
//    @PostMapping("/delete")
//    public String addAccount(@RequestParam String account_name) {
//        AccountDTO account = new AccountDTO(account_name);  
//        accountService.addAccount(account);
//        return "아쉽게도 계좌가 삭제되었어요,,";
//    }
    
    
}