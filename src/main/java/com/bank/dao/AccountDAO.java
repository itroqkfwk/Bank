package com.bank.dao;

import com.bank.dto.AccountDTO;
import java.util.List;

public interface AccountDAO {
    List<AccountDTO> getAllAccounts();
}