package com.bank.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class PageDTO {
	
	private int page;
	private int pageSize;
	private int firstPage;
	private int lastPage;
	private int totalPage;
	private int pageGroup;

}
