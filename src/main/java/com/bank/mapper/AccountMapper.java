package com.bank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bank.dto.AccountDTO;


public interface AccountMapper {

	List<AccountDTO> selectAllAccounts();
    AccountDTO selectAccountById(int id);
}