package com.kh.activePlus.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.exception.EmployeeException;
import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.TNA;



@Controller
@SessionAttributes({"loginUser","msg", "TNA", "Tmsg"})
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping(value="loginform.ap")
	public String Employeeloginform() {
		
	return "employee/loginform";	
	
	}
	
	@RequestMapping("login.ap")
	public String EmployeeLogin(Employee m, Model model) {
		Employee loginUser = eService.loginEmployee(m);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}else {
			throw new EmployeeException("로그인에 실패하였습니다.");
		}
		return "redirect:main.ap";
		
	}
	
	@RequestMapping("goEmployeeSystem")
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
	
	@RequestMapping("minsert.ap")
	public String EmployeeInsert(Employee m, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				m.setOriginalFileName(file.getOriginalFilename());
				m.setRenameFileName(renameFileName);
			}
		}
		
		int result = eService.insertEmployee(m);
		System.out.println(m);
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
		
		@RequestMapping("employeeInsertView.ap")
		public String EmployeeinsertView() {
			return "employee/employeeInsertForm";
		}
		
		@RequestMapping("mdetail.ap")
		public ModelAndView EmployeeDetail(ModelAndView mv,
					String id, @RequestParam("page") Integer page,
					HttpServletRequest request,
					HttpServletResponse response) {
			
			int currentPage = page !=  null ? page : 1;
			
			Employee Employee = eService.selectEmployee(id);
			
			if(Employee != null) {
				mv.addObject("employee", Employee)
				.addObject("currentPage", currentPage)
				.setViewName("employee/employeeDetailView");
			}else {
				throw new EmployeeException("회원 상세조회에 실패하였습니다.");
			}
			return mv;
		}
		
		@RequestMapping("mupView.ap")
		public ModelAndView EmployeeUpdateView(ModelAndView mv, String id,
											@RequestParam("page") Integer page) {
			
			Employee Employee = eService.selectEmployee(id);
			
			System.out.println(Employee);
			
			mv.addObject("employee", Employee)
			  .addObject("currentPage", page)
			  .setViewName("employee/EmployeeUpdateForm");
			
			return mv;
		}
		
		@RequestMapping("mupdate.ap")
		public ModelAndView EmployeeUpdate(ModelAndView mv, Employee m,
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
			
			int result = eService.updateEmployee(m);
			
			if(result > 0) {
				mv.addObject("page", page)
				  .setViewName("redirect:goEmployeeSystem.ap");
			}else {
				throw new EmployeeException("회원정보 수정에 실패하였습니다.");
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
		public String EmployeeSearch(Search search, Model model) {
			ArrayList<Employee> searchList = eService.searchList(search);
		
			/*System.out.println(list);*/
			
			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			
			return "employee/goEmployeeSystem";
		}
		
		// 출근 버튼 클릭
		@RequestMapping("workstart.ap")
		@ResponseBody
		public String startWorking(String id, HttpServletRequest req) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar c = Calendar.getInstance();
			Date d = new Date(c.getTimeInMillis());
			String now = sdf.format(d);
			// System.out.println("출근 시각 d : " + d);
			// System.out.println("출근 시각 (now): " + now);
			
			// 세팅
			TNA tna = new TNA(d, id);
			
			ArrayList<TNA> tList = eService.startWorking(tna);
			if(tList != null) {
				req.getSession().setAttribute("TNA", tList);
			}
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
			// System.out.println("결과 : " + tList);
			
			return gson.toJson(tList);
		}
		
		// 퇴근 버튼 클릭
		@RequestMapping("workend.ap")
		@ResponseBody
		public String endWorking(int tid, String kind, HttpServletRequest req) {
			int result = 0;
			int hCount = 0;
			Employee emp = (Employee)req.getSession().getAttribute("loginUser");
			String empId = emp.getId();
			
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
			Calendar c = Calendar.getInstance();
			Date d = new Date(c.getTimeInMillis());
			String now = sdf.format(d);
			
			if(kind.equals("end")) {
				result = eService.endWorking(tid,kind);
			} else {
				hCount = eService.halfEnd(now, empId);
				if(hCount < 12) {
					result = eService.endWorking(tid,kind);
				} else {
					return "overHalf";
				}
			}
			
			if(result > 0) {
				req.getSession().setAttribute("Tmsg", "END");
				return "success";
			}
			return "failed";
			
		}
}
