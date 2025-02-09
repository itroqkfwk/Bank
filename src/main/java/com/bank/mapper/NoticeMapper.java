package com.bank.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bank.dto.MemberDTO;
import com.bank.dto.NoticeDTO;


@Mapper
public interface NoticeMapper {
	
	public List<NoticeDTO> getNotices(RowBounds rowBounds);
	public int getNoticeCount();
	public List<NoticeDTO> getNoticeById(Long id);
	
}
