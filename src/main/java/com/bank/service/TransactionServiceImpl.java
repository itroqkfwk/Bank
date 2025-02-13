package com.bank.service;

import com.bank.dto.TransactionDTO;
import com.bank.mapper.TransactionMapper;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TransactionServiceImpl implements TransactionService {

    private final TransactionMapper transactionMapper;

    @Override
    public void addTransaction(TransactionDTO transaction) {
        transactionMapper.insertTransaction(transaction);
    }

    @Override
    public List<TransactionDTO> getTransactionsByAccountId(Integer account_id) {
        return transactionMapper.getTransactionsByAccountId(account_id);
    }
}
