package com.bank.controller;

import com.bank.service.AccountService;
import com.bank.service.MemberService;
import com.bank.service.TransactionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import com.bank.dto.AccountDTO;
import com.bank.dto.MemberDTO;
import com.bank.dto.MypageUserInfoDTO;
import com.bank.dto.TransactionDTO;
import com.bank.dto.UserInfoUpdateDTO;
import com.bank.exception.AccountException;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class AccountController {

    private final AccountService accountService;
    private final MemberService memberService;
    
    private final TransactionService transactionService;
    
    @Autowired
    private HttpSession session;
    
    @GetMapping("/mypage")
    public String accountPage(@RequestParam(defaultValue = "0") int page, 
                              @RequestParam(defaultValue = "5") int size,
                              Model model) {
    	
    	Integer id = (Integer) session.getAttribute("id");
    	String userid = (String) session.getAttribute("userid");

        if (id != null) {
            int offset = page * size;
            List<AccountDTO> accounts = accountService.getAccountsByUserId(id, offset, size);
            
            MemberDTO memberDto =  memberService.findByUserid(userid);
            
            MypageUserInfoDTO mypageUserInfo  = MypageUserInfoDTO.builder()
            		.id(memberDto.getId())
            		.userid(memberDto.getUserid())
            		.username(memberDto.getUsername())
            		.password(memberDto.getPassword())
            		.address(memberDto.getAddress())
            		.build();


            
            int totalAccounts = accountService.getTotalAccountsByUserId(id);
            int totalPages = (int) Math.ceil((double) totalAccounts / size);
            
            log.info("totalPages:{}, totalAccounts: {}, offset: {}, page:{}, size:{}", totalPages, totalAccounts, offset, page, size);
            
            model.addAttribute("accounts", accounts);
            model.addAttribute("userInfo", mypageUserInfo);
            model.addAttribute("UserInfoUpdateDTO", mypageUserInfo);
            model.addAttribute("userInfo", mypageUserInfo);
            model.addAttribute("totalPages", totalPages ==0? 1 : totalPages);
            model.addAttribute("currentPage", page);
        } else {
            model.addAttribute("message", "로그인 후 이용해 주세요.");
        }
        return "my-page";
    }


    
    @PostMapping("/my-account-management")
    @ResponseBody
    public List<AccountDTO> getAllAccounts() {
        return accountService.getAllAccounts();
    }
    
    @PostMapping("/add")
    public String addAccount(@RequestParam String account_name, 
                             @RequestParam String account_no, 
                             @RequestParam double money,
                             RedirectAttributes redirectAttributes) {

    	//로그인 없이 test위해 주석처리
        Integer id = (Integer) session.getAttribute("id");
        if (id == null) {
            redirectAttributes.addFlashAttribute("message", "사용자 정보가 없습니다. 로그인 후 다시 시도해주세요.");
            return "redirect:/login-page";  
        }

        if (accountService.existsByAccountNo(account_no) > 0) {
            redirectAttributes.addFlashAttribute("message", "중복된 계좌 번호입니다. 다른 계좌 번호를 입력해주세요.");
            return "redirect:/mypage";
        }

        if (account_name == null || account_name.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "계좌 이름을 입력해주세요.");
            return "redirect:/mypage";
        }

        if (account_no == null || account_no.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "계좌 번호를 입력해주세요.");
            return "redirect:/mypage";
        }

        AccountDTO account = new AccountDTO(account_name, account_no, money, id);  //추후에 1을 user_id로 변경 해야됨
        accountService.addAccount(account);  

        redirectAttributes.addFlashAttribute("message", "씨뱅크 계좌 추가 성공!");
        return "redirect:/mypage";
    }
    
    @PostMapping("/deposit")
    public String deposit(@RequestParam String account_no, 
                          @RequestParam double amount,
                          @RequestParam(required = false) String description,
                          RedirectAttributes redirectAttributes) {
        try {
            accountService.deposit(account_no, amount);
            log.info("입금 성공 - 계좌: {}, 금액: {}, 메모: {}", account_no, amount, description);
            redirectAttributes.addFlashAttribute("message", "입금 성공!");
        } catch (AccountException e) {
            redirectAttributes.addFlashAttribute("message", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "알 수 없는 오류 발생. 다시 시도해주세요.");
        }
        
        return "redirect:/mypage";
    }

    @PostMapping("/withdraw")
    public String withdraw(@RequestParam String account_no, 
                           @RequestParam double amount,
                           @RequestParam(required = false) String description,
                           RedirectAttributes redirectAttributes) {
        try {
            accountService.withdraw(account_no, amount);
            log.info("출금 성공 - 계좌: {}, 금액: {}, 메모: {}", account_no, amount, description);
            redirectAttributes.addFlashAttribute("message", "출금 성공!");
        } catch (AccountException e) {
            redirectAttributes.addFlashAttribute("message", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "알 수 없는 오류 발생. 다시 시도해주세요.");
        }
        
        return "redirect:/mypage";
    }
    
    // 사용자 정보 수정
    @PostMapping("/my-info-update")
    public String getMyInfoUpdatePage(
    		@ModelAttribute UserInfoUpdateDTO userInfo, 
    		RedirectAttributes redirectAttributes
    		) {
    		
    	
    	log.info("유저정보: {}", userInfo);
    	
    	MemberDTO originMemberDTO = memberService.findByUserid(userInfo.getUserid());
    	
    	MemberDTO updatedMemberDTO = MemberDTO.builder()
    	.id(originMemberDTO.getId())
    	.userid(userInfo.getUserid())
    	.username(userInfo.getUsername())
    	.email(originMemberDTO.getEmail())
    	.address(userInfo.getAddress())
    	.password(originMemberDTO.getPassword())
    	.build();
    	
    	int n = memberService.memberUpdate(updatedMemberDTO);
    	if(n == 0) {
    		redirectAttributes.addFlashAttribute("message","유저정보 수정 실패");
    	} else {
    		redirectAttributes.addFlashAttribute("message","유저정보 수정 성공");
    	}
    	return "redirect:/mypage";
    }
    
    
    @GetMapping("/transactions")
    public String getTransactionHistory(@RequestParam("accountId") Long account_id, Model model) {
    	if (account_id == null) {
            log.error("accountId가 전달되지 않았습니다.");
            model.addAttribute("message", "잘못된 요청입니다. 계좌를 선택해주세요.");
            return "my-page";
        }

        log.info("Account ID: {}", account_id);

        List<TransactionDTO> transactions = transactionService.getTransactionsByAccountId(account_id);
        log.info("조회된 거래 내역: {}", transactions);  

        model.addAttribute("transactions", transactions);
        return "my-page"; 
    }
}