package com.kh.activePlus.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.exception.EmployeeException;
import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.MedicalTeam;
import com.kh.activePlus.employee.model.vo.TNA;
import com.kh.activePlus.employee.model.vo.passfindEmail;
import com.kh.activePlus.employee.model.vo.passfindEmailSender;



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
	public String EmployeeLogin(Employee e, Model model, HttpSession session, HttpServletRequest req) {
		
		
		Employee loginUser = eService.loginEmployee(e);
		
		/*	System.out.println("controller : " + loginUser );*/
			
			if(loginUser !=null) {

				if(loginUser.getId().equals(loginUser.getPwd())) {
					
					/*model.addAttribute("loginUser", loginUser);*/
					session.setAttribute("loginUser", loginUser);
					return "employee/firstLoginView";
					
				}else if(loginUser.getId().equals(e.getId()) && loginUser.getPwd().equals(e.getPwd()) ){
					/*model.addAttribute("loginUser", loginUser);*/
					session.setAttribute("loginUser", loginUser);
					return "main/main";
					
				}else {
					session.setAttribute("msg", "로그인에 실패하였습니다.");
					return "common/loginError";
					/*model.addAttribute("msg", "메세지");
					model.addAttribute("url", "loginform.ap");*/
					/*throw new EmployeeException("로그인에 실패하였습니다.");*/
				}
				
			}else{
				session.setAttribute("msg", "로그인에 실패하였습니다.");
				return "common/loginError";
				/*model.addAttribute("msg", "메세지");
				model.addAttribute("url", "loginform.ap");*/
				/*throw new EmployeeException("로그인에 실패하였습니다.");*/
			}
			/*return "redirect:main.ap";*/
		
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
		
		@RequestMapping("edetail.ap")
	      public ModelAndView EmployeeDetail(ModelAndView mv,
	               String id, @RequestParam("page") Integer page,
	               HttpServletRequest request,
	               HttpServletResponse response) {
	         
	         int currentPage = page !=  null ? page : 1;
	         
	         
	         Employee Employee = eService.selectEmployee(id);
	         String eid = Employee.getId(); 
	         ArrayList<Attachment> Attachment = eService.selectAttachment(eid);
	         
	         MedicalTeam MedicalTeam = eService.selectMediTeam(eid);
	         
	         System.out.println(MedicalTeam);
	         if(Employee != null) {
	            mv.addObject("Employee", Employee)
	            .addObject("Attachment", Attachment)
	            .addObject("MediTeam", MedicalTeam)
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
	         String eid = Employee.getId(); 
	         MedicalTeam MedicalTeam = eService.selectMediTeam(eid);
	         ArrayList<Attachment> Attachment = eService.selectAttachment(eid);
	         
	         
	         System.out.println(Employee);
	         
	         mv.addObject("Employee", Employee)
	           .addObject("Attachment", Attachment)
	           .addObject("MediTeam", MedicalTeam)
	           .addObject("currentPage", page)
	           .setViewName("employee/employeeUpdateForm");
	         
	         return mv;
	      }
		
		@RequestMapping("eupdate.ap")
	      public String EmployeeUpdate(Employee e, HttpServletRequest request, MedicalTeam mt,
	                              @RequestParam(value="reloadFile1", required=false) MultipartFile file1,
	                              @RequestParam(value="signreload", required=false) MultipartFile file2,
	                              String field, String grade) {
	         Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
			System.out.println(e);
			
			
	         int result = eService.updateEmployee(e);
	         
	         
	         
	         if(file1 != null && !file1.isEmpty()) {
	            if(e.getRenameFileName() != null) {
	               deleteFile(e.getRenameFileName(), request);
	            }
	            
	            String renameFileName1 = resaveFile(file1, request, "Employee");
	            
	            if(renameFileName1 != null) {
	               e.setOriginalFileName(file1.getOriginalFilename());
	               e.setRenameFileName(renameFileName1);
	            }
	         }
	         if(file2 != null && !file2.isEmpty()) {
	            if(e.getRenameFileName() != null) {
	               deleteFile(e.getRenameFileName(), request);
	            }
	            
	            String renameFileName2 = resaveFile(file2, request, "Approval");
	            
	            if(renameFileName2 != null) {
	               e.setOriginalFileName(file2.getOriginalFilename());
	               e.setRenameFileName(renameFileName2);
	            }
	         }
	         
	         if(e.getCategory().equals("의료")) {
	            
	            String id = e.getId();
	            
	            mt = new MedicalTeam(id, field, grade);
	            
	            System.out.println("컨트롤러 업데이트 mt" + mt);
	            
	            int result1 = eService.updateMedicalTeam(mt);
	            
	            System.out.println("인서트 컨트롤러 리서트"+result1);
	         }
	         if(result > 0) {
	        	 if(loginUser.getCategory().equals("인사")) {
	        		 return "redirect:goEmployeeSystem.ap";
	        		 
	        	 }else {
	        		 return "redirect:main.ap";
	        	 }
	        	 
	          }else {
	             throw new EmployeeException("회원정보 수정에 실패하였습니다.");
	          }

	       }
		
		public String resaveFile(MultipartFile file, HttpServletRequest request, String table) {
	         // 파일이 저장 될 경로 설정
	         String root = request.getSession().getServletContext().getRealPath("resources");
	         
	         String savePath = root + "\\uploadFiles/employee";
	         
	         File folder = new File(savePath);
	         
	         if(!folder.exists())   // 사진을 저장하고자 하는 경로가 존재하지 않는다면
	            folder.mkdirs();   // 포함 된 경로를 모두 생성함
	         
	         // 파일 Rename -> 현재 시간 년월일시분초.확장자
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	         String originFileName = file.getOriginalFilename(); // -> 원래 이름으로부터 확장자 추출
	         String renameFileName = sdf.format(new Date()) 
	               + originFileName.substring(originFileName.lastIndexOf("."));
	         
	         String renamePath = folder + "\\" + renameFileName;
	         
	         Attachment at = new Attachment(originFileName, renameFileName, savePath, table);
	         try {
	            file.transferTo(new File(renamePath));
	            
	            int result = eService.updateEmployeeAttachment(at);
	         } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	         }
	         
	         return renameFileName;
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
			
			System.out.println("asdasd"+e);
			
			System.out.println("비밀번호 업데이트 컨트롤러" + result);
			
			if(result > 0) {
				model.addAttribute("loginUser", e);
				rd.addFlashAttribute("msg", "비밀번호가 변경 되었습니다.");
			}else {
				throw new EmployeeException("회원 정보 수정에 실패하였습니다.");
			}
			return "employee/loginform";
		}
		
		/*@RequestMapping("myInfo.ap")
		public String myInfoView() {
			return "employee/mypage";
		}*/
		
		@RequestMapping("myInfo.ap")
		public ModelAndView myInfoView(ModelAndView mv,
					Employee e, HttpSession session,
					HttpServletRequest request,
					HttpServletResponse response) {
						
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			String eid = loginUser.getId();
			ArrayList<Attachment> Attachment = eService.selectAttachment(eid);
			
			
			System.out.println("마이페이지"+Attachment);
			
			System.out.println("마이페이지컨트롤러"+loginUser);
			
			if(loginUser != null) {
				mv.addObject("loginUser", loginUser)
				.addObject("Attachment", Attachment)
				.setViewName("employee/mypage");
			}else {
				throw new EmployeeException("회원 상세조회에 실패하였습니다.");
			}
			return mv;
		}
		
		@RequestMapping("edelete.ap")
		public String deleteEmp(@RequestParam("id")String id) {
			eService.deleteEmployee(id);
			return "redirect:goEmployeeSystem.ap";
		}
		
		@RequestMapping("searchpw.ap")
		public String PasswordfindView() {
			return "employee/searchpw";
		}
		
		@Autowired
		private passfindEmailSender emailSender;
	   
	    @RequestMapping("/sendpw.ap")
	    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
	        ModelAndView mv;
	        String id=(String) paramMap.get("id");
	        String e_mail=(String) paramMap.get("email");
	        System.out.println("컨트롤러 리시버 이메일 출력"+e_mail);
	        String pw=eService.getPw(paramMap);
	        System.out.println(pw);
	        if(pw!=null) {
	        	passfindEmail email = new passfindEmail();
	        	
	            email.setContent("비밀번호는 "+pw+" 입니다.");
	            email.setReceiver(e_mail);
	            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mv = new ModelAndView("redirect:loginform.ap");
	            return mv;
	        }else {
	            mv = new ModelAndView("redirect:loginform.ap");
	            mv.addObject("msg", "비밀번호가 없습니다.");
	            return mv;
	        }
	    }
	    
	    @RequestMapping("logOut.ap")
	    public /*ModelAndView*/ String logout(HttpSession session, SessionStatus status) {
	    	// session.invalidate();
	    	//ModelAndView mv = new ModelAndView("redirect:loginform.ap");
	    	session.removeAttribute("loginUser");;
	    	status.setComplete();
	    	return "redirect:loginform.ap";
	    }
}
