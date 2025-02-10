package com.bank.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bank.dto.NoticeDTO;
import com.bank.dto.RequestNoticeDTO;

public interface NoticeService {
	public int getNoticeCount();
	public List<NoticeDTO> getNotices(int page, int pageSize);
	public List<NoticeDTO> getNoticeById(Long id);
	public int deleteById(Long id);
	public int addNotice(RequestNoticeDTO requestNoticeDTO);
	public String upload(MultipartFile file) throws IOException;
}
