package com.bank.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bank.dto.AccountDTO;
import com.bank.dto.TransactionDTO;

public interface TransactionService {
	
	public void addTransaction(TransactionDTO transaction);
	public List<TransactionDTO> getTransactionsByAccountId(@Param("accountid") Long accountId);

    
}
