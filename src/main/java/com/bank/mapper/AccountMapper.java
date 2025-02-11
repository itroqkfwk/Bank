package com.bank.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bank.dto.AccountDTO;
import com.bank.dto.MemberDTO;

@Mapper
public interface AccountMapper {
	
    List<AccountDTO> selectAllAccounts();
    AccountDTO selectAccountById(@Param("id") int id);
    int insertAccount(AccountDTO account);
    int updateAccount(AccountDTO account);
    int deleteAccount(@Param("id") int id);
    int checkAccountExists(String accountNo);
    List<AccountDTO> selectAccountsByUserId(Map<String, Object> params);
    int countAccountsByUserId(@Param("userId") int userId);
    int existsByAccountNo(@Param("accountNo") String accountNo);
    int deposit(@Param("accountNo") String accountNo, @Param("amount") double amount);
    int withdraw(@Param("accountNo") String accountNo, @Param("amount") double amount);
    AccountDTO selectByAccountNo(@Param("accountNo") String accountNo);


}