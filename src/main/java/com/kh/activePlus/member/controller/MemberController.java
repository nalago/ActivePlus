package com.kh.activePlus.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.activePlus.member.exception.MemberException;
import com.kh.activePlus.member.model.service.MemberService;
import com.kh.activePlus.member.model.vo.Member;
import com.kh.activePlus.member.model.vo.PageInfo;
import com.kh.activePlus.member.model.vo.Pagination;
import com.kh.activePlus.member.model.vo.Search;


@Controller
@SessionAttributes({"loginUser", "msg"})
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="loginform.ap")
	public String memberloginform() {
		
	return "member/loginform";	
	
	}
	
	@RequestMapping(value="login.ap", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.loginMember(m);
		
		
		if(loginUser != null) {
			
			model.addAttribute("loginUser", loginUser);
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		
		return "redirect:main.ap";
	}
	
	@RequestMapping("goMemberSystem")
	public ModelAndView memberSystem(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page
			) {
		
		int listCount = mService.selectListCount();
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Member> list = mService.selectList(pi);
		
		/*System.out.println(list);*/
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/goMemberSystem");
		}else {
			throw new MemberException("회원목록 출력에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("minsert.ap")
	public String memberInsert(Member m, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				m.setOriginalFileName(file.getOriginalFilename());
				m.setRenameFileName(renameFileName);
			}
		}
		
		int result = mService.insertMember(m);
		System.out.println(m);
		if(result > 0) {
			return "redirect:goMemberSystem.ap";
		}else {
			throw new MemberException("회원등록에 실패하였습니다.");
		}
	}
	// 파일 저장을 위한 별도의 메소드
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일이 저장 될 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\buploadFiles";
			
			File folder = new File(savePath);
			
			if(!folder.exists())	// 사진을 저장하고자 하는 경로가 존재하지 않는다면
				folder.mkdirs();	// 포함 된 경로를 모두 생성함
			
			// 파일 Rename -> 현재 시간 년월일시분초.확장자
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename(); // -> 원래 이름으로부터 확장자 추출
			String renameFileName = sdf.format(new Date()) 
					+ originFileName.substring(originFileName.lastIndexOf("."));
			
			String renamePath = folder + "\\" + renameFileName;
			
			
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return renameFileName;
		}
		
		@RequestMapping("memberInsertView.ap")
		public String memberinsertView() {
			return "member/memberInsertForm";
		}
		
		@RequestMapping("mdetail.ap")
		public ModelAndView memberDetail(ModelAndView mv,
					String id, @RequestParam("page") Integer page,
					HttpServletRequest request,
					HttpServletResponse response) {
			
			int currentPage = page !=  null ? page : 1;
			
			Member member = mService.selectMember(id);
			
			if(member != null) {
				mv.addObject("member", member)
				.addObject("currentPage", currentPage)
				.setViewName("member/memberDetailView");
			}else {
				throw new MemberException("회원 상세조회에 실패하였습니다.");
			}
			return mv;
		}
		
		@RequestMapping("mupView.ap")
		public ModelAndView memberUpdateView(ModelAndView mv, String id,
											@RequestParam("page") Integer page) {
			
			Member member = mService.selectMember(id);
			
			System.out.println(member);
			
			mv.addObject("member", member)
			  .addObject("currentPage", page)
			  .setViewName("member/memberUpdateForm");
			
			return mv;
		}
		
		@RequestMapping("mupdate.ap")
		public ModelAndView memberUpdate(ModelAndView mv, Member m,
										 HttpServletRequest request,
										 @RequestParam("page") Integer page,
										 @RequestParam(value="reloadFile", required=false) MultipartFile file) {
			if(file != null && !file.isEmpty()) {
				if(m.getRenameFileName() != null) {
					deleteFile(m.getRenameFileName(), request);
				}
				
				String renameFileName = saveFile(file, request);
				
				if(renameFileName != null) {
					m.setOriginalFileName(file.getOriginalFilename());
					m.setRenameFileName(renameFileName);
				}
			}
			
			int result = mService.updateMember(m);
			
			if(result > 0) {
				mv.addObject("page", page)
				  .setViewName("redirect:goMemberSystem.ap");
			}else {
				throw new MemberException("회원정보 수정에 실패하였습니다.");
			}
			
			return mv;
		}
		
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\muploadFiles";
			
			File f = new File(savePath + "\\" + fileName);
			
			if(f.exists())
				f.delete();
		}
		
		@RequestMapping("msearch.ap")
		public String memberSearch(Search search, Model model) {
			ArrayList<Member> searchList = mService.searchList(search);
		
			/*System.out.println(list);*/
			
			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			
			return "member/goMemberSystem";
		}
}
