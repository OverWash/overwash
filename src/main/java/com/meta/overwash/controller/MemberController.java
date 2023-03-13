package com.meta.overwash.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.overwash.domain.MemberDTO;
import com.meta.overwash.domain.ReservationDTO;
import com.meta.overwash.domain.UserDTO;
import com.meta.overwash.service.MemberService;
import com.meta.overwash.service.ReservationService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@EnableGlobalAuthentication
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/table")
	public void table(Principal principal, Model model) {
		String username = principal.getName(); // 이거 이메일임.
		model.addAttribute("reservations", reservationService.getListMember(username));
		model.addAttribute("username", username);
	}
	
	@GetMapping("/main")
	public void main(Principal principal, Model model) {
		String username = principal.getName(); // 이거 이메일임.
		List<ReservationDTO> reservations = reservationService.getListMember(username);
		int lastNum = reservations.size()-1;
		ReservationDTO lastReservation = reservations.get(lastNum);
		model.addAttribute("lastNum", lastNum);
		model.addAttribute("reservations", reservations);
		model.addAttribute("lastReservation", lastReservation);
		model.addAttribute("username", username);
	}
	
	@PostMapping("/request")
		public String result(Principal principal, ReservationDTO reservation) throws ParseException {
		
		String username = principal.getName();
		Long memberId = reservationService.getMemberId(username);
		
		UserDTO user = new UserDTO();
		MemberDTO member = new MemberDTO();
		
		member.setUser(user);
		member.setMemberId(memberId);

		reservation.setMember(member);
		reservationService.register(reservation);

		return "/member/main";
	}
	


	@GetMapping({ "/mypage", "/modify" })
	public void get(@RequestParam("memberId") Long memberId, Model model) throws Exception {
		model.addAttribute("memberInfo", memberService.get(memberId));
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("memberId") Long memberId, RedirectAttributes rttr) throws Exception {
		if (memberService.remove(memberId)) {
			rttr.addFlashAttribute("result", "success"); // view에서 success시 탈퇴 완료 alert?
		}

		return "redirect:/login";
	}
	
	@PatchMapping("/modify")
	public String modify(UserDTO user, MemberDTO member, RedirectAttributes rttr) throws Exception {
		if (memberService.modify(user, member)) {
			rttr.addAttribute("result", "success");// view에서 success시 변경 완료 alert?
		} else {
			rttr.addAttribute("result", "fail"); // view에서 fail시 변경 실패 alert?
		}

		return "redirect:/member/main";
	}
	

	
	

	
	
	
}
