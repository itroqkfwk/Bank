package com.bank.service;

import com.bank.dto.AccountDTO;
import com.bank.dto.TransactionDTO;
import com.bank.exception.AccountException;
import com.bank.mapper.AccountMapper;
import com.bank.mapper.TransactionMapper;

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
	
	@Autowired
    private TransactionMapper transactionMapper;
	

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
	public int checkAccountExists(String accountNo) {
		return accountMapper.checkAccountExists(accountNo);
	}

    @Transactional
    @Override
    public int existsByAccountNo(String accountNo) {
        return accountMapper.existsByAccountNo(accountNo);
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
    
    @Transactional
    @Override
    public int deposit(String accountNo, double amount) {
        if (amount <= 0) {
            throw new AccountException("입금 금액은 0보다 커야 합니다.");
        }

        AccountDTO account = accountMapper.selectByAccountNo(accountNo);  // 계좌 정보 조회
        if (account == null) {
            throw new AccountException("입금 실패! 존재하지 않는 계좌입니다.");
        }

        int updatedRows = accountMapper.deposit(accountNo, amount);
        if (updatedRows == 0) {
            throw new AccountException("입금 실패! 계좌번호를 확인해주세요.");
        }

        if (account != null) {
            TransactionDTO transaction = new TransactionDTO((long) amount, "입금", (long) account.getId(), "DEPOSIT");
            transactionMapper.insertTransaction(transaction);  // 트랜잭션 추가
        }

        return updatedRows;  
    }

    @Transactional
    @Override
    public int withdraw(String accountNo, double amount) {
        if (amount <= 0) {
            throw new AccountException("출금 금액은 0보다 커야 합니다.");
        }

        AccountDTO account = accountMapper.selectByAccountNo(accountNo);
        if (account == null) {
            throw new AccountException("출금 실패! 존재하지 않는 계좌입니다.");
        }
        if (account.getMoney() < amount) {
            throw new AccountException("출금 실패! 잔액이 부족합니다.");
        }

        int updatedRows = accountMapper.withdraw(accountNo, amount);
        if (updatedRows == 0) {
            throw new AccountException("출금 중 오류가 발생했습니다.");
        }
        
        TransactionDTO transaction = new TransactionDTO((long) amount, "출금", (long) account.getId(), "WITHDRAW");
        transactionMapper.insertTransaction(transaction);

        return updatedRows;  
    }
    
    

    @Transactional
    public void addTransaction(TransactionDTO transaction) {
        transactionMapper.insertTransaction(transaction);
    }

    public List<TransactionDTO> getTransactionsByAccountId(Integer accountId) {
        return transactionMapper.getTransactionsByAccountId(accountId);
    }
    


}