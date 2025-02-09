package com.bank.service;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.bank.dto.NoticeDTO;
import com.bank.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;
import com.bank.exception.ResourceNotFoundHandler;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeMapper noticeMapper;

	@Override
	public List<NoticeDTO> getNotices(int page, int pageSize) {
		
		int offset = (page - 1) * pageSize;
		RowBounds rowBounds = new RowBounds(offset, pageSize);
		List<NoticeDTO> list = noticeMapper.getNotices(rowBounds);
		if(list.isEmpty()) {
			throw new ResourceNotFoundHandler("공지사항 목록을 찾을 수 없습니다.", 404);
		}
				
		return noticeMapper.getNotices(rowBounds) ;
	}

	@Override
	public int getNoticeCount() {
		return noticeMapper.getNoticeCount();
	}

	@Override
	public List<NoticeDTO> getNoticeById(Long id) {
		return noticeMapper.getNoticeById(id);
	}

	@Override
	public int deleteById(Long id) {
		return noticeMapper.deleteById(id);
	}
	
}
