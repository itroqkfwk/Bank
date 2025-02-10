package com.bank.service;

import com.bank.dto.AccountDTO;
import com.bank.mapper.AccountMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
    private AccountMapper accountMapper;

    public AccountServiceImpl(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }
    
    @Transactional
    @Override
    public List<AccountDTO> getAllAccounts() {
        return accountMapper.selectAllAccounts();
    }
    
    @Transactional
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
    
    @Transactional
	@Override
	public boolean checkAccountExists(String accountNo) {
		return accountMapper.checkAccountExists(accountNo) > 0;
	}

    @Transactional
	@Override
	public boolean existsByAccountNo(String accountNo) {
		try {
            return accountMapper.existsByAccountNo(accountNo); 
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}
    
    @Transactional
    @Override
    public List<AccountDTO> getAccountsByUserId(int userId, int page, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("offset", page * size);  
        params.put("size", size);
        
        return accountMapper.selectAccountsByUserId(params);
    }
    
    @Transactional
    @Override
    public int getTotalAccountsByUserId(int userId) {
        return accountMapper.countAccountsByUserId(userId);
    }

}