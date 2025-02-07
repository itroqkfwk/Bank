package com.bank.service;

import java.util.List;

import com.bank.dto.AccountDTO;

public interface AccountService {
	List<AccountDTO> getAllAccounts();
    AccountDTO getAccountById(int id);
    void addAccount(AccountDTO account);
    void updateAccount(AccountDTO account);
    void deleteAccount(int id);
}
