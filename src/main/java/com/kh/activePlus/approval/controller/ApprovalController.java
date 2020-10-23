package com.kh.activePlus.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.exception.ApprovalException;
import com.kh.activePlus.approval.model.service.ApprovalService;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Attachment;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.approval.model.vo.PageInfo;
import com.kh.activePlus.approval.model.vo.Pagination;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;
	@RequestMapping("approvalMain.ap")
	public ModelAndView goApproval(ModelAndView mv, HttpServletRequest request) throws Exception {
		// 전자결재 메인창에 띄울 세 리스트 불러오기
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String empId= loginUser.getID();
		// 임시문서
		ApprovalSearch tempDocSearch = new ApprovalSearch(empId, "0");
		ApprovalSearch apvDocSearch = new ApprovalSearch(empId, "1");
		ApprovalSearch compDocSearch = new ApprovalSearch(empId, "4");
		
		ArrayList<ApvDoc> tempList = aService.selectApvDocList(tempDocSearch);
		// 결재 예정 문서
		ArrayList<ApvDoc> apvList = aService.selectApvDocList(apvDocSearch);
		// 결재 완료 문서
		ArrayList<ApvDoc> apvCompList = aService.selectApvDocList(compDocSearch);
		
		mv.addObject("tempList", tempList);
		mv.addObject("apvList", apvList);
		mv.addObject("apvCompList", apvCompList);
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	@RequestMapping("draftingList.ap")
	public ModelAndView goDrafting(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int listCount = aService.selectAllDocTypeListCount();
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Doc> dList = aService.selectAllDocTypeList(pi);
		
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
		
		String eId = loginUser.getID();
		int listCount = aService.selectPrivateListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
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
	public String goPrivateDoc() {
		return "approval/privateDoc";
	}
	
	@RequestMapping("selectPriDoc.ap")
	public ModelAndView selectPriDoc(ModelAndView mv, HttpServletRequest request,
			String docTitle) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		Doc searchd = new Doc(docTitle, eId);
		
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
		
		String eId = loginUser.getID();
		
		Doc priDoc = new Doc(priDocTitle, priDocContent, docexplanation, eId);
		
		int result = aService.priDocSave(priDoc);
		
		if(result > 0) {
			mv.addObject("msg","개인양식이 등록되었습니다.");
			mv.setViewName("approval/privateDocList");
			return mv;
		}else {
			throw new ApprovalException("개인양식 등록에 실패하였습니다.");
		}
		
	}
	
	
	@RequestMapping("deletePriDoc.ap")
	public ModelAndView deletePriDoc(ModelAndView mv,HttpServletRequest request,
			String docTitle) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		Doc searchd = new Doc(docTitle, eId);
		
		int result = aService.deletePriDoc(searchd);
		
		if(result > 0) {
			mv.addObject("msg","개인양식 삭제에 성공하였습니다.");
			mv.setViewName("redirect:approval/temporaryList");
			return mv;
		}else {
			throw new ApprovalException("개인양식 삭제에 실패하였습니다.");
		}
		
		
	}
	
	@RequestMapping("temporaryList.ap")
	public ModelAndView gotemporaryList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page){
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		int listCount = aService.selectTemporaryListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> tList = aService.selectTemporaryList(eId, pi);
		
		if(tList != null) {
			mv.addObject("tList",tList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/temporaryList");
			return mv;
		}else {
			throw new ApprovalException("임시저장 문서 조회 실패");
		}
		
	}
	
	@RequestMapping("selectTempDoc.ap")
	public ModelAndView SelectTempDoc(ModelAndView mv, HttpServletRequest request,
			String docTitle) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		Doc searchTemp = new Doc(docTitle, eId);
		
		ArrayList<Employee> eList = aService.selectEmpList();
		
		Doc tempDoc = aService.selectTempDoc(searchTemp);
		
		ArrayList<Attachment> tempAt = aService.selectTempAt(tempDoc.getDocNo());

		
		if(tempDoc != null) {
			mv.addObject("eList", eList);
			mv.addObject("tempAt", tempAt);
			mv.addObject("tDoc",tempDoc);
			mv.setViewName("approval/tmpDoc");
			return mv;
		}else {
			throw new ApprovalException("임시저장 문서를 불러오는데 실패하였습니다.");
		}
		
	}
	
	
	
	@RequestMapping("approvalObtainList.ap")
	public ModelAndView goObtainList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		int listCount = aService.selectApprovalObtainListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> oList = aService.selectApprovalObtainList(eId, pi);
		
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
		
		String eId = loginUser.getID();
		int listCount = aService.selectApprovalListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> aList = aService.selectApprovalList(eId, pi);
		
		if(aList != null) {
			mv.addObject("aList",aList);
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
		
		String eId = loginUser.getID();
		int listCount = aService.selectAprrovalCompleteListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> cList = aService.selectApprovalCompleteList(eId,pi);
		
		if(cList != null) {
			mv.addObject("cList",cList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalComplList");
			return mv;
		}else {
			throw new ApprovalException("임시저장 문서 조회 실패");
		}
		
	}
	@RequestMapping("tempDocDetail.ap")
	public String goTempDocDetail() {
		return "approval/tempDoc";
	}
	
	@RequestMapping("docTypeList.ap")
	public ModelAndView docTypeList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, String docType ) {
		
		int listCount = aService.selectDocTypeListCount(docType);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Doc> dList = aService.selectDocTypeList(docType, pi); 
		
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
	public ModelAndView selectDoc(ModelAndView mv,String docTitle) {
		Doc doc = aService.selectDoc(docTitle);
		ArrayList<Employee> eList = aService.selectEmpList();
		System.out.println(docTitle);
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
			String apvDocTitle, int docNo
			) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		String apdPath = "0 "+ eId + " (기안)";
		String[] procedureNames = new String[apvprocedureNames.length];
		String[] apvTypes = new String[apvprocedureNames.length];
		int[] apvtype = new int[apvprocedureNames.length];
		/* 결재선 */
		for(int i = 0; i < apvprocedureNames.length; i++) {
			System.out.println(apvprocedureNames[i].toString());
			apdPath +=", "+ apvprocedureNames[i].toString();
			int begin = apvprocedureNames[i].indexOf(" ");
			int end = apvprocedureNames[i].indexOf(" (");
			procedureNames[i] = apvprocedureNames[i].substring(begin, end);
			System.out.println("첫 인덱스 : "+ begin+", 마지막 인덱스 : "+end);
			System.out.println("결재선 이름만 "+procedureNames[i]);
			
			apvTypes[i] = apvprocedureNames[i].substring(end+1);
			System.out.println("결재 종류 :"+apvTypes[i]);
			if(apvTypes[i].contains("기안")) {
				apvtype[i] = 0;
			}else if(apvTypes[i].contains("결재")) {
				apvtype[i] = 1;
			}else if(apvTypes[i].contains("합의")) {
				apvtype[i] = 2;
			}
			
			
		}
		System.out.println(apdPath);
		/* 의견 */
		System.out.println(comment);
		
		/* 첨부파일 (전자문서 먼저 저장 후에 문서번호 가져와서 넣기) */
		List<MultipartFile> fileList = request.getFiles("apvfiles");
		System.out.println("첨부파일 갯수 : " + fileList.size());
		
		
		/* 기안문 넘길 곳 */
		ApvDoc draftingDoc = new ApvDoc(apvDocTitle, apvDocContent, apdPath, docNo, eId, fileList.size() );
		
		int result = aService.draftingDoc(draftingDoc);
		String[] empIds = {eId};
		int result2 = 0;
		int result3 = 0;
		if(result > 0) {
			for(int i = 0; i < procedureNames.length; i++) {
				empIds = aService.selectEmpId(procedureNames[i]);
				Approval apv = new Approval(i,apvtype[i], empIds[i]);
				result2 += aService.insertApproval(apv);
			}
			
			for(MultipartFile file : fileList) {
				if(!file.isEmpty()) {
					result3 = saveFile(fileList, request, docNo);
				}
			}
			if(result2 == procedureNames.length && result3 == fileList.size()) {
				mv.addObject("msg","정상적으로 기안되었습니다.");
				mv.setViewName("redirect:approval/draftingList");
				return mv;
			}else {
				throw new ApprovalException("결재선 등록 실패");
			}
			
		}else {
			throw new ApprovalException("기안 실패");
		}
		
		
		
		
	}
	
	/* 첨부 파일 저장 */
	public int saveFile(List<MultipartFile> fileList, MultipartHttpServletRequest request,
			int docNo) {
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
			String renameFileName = sdf.format(new Date()) + 
					originFileName.substring(originFileName.lastIndexOf("."));
			
			String renamePath = folder + "\\" + renameFileName;
			filerename[i] = renameFileName;
			Attachment at = new Attachment(originFileName, renameFileName, savePath, docNo);
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
			 MultipartHttpServletRequest request,
				String[] apvprocedureNames, String comment, String apvDocContent,
				String apvDocTitle, int docNo) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		String apdPath = "0 "+ eId + " (기안)";
		if(apvprocedureNames != null) {
			for(int i = 0; i < apvprocedureNames.length; i++) {
				System.out.println(apvprocedureNames[i].toString());
				apdPath +=", "+ apvprocedureNames[i].toString();
			}
			
		}
		/* 첨부파일 */
		List<MultipartFile> fileList = request.getFiles("apvfiles");
		System.out.println("첨부파일 갯수 : " + fileList.size());
		
		ApvDoc temporaryDoc = new ApvDoc(apvDocTitle, apvDocContent, apdPath, docNo, eId, fileList.size() );
		
		int result = aService.insertTempDoc(temporaryDoc);
		int result2 = 0;
		if(result > 0) {
			
			for(MultipartFile file : fileList) {
				if(!file.isEmpty()) {
					result2 = saveFile(fileList, request, docNo);
				}
			}
			if(result2 == fileList.size()) {
				mv.addObject("msg","임시저장이 완료되었습니다.");
				mv.setViewName("redirect:approval/temporaryList.ap");
				return mv;
			}else {
				throw new ApprovalException("첨부파일 등록 실패");
			}
		}else {
			throw new ApprovalException("임시저장 실패");
		}
		
		
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
