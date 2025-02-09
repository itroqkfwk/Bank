package com.bank.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.bank.service.NoticeService;
import com.bank.dto.NoticeDTO;
import com.bank.dto.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class NoticeController {
	
	private final NoticeService noticeService;

// 공지사항 상세 페이지
	@GetMapping("/notice-page/{noticeId}")
	public String getNoticeDetail(
			Model model, 
	        @RequestParam(defaultValue = "5") int pageSize,
	        @RequestParam(defaultValue = "1") int page,
			@PathVariable Long noticeId) {
		log.info("noticeId:{}", noticeId);
		
		List<NoticeDTO> list = noticeService.getNoticeById(noticeId);
		
		
		
		List<NoticeDTO> mainNotices = list.stream().filter((notice)-> notice.getId().equals(noticeId)).toList();
		List<NoticeDTO> prevAndNextNotices = list.stream().filter((notice)-> notice.getId() != noticeId).toList();
		
		log.info("list: {}", prevAndNextNotices);
		
		model.addAttribute("mainNotice", mainNotices.get(0));
		model.addAttribute("prevAndNextNotices", prevAndNextNotices);
		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);
		
		return "notice-detail-page";
	}
	
//	공지사항 메인 페이지
	@GetMapping("/notice-page")
	public String getNotices(
	        Model model, 
	        @RequestParam(defaultValue = "5") int pageSize,
	        @RequestParam(defaultValue = "1") int page
	        ) {
	    
	    log.info("pageSize:{}, page:{}", pageSize, page);
	    List<NoticeDTO> list = noticeService.getNotices(page, pageSize);
	    
	    int totalNoticeCount = noticeService.getNoticeCount();
	    log.info("notices:{}, length: {}", list, totalNoticeCount);
	    
	    // 전체 페이지 수 계산
	    int totalPage = (int) Math.ceil((double) totalNoticeCount / pageSize);
	    
	    // 페이지 그룹 계산 (현재 페이지가 포함된 그룹 계산)
	    int pageGroup = (int) Math.ceil((double) page / pageSize);
	    
	    // 첫 페이지, 마지막 페이지 계산
	    int lastPage = Math.min(pageGroup * pageSize, totalPage); // 페이지 그룹의 마지막 페이지 번호
	    int firstPage = (pageGroup - 1) * pageSize + 1; // 페이지 그룹의 첫 페이지 번호
	    
	    log.info("pageGroup:{}", pageGroup);
	    
	    PageDTO pageDTO = PageDTO.builder()
	                            .page(page)
	                            .pageSize(pageSize)
	                            .pageGroup(pageGroup)
	                            .lastPage(lastPage)
	                            .firstPage(firstPage)
	                            .totalPage(totalPage)
	                            .build();
	    
	    log.info("pageInfo: {}", pageDTO);
	    
	    model.addAttribute("notices", list );
	    model.addAttribute("pageInfo", pageDTO);
	    
	    return "notice-page";
	}

}
