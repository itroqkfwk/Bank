package com.bank.service;

import com.bank.dto.TransactionDTO;
import com.bank.mapper.TransactionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {

    private final TransactionMapper transactionMapper;

    @Autowired
    public TransactionServiceImpl(TransactionMapper transactionMapper) {
        this.transactionMapper = transactionMapper;
    }

    @Override
    public void addTransaction(TransactionDTO transaction) {
        transactionMapper.insertTransaction(transaction);
    }

    @Override
    public List<TransactionDTO> getTransactionsByAccountId(Long account_id) {
        return transactionMapper.getTransactionsByAccountId(account_id);
    }
}
