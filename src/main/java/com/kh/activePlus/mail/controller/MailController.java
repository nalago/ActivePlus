package com.kh.activePlus.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.exception.commonException;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.mail.model.service.MailService;
import com.kh.activePlus.mail.model.vo.Email;

@Controller
public class MailController {
	@Autowired
	private MailService mService;
	@Autowired
	private EmployeeService eService;
	
	
	@RequestMapping("mail.ap")
	public String goMail(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "inMail";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		ArrayList<Email> inList = mService.selectInList(receiver, kind, pi);
		// System.out.println(new Email().toString());
		if(inList != null) {
			req.setAttribute("pi", pi);
			req.setAttribute("inList", inList);
		} else {
			throw new commonException("받은 메일함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		return "mail/mailInbox";
	}
	@RequestMapping("sendbox.ap")
	public String goSendbox(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "send";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// System.out.println(pi);
		ArrayList<Email> sendList = mService.selectInList(receiver, kind, pi);
		sendList = selectReceiver(sendList);
		// System.out.println("sendList : " + sendList);
		if(sendList != null) {
			
			req.setAttribute("pi", pi);
			req.setAttribute("sendList", sendList);
		} else {
			throw new commonException("보낸 메일함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		return "mail/mailSendbox";
	}
	@RequestMapping("importantbox.ap")
	public String goImportantbox(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "important";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> iList = mService.selectInList(receiver, kind, pi);
		if(iList != null) {
			req.setAttribute("pi", pi);
			req.setAttribute("iList", iList);
		} else {
			throw new commonException("중요 메일함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		
		return "mail/mailImportantbox";
	}
	@RequestMapping("temporarybox.ap")
	public String goTemporarybo(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "temporary";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> temList = mService.selectInList(receiver, kind, pi);
		
		if(temList != null) {
			req.setAttribute("pi", pi);
			req.setAttribute("temList", temList);
		} else {
			throw new commonException("임시보관함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		
		return "mail/mailTemporarybox";
	}
	@RequestMapping("wastebox.ap")
	public String goWastebox(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "waste";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> wList = mService.selectInList(receiver, kind, pi);
		
		if(wList != null) {
			req.setAttribute("pi", pi);
			req.setAttribute("wList", wList);
		} else {
			throw new commonException("휴지통 로드 실패! 잠시후 다시 시도해주세요.");
		}
		return "mail/mailWastebox";
	}
	@RequestMapping("mailsend.ap")
	public String goMailSendForm(@RequestParam(name="mId", required=false)Integer mId,
			@RequestParam(name="kind", required=false)String kind, Model model){
		if(mId != null) {
			Email e = new Email();
			ArrayList<Email> list = new ArrayList<>();
			if(kind.equals("reSend")) {
				e = mService.selectMailSend(mId);
			} else { 
				e = mService.selectMailDel(mId);
			}
			list.add(e);
			
			list = selectReceiver(list);
			
			e = list.get(0);
			
			
			model.addAttribute("kind", kind);
			model.addAttribute("e",e);
		}
		
		return "mail/mailForm";
	}
	
	@RequestMapping("mailread.ap")
	public String readMail(int mId, String eId, Model model) {
		Email m = new Email();
		m.setMailId(mId);
		m.setReceiver(eId);
		m = mService.selectMail(m);
		mService.readMail(m);
		// 받는사람 조회 위해
		ArrayList<Email> email = new ArrayList<>();
		email.add(m);
		
		email = selectReceiver(email);
		
		
		/*String[] rArr = rList.get(m.getMailId());
		String r = rArr.;*/
		
		
		// 첨부파일
		ArrayList<Attachment> aList = null;
		if(m != null) {
			if(m.getAttStock() > 0) {
				Attachment at = new Attachment();
				at.setRefTable("MAIL");
				at.setRefId(mId+"");
				aList = mService.selectAttachment(at);
			}
			
		}
		
		model.addAttribute("m",m);
		model.addAttribute("fileList",aList);
		//model.addAttribute("rList",r);
		
		return "mail/mailReadView";
	}
	public ArrayList<Email> selectReceiver(ArrayList<Email> list) {
		for(int i = 0; i < list.size(); i++) {
			ArrayList<String> reList = mService.selectReceiver(list.get(i));
			String s = "";
			for(String str : reList) {
				s = s + str;
			}
			list.get(i).setMrName(s);
		}
		return  list;
	}
	
	// 메일 보내기
	@RequestMapping("send.ap")
	public String mailSend(Email e,@RequestParam(name="refInput", required=false) String refEmp,@RequestParam(name="rInput") String rEmp,
			@RequestParam(name="mId", required=false) Integer mNo, MultipartHttpServletRequest mReq) {
			
			System.out.println("controller : " + e);
		
		
			Employee user = (Employee)mReq.getSession().getAttribute("loginUser");
			List<MultipartFile> fList = null;
			e.setWriter(user.getId());
			String[] receiver = rEmp.split(",");
			String[] refReceiver = null;
			if(!refEmp.equals("")) {
				refReceiver = refEmp.split(",");
			}
			e.setAttStock(0);
			
			if(mReq.getFiles("files").size() > 1) {
				fList = mReq.getFiles("files");
				e.setAttStock(fList.size());
			} 
			int mId = mService.sendMail(e, receiver, refReceiver);
			System.out.println(mId);
			ArrayList<Attachment> aList = new ArrayList<>();
			if(mId > 0 && fList != null) {
				for(MultipartFile mf : fList) {
					Attachment at = saveFiles(mf, mReq);
					at.setRefId(mId+"");
					aList.add(at);
					
				}
				
			}
			if(aList.size() > 0 && mReq.getFiles("files").size() > 1) {
				int aResult = mService.insertAttachment(aList);
			}
			
		if(e.getCategory().equals("temp")) {
			int result = mService.sendTemp(mNo);
		}
		
		
		return "redirect:sendbox.ap";
	}
	@RequestMapping("openemp.ap")
	@ResponseBody
	public String openEmp() {
		
		ArrayList<Employee> eList = eService.selectEmpList();
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(eList);
	}
	
	/* 메일 보관함 변경 */
	@RequestMapping("mailset.ap")
	@ResponseBody
	public String mailSet(String kind, String set, HttpServletRequest req) {
		Employee em = (Employee)req.getSession().getAttribute("loginUser");
		String empId = em.getId();
		int result = 0;
		
		String[] chkId = req.getParameterValues("chkId");
		HashMap<String,String> hmap = new HashMap<>();
		hmap.put("empId", empId);
		hmap.put("kind", kind);
		hmap.put("sett", set);
		
		for(String s : chkId) {
			hmap.put("chkId", s);
			result += mService.setMail(hmap);
		}
		
		if(result > 0) {
			return "success";
		} else {
			return "failed";
			
		}
		
	}
	
	
	/* 파일 저장 메소드 */
	public Attachment saveFiles(MultipartFile file, HttpServletRequest req) {
		Attachment at = new Attachment();
		// 파일 저장 경로
		String root = req.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

			savePath = savePath + "\\mail";
			at.setRefTable("MAIL");

		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdirs();

		// 파일 Rename
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		// 확장자 추출
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName;
		at.setOriginalFile(originFileName);
		at.setRenameFile(renameFileName);
		at.setFilePath(savePath);

		try {
			file.transferTo(new File(folder + "\\" + renameFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return at;
	}

	public void deleteFile(String fileName, HttpServletRequest req) {
		String root = req.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		savePath = savePath + "\\mail";

		File f = new File(savePath + "\\" + fileName);

		if (f.exists())
			f.delete();

	}
}
