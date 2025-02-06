package com.bank.service;

import com.bank.dao.AccountDAO;
import com.bank.dto.AccountDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    private final AccountDAO accountDAO;

    public AccountServiceImpl(AccountDAO accountDAO) {
        this.accountDAO = accountDAO;
    }

    @Override
    public List<AccountDTO> getAccountList() {
        return accountDAO.getAllAccounts();
    }
}