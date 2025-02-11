package com.bank.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bank.dto.AccountDTO;

public interface AccountService {
	List<AccountDTO> getAllAccounts();
    AccountDTO getAccountById(int id);
    void addAccount(AccountDTO account);
    void updateAccount(AccountDTO account);
    void deleteAccount(int id);
    int checkAccountExists(String accountNo);
    int existsByAccountNo(@Param("accountNo") String accountNo);
    List<AccountDTO> getAccountsByUserId(int userId, int page, int size);
    int getTotalAccountsByUserId(int userId);
    public int deposit(String accountNo, double amount);
    public int withdraw(String accountNo, double amount);
    
    
}
