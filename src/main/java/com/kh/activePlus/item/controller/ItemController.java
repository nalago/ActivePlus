package com.kh.activePlus.item.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.item.model.exception.ItemException;
import com.kh.activePlus.item.model.service.ItemService;
import com.kh.activePlus.item.model.vo.Item;
import com.kh.activePlus.item.model.vo.Paging;

@Controller
@SessionAttributes("loginUser")
public class ItemController {

	@Autowired
	private ItemService iService;

	// 품목 목록
	@RequestMapping(value = "itemList.ap", method = RequestMethod.GET)
	public ModelAndView goItem(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam int i_div) {
		session = request.getSession(false);

		Paging paging = new Paging();

		int totalCnt = iService.count(i_div);

		int current_page = 1;

		if (request.getParameter("page") != null)
			current_page = Integer.parseInt((String) request.getParameter("page"));

		String i_div_seq = "i_div=" + i_div;

		String pageIndexList = paging.pageIndexLista(totalCnt, current_page, i_div_seq);

		int endCount = totalCnt - ((current_page - 1) * 10);
		int startCount = totalCnt - (current_page * 10) + 1;
		Item item = new Item();
		item.setI_div(i_div);
		item.setStartCount(startCount);
		item.setEndCount(endCount);

		List<Item> list = iService.listAll(item);

		if (list != null) {
			mv.addObject("i_div", i_div);
			mv.addObject("list", list);
			mv.addObject("pageIndexList", pageIndexList);
			mv.setViewName("item/itemList");

			return mv;
		} else {
			throw new ItemException("목록 조회에 실패하였습니다.");
		}
	}

