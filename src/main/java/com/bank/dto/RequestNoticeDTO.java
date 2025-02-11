package com.bank.dto;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RequestNoticeDTO {
	private Long id;
	@Size(min=3, max=50, message = "제목은 최소 3자 이상 50자 이하이어야 합니다.")
	private String title;
	@Size(min=3, max=5000, message = "내용은 최소 3자 이상 5000자 이하이어야 합니다.")
	private String contents;
	private Long userId;
}
