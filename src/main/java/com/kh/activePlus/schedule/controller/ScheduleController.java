package com.kh.activePlus.schedule.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.activePlus.schedule.model.exception.ScheduleException;
import com.kh.activePlus.schedule.model.service.ScheduleService;
import com.kh.activePlus.schedule.model.vo.Schedule;

@SessionAttributes("loginUser")
@Controller
//@RequestMapping("/schedule/*")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	private ScheduleService schdService;
	
	@RequestMapping(value="calendar.ap", method= { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView calender(@RequestParam String scd_sq, ModelAndView model) throws Exception  {
		logger.info("*********** start calendar [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		model.addObject("scd_sq", scd_sq);
		model.setViewName("schedule/calendar");
	
		logger.info("-------- end calendar [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]**************");
		return model;
		
		
	}
	
	@RequestMapping(value="selectSchedule.ap", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Schedule> selectSchedule(@RequestBody Map<String, Object> params, ModelAndView mv) throws Exception{
		logger.info("********** start selectSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		System.out.println(params);
		
		List<Schedule> result = schdService.selectSchedule(params);
		/*System.out.println("resultSize : " + result.size());*/
		// 날짜뒤에 .0없애기
		
		for(int i =0; i<result.size(); i++) {
			String start_date = result.get(i).getStart_date();
			String end_date = result.get(i).getEnd_date();
			start_date = start_date.substring(0, start_date.length()-2);
			end_date = end_date.substring(0, end_date.length()-2);
			result.get(i).setStart_date(start_date);
			result.get(i).setEnd_date(end_date);
			/*System.out.println("result : " + result);*/
		}
		logger.info("*********** end selectSchedule [connnect IP : "+ InetAddress.getLocalHost().getHostAddress() + "]*************");
		return result;
		
	}
	
	// 일정 삽입
	@RequestMapping(value="insertSchedule.ap", method = { RequestMethod.GET, RequestMethod.POST})
	public String insertSchedule(Schedule schd, ModelAndView mv) throws UnknownHostException {
		logger.info("********** start insertSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		//schd.setSContent(schd.getSContent().replaceAll("\n","<br>"));
		
		int result = schdService.insertSchedule(schd);
		
		logger.info("********** end insertSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		if (result > 0) {
			return "redirect:calendar.ap?scd_sq=" + schd.getScd_sq();
			
		}else {
			throw new ScheduleException("일정 추가에 실패했습니다.");
		}
		
	}
	
	// 일정 열람
	@RequestMapping(value = "readSchedule.ap", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Schedule readSchedule(@RequestBody Map<String, Object> params) throws Exception{
		logger.info("********** start readSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		Schedule result = schdService.readSchedule(params);
		//result.setSContent(result.getSContent().replaceAll("\n","<br>"));
		
		System.out.println("readSchedule : " + result);
		
		String start_date = result.getStart_date();
		String end_date = result.getEnd_date();
		start_date = start_date.substring(0, start_date.length()-5);
		end_date = end_date.substring(0, end_date.length()-5);
		result.setStart_date(start_date);
		result.setEnd_date(end_date);
		
		logger.info("********** end readSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		return result;
	}
	
	// 일정 수정
	@ResponseBody
	@RequestMapping(value="updateSchedule.ap", method= { RequestMethod.GET, RequestMethod.POST})
	public int updateSchedule(@RequestBody Map<String, String> params) throws Exception{
		logger.info("********** start updateSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		//params.put("sContent", params.get("sContent").replaceAll("\n", "<br>"));
		int result = schdService.updateSchedule(params);
		
		
		logger.info("********** end updateSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		
			return result;
		
	}
	
	// 일정 삭제
	@ResponseBody
	@RequestMapping(value="deleteSchedule.ap", method= {RequestMethod.GET, RequestMethod.POST})
	public int deleteSchedule(@RequestBody Map<String, Object> params) throws Exception{
		logger.info("********** start deleteSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
		int result = schdService.deleteSchedule(params);
		System.out.println("result : " + result);
		
		logger.info("********** end deleteSchedule [connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]*************");
		
			return result;
		
		
		
	}
	
}
