package com.bank.controller;

import com.bank.service.AccountService;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;
import com.bank.dto.AccountDTO;

@Controller
@RequiredArgsConstructor
public class AccountController {

    private final AccountService accountService;

    @GetMapping("/accounts")
    public List<AccountDTO> getAllAccounts() {
        return accountService.getAccountList();
    }
}