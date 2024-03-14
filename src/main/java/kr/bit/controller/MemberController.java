package kr.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.bit.entity.Member;
import kr.bit.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberMapper mapper;
	
	@RequestMapping("/memberJoin.do")
	public String memberJoin() {
		return "member/join";
	}
	@PostMapping("/memberDbcheck.do")
	public @ResponseBody int memberDbcheck(@RequestParam("memberId") String memberId) {
		Member member=mapper.memberDbCheck(memberId);
		if(member!=null || memberId.equals("")) {
		return 0;}
		return 1;
	}
}
