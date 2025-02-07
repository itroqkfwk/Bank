package com.bank.service;

import com.bank.dto.AccountDTO;
import com.bank.mapper.AccountMapper;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    AccountMapper accountMapper;

    public AccountServiceImpl(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    @Override
    public List<AccountDTO> getAllAccounts() {
        return accountMapper.selectAllAccounts();
    }

    @Override
    public AccountDTO getAccountById(int id) {
        return accountMapper.selectAccountById(id);
    }

    @Transactional
    @Override
    public void addAccount(AccountDTO account) {
        accountMapper.insertAccount(account);
    }

    @Transactional
    @Override
    public void updateAccount(AccountDTO account) {
        accountMapper.updateAccount(account);
    }

    @Transactional
    @Override
    public void deleteAccount(int id) {
        accountMapper.deleteAccount(id);
    }

}