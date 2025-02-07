package com.bank.dao;

import com.bank.dto.AccountDTO;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

@Repository
public class AccountDAOImpl implements AccountDAO {

    @Override
    public List<AccountDTO> getAllAccounts() {
        // AccountDTO 객체를 적절히 생성하여 반환
        return Arrays.asList(
            new AccountDTO(1, "John Doe", "12345", 1000.0),
            new AccountDTO(2, "Jane Smith", "67890", 5000.0)
        );
    }
}