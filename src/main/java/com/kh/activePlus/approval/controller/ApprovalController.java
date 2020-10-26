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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		
		
		System.out.println(tempList);
		
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
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		System.out.println(pi);
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
	
	
	@RequestMapping("selectPriDoc.ap")
	public ModelAndView selectPriDoc(ModelAndView mv, HttpServletRequest request,
			int docNo) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
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
		
		String eId = loginUser.getID();
		
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
		
		String eId = loginUser.getID();
		
		Doc searchd = new Doc(docNo, eId);
		
		int result = aService.deletePriDoc(searchd);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "정상적으로 삭제되었습니다.");
			mv.setViewName("redirect:privateDocList.ap");
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
		
		String eId = loginUser.getID();
		
		ApvDoc searchTemp = new ApvDoc(apvDocNo, eId);
		
		ArrayList<Employee> eList = aService.selectEmpList();
		
		ApvDoc tempDoc = aService.selectTempDoc(searchTemp);
		Doc doc = aService.selectDoc(tempDoc.getDocNo());
		if(doc.getDocType().equals("PRIVATE")) {
		tempDoc.setApvDocContent(tempDoc.getApvDocContent().substring(tempDoc.getApvDocContent().indexOf("@")+1));
		}else {
			tempDoc.setApvDocContent(tempDoc.getApvDocContent().substring(0, tempDoc.getApvDocContent().indexOf("@")));
		}
		System.out.println(tempDoc.getApvDocContent());
		ArrayList<Attachment> tempAt = aService.selectTempAt(apvDocNo);

		
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
		
		String eId = loginUser.getID();
		
		int listCount = aService.selectApprovalObtainListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
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
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
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
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
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
	
	
	@RequestMapping("docTypeList.ap")
	public ModelAndView docTypeList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, String docType ) {
		
		int listCount = aService.selectDocTypeListCount(docType);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
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
			String apvDocTitle, int docNo
			) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		System.out.println("controller content:"+apvDocContent);
		
		String eId = loginUser.getID();
		String[] procedureNames = new String[apvprocedureNames.length+1];
		String[] apvTypes = new String[apvprocedureNames.length+1];
		int[] apvtype = new int[apvprocedureNames.length+1];
		String[] empIds = new String[apvprocedureNames.length+1];
		String apdPath = "";
		/* 결재선 */
		for(int i = 0; i < apvprocedureNames.length; i++) {
			
				apdPath = "0 "+loginUser.getUserName()+"["+ eId + "] (기안)";
				empIds[0] = eId;
				apvTypes[0] = "(기안)";
			
			System.out.println(apvprocedureNames[i].toString());
			apdPath +=", "+ apvprocedureNames[i].toString();
			int begin = apvprocedureNames[i].indexOf(" ");
			int end = apvprocedureNames[i].indexOf(" (");
			
			int ebegin = apvprocedureNames[i].indexOf("[");
			int eend = apvprocedureNames[i].indexOf("]");
			System.out.println(ebegin);
			System.out.println(eend);
			empIds[i+1] = apvprocedureNames[i].substring(ebegin+1, eend);
			System.out.println("사번"+empIds[i]);
			procedureNames[i] = apvprocedureNames[i].substring(begin, end);
			System.out.println("첫 인덱스 : "+ begin+", 마지막 인덱스 : "+end);
			System.out.println("결재선 이름만 "+procedureNames[i]);
			apvTypes[i+1] = apvprocedureNames[i].substring(end+1);
			System.out.println("결재 종류 :"+apvTypes[i+1]);
			
			if(apvTypes[i+1].contains("결재")) {
				apvtype[i+1] = 1;
			}else if(apvTypes[i+1].contains("합의")) {
				apvtype[i+1] = 2;
			}
		}
		
		/* 첨부파일 (전자문서 먼저 저장 후에 문서번호 가져와서 넣기) */
		List<MultipartFile> fileList = request.getFiles("apvfiles");
		System.out.println("첨부파일 갯수 : " + fileList.size());
		int result3 = 0;
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				result3 = saveFile(fileList, request, docNo);
			}else {
				result3 = 0;
			}
		}
		
		/* 기안문 넘길 곳 */
		ApvDoc draftingDoc = new ApvDoc(apvDocTitle, apvDocContent, apdPath, docNo, eId, result3 );
		
		int result = aService.draftingDoc(draftingDoc);
		int result2 = 0;
		if(result > 0) {
			for(int i = 0; i < empIds.length; i++) {
				if(empIds[i] == null) {
					continue;
				}
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
		String apdPath = "";
		if(apvprocedureNames != null) {
			for(int i = 0; i < apvprocedureNames.length; i++) {
				System.out.println(apvprocedureNames[i].toString());
				apdPath += apvprocedureNames[i].toString()+",";
			}
			
		}
		/* 첨부파일 */
		List<MultipartFile> fileList = request.getFiles("apvfiles");
		int result2 = 0;
		
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				result2 = saveFile(fileList, request, docNo);
			}
		}
		
		ApvDoc temporaryDoc = new ApvDoc(apvDocTitle, apvDocContent, apdPath, docNo, eId, result2 );
		
		int result = aService.insertTempDoc(temporaryDoc);
		if(result > 0) {
			if(result2 == fileList.size() || result2 == 0) {
				request.getSession().setAttribute("msg", "정상적으로 저장되었습니다.");
				mv.setViewName("redirect:temporaryList.ap");
				return mv;
			}else {
				throw new ApprovalException("첨부파일 등록 실패");
			}
		}else {
			throw new ApprovalException("임시저장 실패");
		}
	}
	
	
	@RequestMapping("deleteTempDoc.ap")
	public ModelAndView delelteTempDoc(ModelAndView mv, int docNo,
			HttpServletRequest request) {
		
		
		ArrayList<Attachment> atList = aService.selectTempAt(docNo);
		int result2 = 0;
		if (atList.isEmpty()) {
			for (Attachment at : atList) {
				deleteFile(at.getRename(), request);
				result2 += aService.deleteAttachment(docNo);
			}
		}
		
		
		System.out.println(docNo);
		int result = aService.deleteTempDoc(docNo);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "임시문서가 삭제되었습니다.");
			mv.setViewName("redirect:temporaryList.ap");
		}else {
			throw new ApprovalException("임시문서 삭제에 실패하였습니다.");
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
