package com.kh.activePlus.employee.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.passfindEmail;
import com.kh.activePlus.employee.model.vo.passfindEmailSender;

public class passfindEmailController {
	
	   @Autowired
	   private passfindEmailSender emailSender;
	   
	   @Autowired
	   private passfindEmail email;
	   
	    @Autowired
		private EmployeeService eService;
	  /*  @RequestMapping("/sendpw.ap")
	    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
	        ModelAndView mv;
	        String id=(String) paramMap.get("id");
	        String e_mail=(String) paramMap.get("email");
	        String pw=eService.getPw(paramMap);
	        System.out.println(pw);
	        if(pw!=null) {
	            email.setContent("비밀번호는 "+pw+" 입니다.");
	            email.setReceiver(e_mail);
	            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mv = new ModelAndView("redirect:/login.do");
	            return mv;
	        }else {
	            mv = new ModelAndView("redirect:/logout.do");
	            return mv;
	        }
	    }
*/
	    /*@RequestMapping("/newPassword")

		public String newPassword(@Valid Employee memberVO, HttpSession session) throws Exception {

			Random r = new Random();

			int num = r.nextInt(89999) + 10000;

			String npassword = "bapsi" + Integer.toString(num);// 새로운 비밀번호 변경

			memberVO.setPwd(pwd);(npassword);

			session.setAttribute("memberVO", memberVO);

			eService.newPassword(memberVO);

			return "/findPassword";

		}



		// 이메일로 비밀번호가 전송이된다.

		@RequestMapping("/findPassword")

		public String findPasswordOK(Employee employee, HttpSession session) throws Exception {

			employee = (employee) session.getAttribute("memberVO");

				email.setContent("새로운 비밀번호 " + employee.getPwd() + " 입니다. ");

				email.setReceiver(employee.getEmail());

				email.setSubject("안녕하세요"+employee.getEmail() +"님  재설정된 비밀번호를 확인해주세요");

				emailSender.SendEmail(email);

				System.out.println(email);

				session.invalidate();

				return "login";*/

	
}
