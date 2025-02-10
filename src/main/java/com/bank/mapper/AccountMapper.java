package com.bank.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
    boolean existsByAccountNo(String accountNo);
    List<AccountDTO> selectAccountsByUserId(Map<String, Object> params);
    int countAccountsByUserId(@Param("userId") int userId);


}