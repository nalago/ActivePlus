package com.kh.activePlus.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.exception.EmployeeException;
import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;




@Controller
@SessionAttributes({"loginUser", "msg"})
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping(value="loginform.ap")
	public String Employeeloginform() {
		
	return "employee/loginform";	
	
	}
	
	@RequestMapping(value="login.ap", method=RequestMethod.POST)
	public String EmployeeLogin(Employee e, Model model) {
		
		Employee loginUser = eService.loginEmployee(e);
		
		System.out.println("controller : " + loginUser );
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}else {
			throw new EmployeeException("로그인에 실패하였습니다.");
		}
		
		return "redirect:main.ap";
	}
	
	@RequestMapping("goEmployeeSystem.ap")
	public ModelAndView EmployeeSystem(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page
			) {
		
		int listCount = eService.selectListCount();
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Employee> list = eService.selectList(pi);
		
		/*System.out.println(list);*/
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("employee/goEmployeeSystem");
		}else {
			throw new EmployeeException("회원목록 출력에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("einsert.ap")
	public String EmployeeInsert(Employee e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				e.setOriginalFileName(file.getOriginalFilename());
				e.setRenameFileName(renameFileName);
			}
		}
		
		int result = eService.insertEmployee(e);
		System.out.println(e);
		if(result > 0) {
			return "redirect:goEmployeeSystem.ap";
		}else {
			throw new EmployeeException("회원등록에 실패하였습니다.");
		}
	}
	// 파일 저장을 위한 별도의 메소드
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일이 저장 될 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\uploadFiles/employee";
			
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
		
		@RequestMapping("employeeInsertView.ap")
		public String EmployeeinsertView() {
			return "employee/employeeInsertForm";
		}
		
		@RequestMapping("edetail.ap")
		public ModelAndView EmployeeDetail(ModelAndView mv,
					String id, @RequestParam("page") Integer page,
					HttpServletRequest request,
					HttpServletResponse response) {
			
			int currentPage = page !=  null ? page : 1;
			
			Employee Employee = eService.selectEmployee(id);
			
			
			if(Employee != null) {
				mv.addObject("Employee", Employee)
				.addObject("currentPage", currentPage)
				.setViewName("employee/employeeDetailView");
			}else {
				throw new EmployeeException("회원 상세조회에 실패하였습니다.");
			}
			return mv;
		}
		
		@RequestMapping("eupView.ap")
		public ModelAndView EmployeeUpdateView(ModelAndView mv, String id,
											@RequestParam("page") Integer page) {
			
			Employee Employee = eService.selectEmployee(id);
			
			System.out.println(Employee);
			
			mv.addObject("Employee", Employee)
			  .addObject("currentPage", page)
			  .setViewName("employee/employeeUpdateForm");
			
			return mv;
		}
		
		@RequestMapping("eupdate.ap")
		public String EmployeeUpdate(Employee e,
										 HttpServletRequest request,
										 @RequestParam("page") Integer page,
										 @RequestParam(value="reloadFile", required=false) MultipartFile file) {
			if(file != null && !file.isEmpty()) {
				if(e.getRenameFileName() != null) {
					deleteFile(e.getRenameFileName(), request);
				}
				
				String renameFileName = saveFile(file, request);
				
				if(renameFileName != null) {
					e.setOriginalFileName(file.getOriginalFilename());
					e.setRenameFileName(renameFileName);
				}
			}
			
			int result = eService.updateEmployee(e);
			
			System.out.println("controller e" + e);
			
			System.out.println("controller"+result);
			
			if(result > 0) {
				return "redirect:goEmployeeSystem.ap";
			}else {
				throw new EmployeeException("회원정보 수정에 실패하였습니다.");
			}

		}
		
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles/employee";
			
			System.out.println(savePath);
			File f = new File(savePath + "\\" + fileName);
			
			if(f.exists())
				f.delete();
		}
		
		@RequestMapping("esearch.ap")
		public String EmployeeSearch(Search search, Model model) {
			ArrayList<Employee> searchList = eService.searchList(search);
			
			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			
			return "employee/goEmployeeSystem";
		}
		
		@RequestMapping("edelete.ap")
		public String EmployeeDelete(String id, RedirectAttributes rd) {
			int result = eService.deleteEmployee(id);
			
			if(result > 0) {
				rd.addFlashAttribute("msg", "회원 탈퇴가 완료되었습니다.");
			}else {
				throw new EmployeeException("회원 탈퇴에 실패하였습니다.");
			}
			return "redirect:goEmployeeSystem";
		}
		
		@RequestMapping("elist.ap")
		public ModelAndView EmployeeList(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page
				) {
			// 커맨드 객체 사용 시 해당 파라미터가 존재하지 않을 경우 null 값을 반환함
			// 기본 자료형인 int는 null 값을 저장할 수 없어 오류 발생하므로 Integer로 정의함
			
			// 1. 전체 게시글 수 리턴 받기
			int listCount = eService.selectListCount();
			
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10 , 5);
			
			ArrayList<Employee> list = eService.selectList(pi);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("employee/goEmployeeSystem");
			} else {
				throw new EmployeeException("게시글 목록 조회에 실패하였습니다.");
			}
			
			return mv;
		}
		
		@RequestMapping("passUpdate.ap")
		public String EmployeeUpdate(Employee e,
									 Model model, RedirectAttributes rd) {
			int result = eService.updatePass(e);
			
			if(result > 0) {
				model.addAttribute("loginUser", e);
				rd.addFlashAttribute("msg", "비밀번호가 변경 되었습니다.");
			}else {
				throw new EmployeeException("회원 정보 수정에 실패하였습니다.");
			}
			return "employee/loginform";
		}
}
