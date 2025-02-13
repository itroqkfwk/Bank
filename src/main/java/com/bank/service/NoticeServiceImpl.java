package com.bank.service;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bank.controller.NoticeController;
import com.bank.dto.NoticeDTO;
import com.bank.dto.NoticeViewsDTO;
import com.bank.dto.RequestNoticeDTO;
import com.bank.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import com.bank.exception.ResourceNotFoundHandler;

@Service
@RequiredArgsConstructor
@Slf4j
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

	@Override
	public int addNotice(RequestNoticeDTO requestNoticeDTO) {
		return noticeMapper.addNotice(requestNoticeDTO);
	}
	@Override
	public String upload(MultipartFile file) throws IOException {
	    // 1. 파일 저장 경로 설정
	    final String UPLOAD_DIR = "C:/upload/images"; // 운영 환경에 맞게 변경
	    Files.createDirectories(Paths.get(UPLOAD_DIR)); // 디렉토리 없으면 생성

	    // 2. 파일명 변환 (UUID 추가, 확장자 유지)
	    String originalFileName = file.getOriginalFilename();
	    String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	    String newFileName = UUID.randomUUID().toString() + extension;

	    // 3. 파일 저장
	    Path filePath = Path.of(UPLOAD_DIR, newFileName);
	    Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	    // 4. DB에 저장할 경로 반환
	    return "/assets/images/upload/" + newFileName;
	    
	}

	@Override
	public int getViews(long id) {
		return noticeMapper.getViews(id);
	}

	@Override
	public int updateNotice(RequestNoticeDTO requestNoticeDTO) {
		return noticeMapper.updateNotice(requestNoticeDTO);
	}

	@Override
	public int updateViews(NoticeViewsDTO noticeViewsDTO) {
		return noticeMapper.updateViews(noticeViewsDTO);
	}
}
