package com.bank.service;

import java.util.List;

import com.bank.dto.NoticeDTO;

public interface NoticeService {
	public int getNoticeCount();
	public List<NoticeDTO> getNotices(int page, int pageSize);
	public List<NoticeDTO> getNoticeById(Long id);
}
