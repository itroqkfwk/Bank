package com.bank.dto;

import java.sql.Timestamp;

public class TransactionDTO {
	private Long id;
    private Long cost;
    private String description;
    private Long account_id;
    private String transaction_type;
    private Timestamp created_at;

    public TransactionDTO() {}

    public TransactionDTO(Long cost, String description, Long account_id, String transaction_type) {
        this.cost = cost;
        this.description = description;
        this.account_id = account_id;
        this.transaction_type = transaction_type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCost() {
        return cost;
    }

    public void setCost(Long cost) {
        this.cost = cost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getAccount_id() {
        return account_id;
    }

    public void setAccount_id(Long account_id) {
        this.account_id = account_id;
    }

    public String getTransaction_type() {
        return transaction_type;
    }

    public void setTransaction_type(String transaction_type) {
        this.transaction_type = transaction_type;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
