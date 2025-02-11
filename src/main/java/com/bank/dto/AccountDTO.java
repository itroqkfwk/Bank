package com.bank.dto;

public class AccountDTO {
	
	private int id;
	private String account_name;
	private String account_no;
	private double money;
	private int user_id;
	
	public AccountDTO() {}

	public AccountDTO(int id, String account_name, String account_no, double money, int user_id) {
		super();
		this.id = id;
		this.account_name = account_name;
		this.account_no = account_no;
		this.money = money;
		this.user_id = user_id;
	}

	public AccountDTO(String account_name, String account_no, double money, int user_id) {
		this.account_name = account_name;
		this.account_no = account_no;
		this.money = money;
		this.user_id = user_id;
	}
	
	public AccountDTO(String account_name) {
		this.account_name = account_name;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "AccountDTO [id=" + id + ", account_name=" + account_name + ", account_no=" + account_no + ", money="
				+ money + ", user_id=" + user_id + "]";
	}
	
	
	

	
	
}
