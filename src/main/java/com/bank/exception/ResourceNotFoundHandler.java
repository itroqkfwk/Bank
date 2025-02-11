package com.bank.exception;

import lombok.Getter;

@Getter
public class ResourceNotFoundHandler extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final Integer status;
	
	public ResourceNotFoundHandler(String message, Integer status) {
		super(message);
		this.status = status;
	}
}
