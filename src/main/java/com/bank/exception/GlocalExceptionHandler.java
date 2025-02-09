package com.bank.exception;

import java.time.LocalDateTime;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlocalExceptionHandler {
	
	
	@ExceptionHandler(ResourceNotFoundHandler.class)
	public ErrorResponse handleResourceNotFoundException(ResourceNotFoundHandler ex) {
		return new ErrorResponse(ex.getStatus(), ex.getMessage(), LocalDateTime.now());
	}
	
	@ExceptionHandler(Exception.class)
	public ErrorResponse handleException(Exception ex) {
		return new ErrorResponse(500, ex.getMessage(), LocalDateTime.now());
	}
	



	private static class ErrorResponse {
	    private int status;
	    private String message;
	    private LocalDateTime timestamp;

	    public ErrorResponse(int status, String message, LocalDateTime timestamp) {
	        this.status = status;
	        this.message = message;
	        this.timestamp = timestamp;
	    }

	    public int getStatus() {
	        return status;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public LocalDateTime getTimestamp() {
	        return timestamp;
	    }
	}

}