	// 품목 검색
	@RequestMapping(value = "itemListSearch.ap", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> itemListSearch(@RequestBody Item params) {
		Map<String, Object> result = new HashMap<String, Object>();
		List itemList = new ArrayList<HashMap<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();

		// 페이징 처리
		Paging paging = new Paging();

		int i_div = params.getI_div();
		int totalCnt = iService.searchCount(params);

		int current_page = 1;

		if (params.getPage() != null)
			current_page = Integer.parseInt(params.getPage());

		String pageIndexListAjax = paging.pageIndexListAjax(totalCnt, current_page);
		int startCount = (current_page - 1) * 10 + 1;
		int endCount = current_page * 10;

		params.setStartCount(startCount);
		params.setEndCount(endCount);
		params.setI_div(i_div);

		itemList = iService.listAll(params);
		map.put("pageIndexListAjax", pageIndexListAjax);
		map.put("itemList", itemList);
		result.putAll(map);

		return result;
	}

	// 품목 상세보기
	@ResponseBody
	@RequestMapping(value = "detailItem.ap", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> iDetail(@RequestBody int i_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		Item item = iService.detailItem(i_no);
		
		if(item != null) {
			Attachment img = iService.detailImg(i_no, "ITEM");
			Attachment pdf = iService.detailPdf(i_no, "ITEM");
			map.put("item", item);
			if(img != null && pdf != null) {
				map.put("pdf", pdf);
				map.put("img", img);
			}else if(img != null && pdf == null) {
				map.put("img", img);
			}else if(img == null && pdf != null) {
				map.put("pdf", pdf);
			}
		}	
		result.putAll(map);
		
		return result;
	}

	// 품목 추가페이지
	@RequestMapping("iAdd.ap")
	public String iAdd(@RequestParam int i_div, Model m) {
		m.addAttribute("i_div", i_div);
		return "item/itemAdd";
	}

	// 물품 존재 여부
	@ResponseBody
	@RequestMapping(value = "iIdCheck.ap",  method = { RequestMethod.GET, RequestMethod.POST })
	public int iIdCheck(@RequestBody Item param) {
		
		int result = iService.iIdCheck(param);
		
		return result;
	}
	
	// 물품 등록
	@RequestMapping("enrollItem.ap")
	public ModelAndView enrollItem(Item i, HttpServletRequest request,
			@RequestParam(value="i_image", required=false) MultipartFile image,
			@RequestParam(value="i_pdf", required=false) MultipartFile pdf,
			ModelAndView mv) {
		
		int i_div = i.getI_div();
		
		Attachment at = new Attachment();
		Attachment at1 = new Attachment();
		// 파일 업로드 되었다면(업로드 된 파일명이 ""이 아니라면)
		if(!image.getOriginalFilename().equals("") && !pdf.getOriginalFilename().equals("")) {
			at = saveFiles(image, request, "image");
			at1 = saveFiles(pdf,request,"pdf");
			if(!at.getRenameFile().equals("") && !at1.getRenameFile().equals("") ) {
				at.setOriginalFile(image.getOriginalFilename());
				at1.setOriginalFile(pdf.getOriginalFilename());
			}
		}else if(!pdf.getOriginalFilename().equals("")) {
			at1 = saveFiles(pdf,request,"pdf");
			if(!at1.getRenameFile().equals(""))
				at1.setOriginalFile(pdf.getOriginalFilename());
		}else if(!image.getOriginalFilename().equals("") ) {
			at = saveFiles(image, request, "image");
			if(!at.getRenameFile().equals(""))
				at.setOriginalFile(image.getOriginalFilename());
		}
		
		int result = iService.enrollItem(i,at,at1);
		
		
		if(result > 0) {
			mv.addObject("i_div", i_div);
			mv.setViewName("redirect:itemList.ap");
			return mv;
		}else {
			throw new ItemException("제품 등록에 실패하였습니다.");
		}
		
		
	}
	
	
	// 수정 페이지
	@RequestMapping("itemUpdateView.ap")
	public String itemUpdateView(int i_no, Model m) {
		Item i = iService.detailItem(i_no);
		String table = "ITEM";
		Attachment img = iService.detailImg(i_no, table);
		Attachment pdf = iService.detailPdf(i_no, table);
		
		m.addAttribute("i", i);
		m.addAttribute("img", img);
		m.addAttribute("pdf",pdf);
		return"item/itemUpdate";
	}
	// 업데이트 요청
	@RequestMapping("updateItem.ap")
	public ModelAndView updateItem(MultipartHttpServletRequest multi,Item i,String up_pdf, String up_img,HttpServletRequest request,
			 ModelAndView mv){
		int i_div = i.getI_div();
		int resultI = 0;
		int resultP = 0;
        MultipartFile image = multi.getFile("i_image");
        MultipartFile pdf = multi.getFile("i_pdf");        
		
        String orImg = image.getOriginalFilename();
        String orPdf = pdf.getOriginalFilename();
        
        
		Attachment at = new Attachment();
		Attachment at1 = new Attachment();
		if(up_img != "") {
			if(orImg != "") {
				deleteFile(up_img, request, "img");
				at = saveFiles(image, request, "image");
				at.setRefId(i.getI_no()+"");
				at.setRefTable("ITEM");
				if(!at.getRenameFile().equals("") ) {
					at.setOriginalFile(orImg);
				}
				resultI = iService.updateFile(at);
			
			}
		}else {
			if(orImg != "") {
				at = saveFiles(image, request, "image");
				at.setRefId(i.getI_no()+"");
				at.setRefTable("ITEM");
				if(!at.getRenameFile().equals("") ) {
					at.setOriginalFile(orImg);
				}
				resultI = iService.insertFile(at);
			
			}
		}
		
		if(up_pdf != "") {
			if(orPdf != "") {
				deleteFile(up_pdf,request,"pdf");
				at1 = saveFiles(pdf, request, "pdf");
				at1.setRefId(i.getI_no()+"");
				at1.setRefTable("ITEM");
					if(!at1.getRenameFile().equals("") ) {
						at1.setOriginalFile(orPdf);
					}
					resultP =iService.updateFile(at1);
			}
		}else {
			if(orPdf != "") {
				at1 = saveFiles(pdf, request, "pdf");
				at1.setRefId(i.getI_no()+"");
				at1.setRefTable("ITEM");
					if(!at1.getRenameFile().equals("") ) {
						at1.setOriginalFile(orPdf);
					}
					resultP = iService.insertFile(at1);
			}
		}
		int result = iService.updateItem(i);
		
		if(result >0) {
			mv.addObject("i_div", i_div);
			mv.setViewName("redirect:itemList.ap");
			return mv;
		}else {
			throw new ItemException("제품 업데이트에 실패하였습니다.");
		}
		
	}

	// 파일저장
	public Attachment saveFiles(MultipartFile file, HttpServletRequest request, String table) {
		Attachment at = new Attachment();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\uploadFiles";
		at.setRefTable("ITEM");
		if(table.equals("image")) 
			savePath = savePath + "\\item\\image";
		else if(table.equals("pdf"))
			savePath = savePath + "\\item\\pdf";
		
		File folder = new File(savePath);
		
		if(!folder.exists())
			folder.mkdir();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName;
		
		at.setRenameFile(renameFileName);
		at.setFilePath(savePath);
		
		try {
			file.transferTo(new File(folder + "\\" + renameFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
			
		return at;
	}
	
	// 파일 삭제
	public void deleteFile(String filePath, HttpServletRequest request, String table) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles\\item";
		
		if(table.equals("img")) {
			savePath = savePath + "\\image\\";
		}else {
			savePath = savePath + "\\pdf\\";
		}
		File deleteFile = new File(savePath +  filePath);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	

	// 의료품 삭제
	@RequestMapping("itemDelete.ap")
	public ModelAndView itemDelete(ModelAndView mv,int i_div, HttpServletRequest request, int i_no) {
		System.out.println("i_no" + i_no);
		int result = iService.deleteItem(i_no);
		String refId = i_no+"";
		int resultA = iService.deleteFile(refId);
		if(result > 0){
			mv.addObject("i_div", i_div);
			mv.setViewName("redirect:itemList.ap");
			return mv;
		}else {
			throw new ItemException("제품 삭제에 실패하였습니다.");
		}
	}

}
