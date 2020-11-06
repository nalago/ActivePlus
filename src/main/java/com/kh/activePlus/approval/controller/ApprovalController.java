package com.kh.activePlus.approval.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.approval.model.exception.ApprovalException;
import com.kh.activePlus.approval.model.service.ApprovalService;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalApvDoc;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.approval.model.vo.Sign;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;
	@RequestMapping("approvalMain.ap")
	public ModelAndView goApproval(ModelAndView mv, HttpServletRequest request) throws Exception {
		// 전자결재 메인창에 띄울 세 리스트 불러오기
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String empId= loginUser.getId();
		// 임시문서
		ApprovalSearch tempDocSearch = new ApprovalSearch(empId, "0");
		ApprovalSearch apvDocSearch = new ApprovalSearch(empId, "1");
		ApprovalSearch compDocSearch = new ApprovalSearch(empId, "4");
		
		ArrayList<ApvDoc> tempList = aService.selectApvDocList(tempDocSearch);
		// 결재 예정 문서
		ArrayList<ApvDoc> apvList = aService.selectApvDocList(apvDocSearch);
		// 결재 완료 문서
		ArrayList<ApvDoc> apvCompList = aService.selectApvDocList(compDocSearch);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		
		
		System.out.println(tempList);
		System.out.println(apvList);
		System.out.println(apvCompList);
		
		mv.addObject("tempList", tempList);
		mv.addObject("apvList", apvList);
		mv.addObject("apvCompList", apvCompList);
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	@RequestMapping("draftingList.ap")
	public ModelAndView goDrafting(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		int listCount = aService.selectAllDocTypeListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		System.out.println(pi);
		ArrayList<Doc> dList = aService.selectAllDocTypeList(eId, pi);
		
		if(dList != null) {
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/draftingList");
		}else {
			throw new ApprovalException("문서양식 리스트 조회 실패");
		}
		
		
		return mv;
	}
	@RequestMapping("docDetail.ap")
	public String docDetail() {
		return "approval/drafting";
	}
	@RequestMapping("privateList.ap")
	public ModelAndView goPrivateList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		System.out.println("private "+loginUser);
		String eId = loginUser.getId();
		System.out.println("private" + eId);
		int listCount = aService.selectPrivateListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Doc> pList = aService.selectPrivateList(eId, pi);
		
		if(pList != null) {
			mv.addObject("pList",pList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/privateDocList");
			return mv;
		}else {
			throw new ApprovalException("개인양식 조회 실패");
		}
		
	}
	@RequestMapping("privateDoc.ap")
	public String goPrivate() {
		return "approval/privateDoc";
	}
	
	@RequestMapping("selectPriDoc.ap")
	public ModelAndView selectPriDoc(ModelAndView mv, HttpServletRequest request,
			int docNo) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		Doc searchd = new Doc(docNo, eId);
		
		Doc PriDoc = aService.selectPriDoc(searchd);
		
		System.out.println("select pridoc"+PriDoc);
		
		if(PriDoc != null) {
			mv.addObject("priDoc", PriDoc);
			mv.setViewName("approval/privateDoc");
			return mv;
		}else {
			throw new ApprovalException("개인양식을 불러오는데 실패했습니다.");
		}
		
	}
	
	@RequestMapping("priDocSave.ap")
	public ModelAndView priDocSave(ModelAndView mv, HttpServletRequest request,
			String priDocTitle, String priDocContent, String docexplanation) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		Doc priDoc = new Doc(priDocTitle, priDocContent, docexplanation, eId);
		
		int result = aService.priDocSave(priDoc);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "정상적으로 기안되었습니다.");
			mv.setViewName("approval/privateDocList");
			return mv;
		}else {
			throw new ApprovalException("개인양식 등록에 실패하였습니다.");
		}
		
	}
	
	
	@RequestMapping("deletePriDoc.ap")
	public ModelAndView deletePriDoc(ModelAndView mv,HttpServletRequest request,
			int docNo) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		Doc searchd = new Doc(docNo, eId);
		
		int result = aService.deletePriDoc(searchd);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "정상적으로 삭제되었습니다.");
			mv.setViewName("redirect:privateList.ap");
			return mv;
		}else {
			throw new ApprovalException("개인양식 삭제에 실패하였습니다.");
		}
		
		
	}
	
	@RequestMapping("temporaryList.ap")
	public ModelAndView gotemporaryList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page){
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		System.out.println(eId);
		int listCount = aService.selectTemporaryListCount(eId);
		System.out.println(listCount);
		
		int currentPage = page != null ? page : 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		System.out.println(pi);
		
		ArrayList<ApvDoc> tList = aService.selectTemporaryList(eId, pi);
		
		if(tList != null) {
			mv.addObject("tList",tList);
			mv.addObject("pi", pi);
			mv.setViewName("approval/temporaryList");
			return mv;
		}else {
			throw new ApprovalException("임시저장 문서 조회 실패");
		}
		
	}
	
	@RequestMapping("selectTempDoc.ap")
	public ModelAndView SelectTempDoc(ModelAndView mv, HttpServletRequest request,
			int apvDocNo) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		ApvDoc searchTemp = new ApvDoc(apvDocNo, eId);
		
		ArrayList<Employee> eList = aService.selectEmpList();
		
		ApvDoc tempDoc = aService.selectTempDoc(searchTemp);
		Doc doc = aService.selectDoc(tempDoc.getDocNo());
		if(doc.getDocType().equals("PRIVATE")) {
		tempDoc.setApvDocContent(tempDoc.getApvDocContent().substring(tempDoc.getApvDocContent().indexOf("@")+1));
		}else {
			//tempDoc.setApvDocContent(tempDoc.getApvDocContent().substring(0, tempDoc.getApvDocContent().indexOf("@")));
		}
		System.out.println(tempDoc.getApvDocContent());
		String a = String.valueOf(apvDocNo);
		ArrayList<Attachment> tempAt = aService.selectTempAt(a);
		System.out.println("임시저장 첨부파일"+tempAt);
		
		if(tempDoc != null) {
			mv.addObject("doc",doc);
			mv.addObject("eList", eList);
			mv.addObject("tempAt", tempAt);
			mv.addObject("tDoc",tempDoc);
			mv.setViewName("approval/tempDoc");
			return mv;
		}else {
			throw new ApprovalException("임시저장 문서를 불러오는데 실패하였습니다.");
		}
		
	}
	
	
	
	@RequestMapping("approvalObtainList.ap")
	public ModelAndView goObtainList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		int listCount = aService.selectApprovalObtainListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<ApprovalApvDoc> oList = aService.selectApprovalObtainList(eId, pi);
		
		
		if(oList != null) {
			mv.addObject("oList",oList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalObtainList");
			return mv;
		}else {
			throw new ApprovalException("결재 받을 문서 조회 실패");
		}
		
	}
	@RequestMapping("approvalList.ap")
	public ModelAndView goApprovalList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		int listCount = aService.selectApprovalListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<ApprovalApvDoc> apList = aService.selectApprovalList(eId, pi);
		
		if(apList != null) {
			mv.addObject("apList",apList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalList");
			return mv;
		}else {
			throw new ApprovalException("결재 예정 문서 조회 실패");
		}
		
	}
	@RequestMapping("approvalCompleteList.ap")
	public ModelAndView goApprovalCompleteList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		int listCount = aService.selectAprrovalCompleteListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<ApprovalApvDoc> cList = aService.selectApprovalCompleteList(eId,pi);
		
		if(cList != null) {
			mv.addObject("cList",cList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalComplList");
			return mv;
		}else {
			throw new ApprovalException("임시저장 문서 조회 실패");
		}
		
	}
	
	
	@RequestMapping("docTypeList.ap")
	public ModelAndView docTypeList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page, String docType ) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		
		ApprovalSearch as = new ApprovalSearch(eId, docType);
		
		int listCount = aService.selectDocTypeListCount(as);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Doc> dList = aService.selectDocTypeList(as, pi); 
		
		System.out.println(dList);
		if(dList != null) {
			mv.addObject("docType",docType);
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/draftingList");
			return mv;
		}else {
			throw new ApprovalException("문서양식 리스트 조회 실패");
		}
		
	}
	
	@RequestMapping("selectDoc.ap")
	public ModelAndView selectDoc(ModelAndView mv,int docNo) {
		Doc doc = aService.selectDoc(docNo);
		ArrayList<Employee> eList = aService.selectEmpList();
		System.out.println(docNo);
		System.out.println("selectDoc"+doc);
		
		if(doc != null) {
			mv.addObject("eList", eList);
			mv.addObject("doc", doc);
			mv.setViewName("approval/drafting");
			return mv;
		}else {
			throw new ApprovalException("양식 조회 실패");
		}
		
	}
	
	
	@RequestMapping(value="drafting.ap", method=RequestMethod.POST)
	public ModelAndView drafting(ModelAndView mv, MultipartHttpServletRequest request,
			String[] apvprocedureNames, String comment, String apvDocContent,
			String apvDocTitle, int docNo, @RequestParam(value="apvDocNo", required=false, defaultValue="0") int apvDocNo
			) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getId();
		String[] procedureNames = new String[apvprocedureNames.length+1];
		String[] apvTypes = new String[apvprocedureNames.length+1];
		int[] apvtype = new int[apvprocedureNames.length+1];
		String[] empIds = new String[apvprocedureNames.length+1];
		String apdPath = "";
		String a = String.valueOf(apvDocNo);
		ArrayList<Attachment> checkAt = aService.selectTempAt(a);
		
		/* 결재선 */
		apdPath = "0 "+loginUser.getName()+"["+ eId + "] (기안)";
		empIds[0] = eId;
		apvTypes[0] = "(기안)";
		for(int i = 0; i < apvprocedureNames.length; i++) {
			
			System.out.println(apvprocedureNames[i].toString());
			apdPath +=", "+ apvprocedureNames[i].toString();
			int begin = apvprocedureNames[i].indexOf(" ");
			int end = apvprocedureNames[i].indexOf(" (");
			
			int ebegin = apvprocedureNames[i].indexOf("[");
			int eend = apvprocedureNames[i].indexOf("]");
			empIds[i+1] = apvprocedureNames[i].substring(ebegin+1, eend);
			procedureNames[i] = apvprocedureNames[i].substring(begin, end);
			apvTypes[i+1] = apvprocedureNames[i].substring(end+1);
			
			if(apvTypes[i+1].contains("결재")) {
				apvtype[i+1] = 1;
			}else if(apvTypes[i+1].contains("합의")) {
				apvtype[i+1] = 2;
			}
		}
		
		/* 첨부파일 (전자문서 먼저 저장 후에 문서번호 가져와서 넣기) */
		List<MultipartFile> fileList = request.getFiles("apvfiles");
		int result3 = 0;
		int filesize = 0;
		
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				filesize = fileList.size();
			}else if(file.isEmpty() && apvDocNo != 0) {
				ArrayList<Attachment> atList = aService.selectTempAt(a);
				if (atList != null) {
					for (Attachment at : atList) {
						deleteFile(at.getRenameFile(), request);
					}
				}else {
					break;
				}
			}
		}
		
		/* 기안문 넘길 곳 */
		ApvDoc draftingDoc = new ApvDoc(apvDocTitle, apvDocContent, apdPath, docNo, eId, filesize );
		
		int result = aService.draftingDoc(draftingDoc);
		String checkatId = "";
		
		if(checkAt != null && !checkAt.isEmpty() && checkAt.size() != 0) {
			if(!checkAt.get(0).getRefId().equals("")) {
				checkatId = checkAt.get(0).getRefId();
			}
			int result4 = aService.insertAtListToApvDocFromTemp(checkatId);
			int result5 = aService.deleteTempDoc(apvDocNo);
		}

		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				result3 = saveFile(fileList, request);
				break;
			}else {
				break;
			}
		}
		
		int result2 = 0;
		if(result > 0) {
			System.out.println(empIds.length);
			for(int i = 0; i < empIds.length; i++) {
				System.out.println(apvtype[i] +" "+ empIds[i]);
				Approval apv = new Approval(i,apvtype[i], empIds[i]);
				result2 += aService.insertApproval(apv);
			}
			
			if(result2 == empIds.length) {
				
				request.getSession().setAttribute("msg", "정상적으로 기안되었습니다.");
				mv.setViewName("redirect:draftingList.ap");
				return mv;
			}else {
				throw new ApprovalException("결재선 등록 실패");
			}
			
		}else {
			throw new ApprovalException("기안 실패");
		}
		
		
		
		
	}
	
	/* 첨부 파일 저장 */
	public int saveFile(List<MultipartFile> fileList, MultipartHttpServletRequest request
			) {
		String path = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = path + "\\approval\\duploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		String filerename[] = new String[fileList.size()];
		int result = 0;
		for(int i = 0; i < fileList.size(); i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");		
			String originFileName = fileList.get(i).getOriginalFilename();
			System.out.println(originFileName);
			String renameFileName = sdf.format(new Date()) + 
			originFileName.substring(originFileName.lastIndexOf("."));
			
			String renamePath = folder + "\\" + renameFileName;
			filerename[i] = renameFileName;
			Attachment at = new Attachment(originFileName, renameFileName, savePath);
			result += aService.insertAttachment(at);
			
			try {
				fileList.get(i).transferTo(new File(renamePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
		
	}
	
	/* 첨부파일 삭제 */
	public void deleteFile(String filePath, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources");
		
		File deleteFile = new File(path+"\\approval\\duploadFiles"+filePath);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
		
	}
	
	@RequestMapping("temporaryDoc.ap")
	public ModelAndView temporaryDoc(ModelAndView mv,
			 MultipartHttpServletRequest request, @RequestParam(value="page", required=false) Integer page,
				String[] apvprocedureNames, String comment, String apvDocContent,
				String apvDocTitle, int docNo) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String eId = loginUser.getId();
		int currentPage = page != null ? page : 1;
		String apdPath = "";
		if(apvprocedureNames != null) {
			for(int i = 0; i < apvprocedureNames.length; i++) {
				apdPath += apvprocedureNames[i].toString()+",";
			}
			
		}else {
			apdPath = " ";
		}
		if(apvDocTitle.equals(" ")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");	
			apvDocTitle = sdf.format(new Date())+loginUser.getName();
		}
		
		/* 첨부파일 */
		List<MultipartFile> fileList = request.getFiles("apvfiles");
		int result2 = 0;
		int filesize = 0;
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				filesize = fileList.size();
			}
		}
		
		
		ApvDoc temporaryDoc = new ApvDoc(apvDocTitle, apvDocContent, apdPath, docNo, eId, filesize );
		
		int result = aService.insertTempDoc(temporaryDoc);
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				result2 = saveFile(fileList, request);
			}else {
				break;
			}
		}
		
		
		
		if(result > 0) {
			
				request.getSession().setAttribute("msg", "정상적으로 저장되었습니다.");
				mv.addObject("currentPage", currentPage);
				mv.setViewName("redirect:temporaryList.ap");
				return mv;
			
		}else {
			throw new ApprovalException("임시저장 실패");
		}
	}
	
	
	@RequestMapping("deleteTempDoc.ap")
	public ModelAndView delelteTempDoc(ModelAndView mv, int apvDocNo,
			HttpServletRequest request,@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = page != null ? page : 1;
		String a = String.valueOf(apvDocNo);
		ArrayList<Attachment> atList = aService.selectTempAt(a);
		int result2 = 0;
		if (!atList.isEmpty()) {
			for (Attachment at : atList) {
				deleteFile(at.getRenameFile(), request);
				result2 += aService.deleteAttachment(a);
			}
		}
		
		int result = aService.deleteTempDoc(apvDocNo);
		
		System.out.println(result2);
		System.out.println(atList.size());
		
		if(result > 0 && result2 == atList.size()) {
			request.getSession().setAttribute("msg", "임시문서가 삭제되었습니다.");
			mv.addObject("currentPage", currentPage);
			mv.setViewName("redirect:temporaryList.ap");
		}else {
			throw new ApprovalException("임시문서 삭제에 실패하였습니다.");
		}
		
		
		return mv;
	}
	
	@RequestMapping(value="selectApprovalObtainDoc.ap")
	@ResponseBody
	public String selectApprover(int apvDocNo) {
		System.out.println("controller"+apvDocNo);
		ArrayList<Approval> aList = aService.selectApprovalfromObtainDoc(apvDocNo);
		String a = String.format("%d",apvDocNo);
		ArrayList<Attachment> atList = aService.selectApvDocAtList(a);
		System.out.println("atList"+atList);
		System.out.println("aList = "+aList);
		ArrayList<String> eList = new ArrayList<>();
		
		for(int i = 0; i < aList.size(); i++) {
				eList.add(i, aList.get(i).getEmpId());
		}
		
		ArrayList<Sign> eSignList = aService.selectSignList(eList);
		System.out.println("signList = "+eSignList);
		HashMap<String,ArrayList> result = new HashMap<>();
		result.put("signList", eSignList);
		result.put("aList", aList);
		result.put("atList", atList);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		
		
		return gson.toJson(result);
	}
	
	@RequestMapping("draftingRetrieve.ap")
	public ModelAndView draftingRetrieve(ModelAndView mv, @RequestParam(value="page", required=false) Integer page,
			HttpServletRequest request, @RequestParam(value="apvDocNo", required=false, defaultValue="0")int apvDocNo) {
		System.out.println(apvDocNo);
		int currentPage = page != null ? page : 1;
		int result = aService.draftingRetrieve(apvDocNo);
		int result2 = aService.deleteprocedureList(apvDocNo);
		
		if(result > 0 && result2 > 0) {
			request.getSession().setAttribute("msg", "기안서가 회수되었습니다.");
			mv.addObject("currentPage", currentPage);
			mv.setViewName("redirect:approvalObtainList.ap");
			return mv;
		}else {
			throw new ApprovalException("회수 실패");
		}
	
	}
	
	@RequestMapping("approval.ap")
	public ModelAndView approval(ModelAndView mv, HttpServletRequest request,
			int apvResult, String apvComment, int apvDocNo,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String eId = loginUser.getId();
		Approval apv = new Approval(apvDocNo, apvResult, apvComment, eId);
		int currentPage = page != null ? page : 1;
		
		int result = aService.approval(apv);			
		
		ApprovalApvDoc checkDoc = aService.checkApproval(apvDocNo);
		if(checkDoc.getEmpId().equals(eId)) {
			if(checkDoc.getApdStep() >= checkDoc.getApvStep()) {
				int result2 = aService.apvDocComplete(apvDocNo);
			}
		}
		
		if(result > 1) {
			request.getSession().setAttribute("msg", "정상적으로 처리되었습니다.");
			mv.addObject("currentPage", currentPage);
			mv.setViewName("redirect:approvalList.ap");
			return mv;
		}else {
			throw new ApprovalException("결재 실패");
		}
		
	}
	
	@RequestMapping("approvalCancel.ap")
	public ModelAndView approvalCancel(ModelAndView mv, HttpServletRequest request,
			int apvDocNo,@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String eId = loginUser.getId();
		int currentPage = page != null ? page : 1;
		Approval cApv = new Approval(apvDocNo, eId);
		
		int result = aService.approvalCancel(cApv);
		
		if(result > 0 ) {
			request.getSession().setAttribute("msg", "결재가 취소되었습니다.");
			mv.addObject("currentPage", currentPage);
			mv.setViewName("redirect:approvalCompleteList.ap");
		}else {
			throw new ApprovalException("결재 취소 실패 ");
		}
		
		return mv;
	}
	
	
	
	
	/*@RequestMapping(value="docTypeList.ap", method=RequestMethod.POST)
	public void docTypeList(String docType, HttpServletResponse response) throws IOException {
		System.out.println(docType);
		ArrayList<Doc> dList = aService.selectDocTypeList(docType);
		
		JSONArray jarr = new JSONArray();
		
		for(Doc d : dList) {
			JSONObject jDoc = new JSONObject();
			jDoc.put("docNo", d.getDocNo());
			jDoc.put("docTitle", d.getDocTitle());
			jDoc.put("docContent", d.getDocStatus());
			jDoc.put("docType", d.getDocType());
			jDoc.put("docExplantion", d.getDocExplantion());
			
			jarr.add(jDoc);
		}
		JSONObject sendJson = new JSONObject();
		sendJson.put("docTypeList", jarr);		
		
		// 응답 설정
		response.setContentType("application/json; charset=utf-8");
		// 전송
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		
	}*/
	
	
	
}
