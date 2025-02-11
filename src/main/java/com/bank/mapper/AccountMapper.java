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
    
//    @Select("SELECT EXISTS (SELECT 1 FROM accounts WHERE account_no = #{accountNo})")
    int existsByAccountNo(@Param("accountNo") String accountNo);
    
//    @Update("UPDATE accounts SET money = money + #{amount} WHERE account_no = #{accountNo}")
    int deposit(@Param("accountNo") String accountNo, @Param("amount") double amount);

//    @Update("UPDATE accounts SET money = money - #{amount} WHERE account_no = #{accountNo} AND money >= #{amount}")
    int withdraw(@Param("accountNo") String accountNo, @Param("amount") double amount);

//    @Select("SELECT * FROM accounts WHERE account_no = #{accountNo}")
    AccountDTO selectByAccountNo(@Param("accountNo") String accountNo);


}