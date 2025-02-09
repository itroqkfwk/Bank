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
public class NoticeDTO {
	
	private Long id;
	private String title;
	private String contents;
	private AdminDTO admin;
	private Long views;
	private String createdAt;
}
