package com.bank.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bank.service.NoticeService;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Size;

import com.bank.dto.NoticeDTO;
import com.bank.dto.NoticeViewsDTO;
import com.bank.dto.PageDTO;
import com.bank.dto.RequestNoticeDTO;

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
	
	//공지사항 메인 페이지
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
	
	// 공지사항 쓰기 페이지
	@GetMapping("/notice-editor-page")
	public String getNoticeEditor(Model model) {
		model.addAttribute("RequestNoticeDTO", new RequestNoticeDTO()); // DTO 객체 추가
		return "notice-editor-page";
	}
	
	// 공지사항 수정 페이지
	@GetMapping("/notice-update-page/{id}")
	public String getNoticeUpdateEditor(
			@PathVariable Long id,
			Model model
			) {
			
		List<NoticeDTO> noticeDTOs = noticeService.getNoticeById(id);
		NoticeDTO noticeDTO = noticeDTOs.stream().filter((notice)-> notice.getId() == id).toList().get(0);
		
		RequestNoticeDTO initialNotice = RequestNoticeDTO.builder()
			.id(noticeDTO.getId())
			.title(noticeDTO.getTitle())
			.contents(noticeDTO.getContents())
			.build();
		
		log.info("contents:{}", noticeDTO.getContents());
		RequestNoticeDTO requestNoticeDTO = new RequestNoticeDTO();
		requestNoticeDTO.setId(noticeDTO.getId());
		model.addAttribute("RequestNoticeDTO", requestNoticeDTO); // DTO 객체 추가
		model.addAttribute("oldNotice", initialNotice);
		return "notice-update-page";
	}
	
	
	/*============== CRUD ================ */
	
	// 공지사항 추가
	@PostMapping("/notices/submit")
	public String addNotice(
	        @ModelAttribute("RequestNoticeDTO") @Valid RequestNoticeDTO requestNoticeDTO, 
	        BindingResult result, 
	        Model model) {
		
		if(result.hasErrors()) {
			return "notice-editor-page";
		}
		
		requestNoticeDTO.setUserId(-999L);
		noticeService.addNotice(requestNoticeDTO);
		
		model.addAttribute("success","정상적으로 추가되었습니다.");
		model.addAttribute("page",1);
		model.addAttribute("pageSize",5);
		
		return "redirect:/notice-page?page=1&pageSize=5";
	}
	
	// 공지사항 수정
	@PostMapping("/notices/update-submit/{id}")
	public String updateNotice(
			@PathVariable Long id,
	        @ModelAttribute("RequestNoticeDTO") @Valid RequestNoticeDTO requestNoticeDTO, 
	        BindingResult result, 
	        Model model) {
		
		if(result.hasErrors()) {
			return "notice-update-page";
		}
		
		requestNoticeDTO.setUserId(-999L);
		requestNoticeDTO.setId(id);
		noticeService.updateNotice(requestNoticeDTO);
		
		model.addAttribute("success","정상적으로 수정 되었습니다.");
		model.addAttribute("page",1);
		model.addAttribute("pageSize",5);
		
		return "redirect:/notice-page?page=1&pageSize=5";
	}

	// 공지사항 삭제
	@DeleteMapping("/notices/{noticeId}")
	public ResponseEntity<String> deleteNotice(@PathVariable Long noticeId) {
		
		log.info("id: {}",noticeId);
		int n = noticeService.deleteById(noticeId);
		if(n>0) {
			return  ResponseEntity.ok("삭제 되었습니다.");
		} else {
			 return ResponseEntity.status(400).body("삭제 실패: 존재하지 않는 게시글 ID 입니다.");
		}
	}
	

	// 공지사항 이미지 업로드
	@PostMapping("/notices/image-upload")
	public ResponseEntity<?> uploadImage(
			@RequestParam MultipartFile file
			) throws IOException{
		log.info("업로드된 파일: {}", file.getOriginalFilename());

		String fileUrl = noticeService.upload(file);
	    
	    return ResponseEntity.ok().body(Map.of("url", fileUrl, "message", "파일을 성공적으로 업로드 하였습니다."));
	}
	
	// 조회수 증가
	@PatchMapping("/notices/views/{id}")
	public String updateViews(@RequestParam Long id) {
		
		 int views = noticeService.getViews(id);
		 NoticeViewsDTO noticeViewsDTO = new NoticeViewsDTO(id, (long) views);
		 
		 noticeService.updateViews(noticeViewsDTO);
		 
		 return null;
		
	}
}