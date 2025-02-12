package com.bank.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bank.dto.AccountDTO;
import com.bank.dto.MemberDTO;
import com.bank.dto.TransactionDTO;

@Mapper
public interface TransactionMapper {
	
    List<TransactionDTO> getTransactionsByAccountId(@Param("accountId") Long account_id);

    void insertTransaction(TransactionDTO transaction);
}