package com.bank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bank.dto.AccountDTO;

@Mapper
public interface AccountMapper {

    @Select("SELECT * FROM Accounts")
    List<AccountDTO> selectAllAccounts();

    @Select("SELECT * FROM Accounts WHERE id = #{id}")
    AccountDTO selectAccountById(@Param("id") long id);
}