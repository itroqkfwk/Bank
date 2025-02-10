package com.bank.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bank.dto.MemberDTO;
import com.bank.dto.NoticeDTO;
import com.bank.dto.NoticeViewsDTO;
import com.bank.dto.RequestNoticeDTO;


@Mapper
public interface NoticeMapper {
	
	public List<NoticeDTO> getNotices(RowBounds rowBounds);
	public int getNoticeCount();
	public List<NoticeDTO> getNoticeById(Long id);
	public int deleteById(Long id);
	public int addNotice(RequestNoticeDTO requestNoticeDTO);
	public int updateNotice(RequestNoticeDTO requestNoticeDTO);
	public int updateViews(NoticeViewsDTO noticeViewsDTO);
	public int getViews(Long id);
}
