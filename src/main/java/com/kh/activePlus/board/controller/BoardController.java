package com.kh.activePlus.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.board.model.service.HosBoardService;
import com.kh.activePlus.board.model.service.NoticeService;
import com.kh.activePlus.board.model.vo.HosBoard;
import com.kh.activePlus.board.model.vo.Notice;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.exception.commonException;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.common.search.Search;

@Controller
public class BoardController {
	@Autowired
	private NoticeService nService;
	@Autowired
	private HosBoardService bService;

	/* 공지사항 */
	// 공지사항 출력
	@RequestMapping("notice.ap")
	public String goNotice(Model model, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = page != null ? page : 1;
		int listCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);

		ArrayList<Notice> list = nService.selectList(pi);
		// System.out.println("list 출력 : " + list);

		if (list != null) {
			model.addAttribute("nList", list);
			model.addAttribute("pi", pi);
			return "board/noticeListView";
		} else {
			throw new commonException("공지사항 조회 실패!");
		}

	}

	// 공지사항 세부내용
	@RequestMapping("noticedetail.ap")
	public ModelAndView noticeDetail(int nId, ModelAndView mv) {
		Notice n = nService.selectNotice(nId);
		if (n != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(n.getCreateDate());
			System.out.println(n.getAttachment());
			if (n.getAttachment() > 0) {
				Attachment at = nService.selectAttachment(nId, "NOTICE");
				System.out.println(at);
				if (at != null)
					mv.addObject("at", at);
			}
			mv.addObject("notice", n);
			mv.addObject("date", date);
		} else {
			mv.addObject("msg", "공지사항 세부내용 조회 실패. 잠시후 다시 시도해주세요.");
		}
		mv.setViewName("board/noticeDetailView");
		return mv;
	}

	// 공지사항 작성폼으로 이동
	@RequestMapping("noticewrite.ap")
	public String goNoticeForm() {

		return "board/noticeInsertForm";
	}

	// 공지사항 작성
	@RequestMapping("noticeinsert.ap")
	public String noticInsert(Notice n, @RequestParam(name = "uploadFiles", required = false) MultipartFile file,
			HttpServletRequest req) {
		// System.out.println("notice : " + n);
		// System.out.println("file : " + file.getOriginalFilename());
		Attachment at = new Attachment();
		if (!file.getOriginalFilename().equals("")) {
			at = saveFiles(file, req, "notice");
			n.setAttachment(1);
			if (!at.getRenameFile().equals(""))
				at.setOriginalFile(file.getOriginalFilename());
		}

		int result = nService.insertNotice(n, at);

		if (result > 0) {
			return "redirect:notice.ap";
		} else {
			throw new commonException("공지사항 등록에 실패하였습니다");
		}

	}

	// 공지사항 수정 페이지로 이동
	@RequestMapping("noticeupdate.ap")
	public String goNoticeUpdateForm(int nId, Model model) {
		Notice n = nService.selectNotice(nId);

		if (n != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(n.getCreateDate());
			if (n.getAttachment() > 0) {
				Attachment at = nService.selectAttachment(nId, "NOTICE");
				// System.out.println(at);
				if (at != null)
					model.addAttribute("at", at);
			}
			model.addAttribute("notice", n);
			model.addAttribute("date", date);
		} else {
			model.addAttribute("msg", "공지사항 세부내용 조회 실패. 잠시후 다시 시도해주세요.");
		}

		return "board/noticeUpdateForm";
	}

	// 공지사항 수정
	@RequestMapping("updatenotice.ap")
	public String noticeUpdate(Notice n, String reFile,
			@RequestParam(name = "uploadFiles", required = false) MultipartFile file, HttpServletRequest req) {
		Attachment at = new Attachment();
		int fResult = 0;
		if (file != null) {
			deleteFile(reFile, req, "notice");
			// 삭제후 저장
			at = saveFiles(file, req, "notice");
			at.setRefId(n.getNoticeId() + "");
			at.setRefTable("NOTICE");
			n.setAttachment(1);
			if (!at.getRenameFile().equals("")) {
				at.setOriginalFile(file.getOriginalFilename());
			}
		}
		int result = nService.updateNotice(n, at);

		if (result <= 0) {

		}
		return "redirect:noticedetail.ap?nId=" + n.getNoticeId();

	}

	// 공지사항 삭제
	@RequestMapping("noticedelete.ap")
	@ResponseBody
	public int noticeDelete(int nId, int attachment, HttpServletRequest req) {
		int result = nService.deleteNotice(nId);
		int aResult = 0;
		if (result > 0) {
			if (attachment > 0) {
				Attachment at = nService.selectAttachment(nId, "NOTICE");
				deleteFile(at.getRenameFile(), req, "notice");
				aResult = nService.deleteAttachment(at);
			}
		}
		return result;
	}

	// 검색
	@RequestMapping("search.ap")
	public ModelAndView searchList(Search s, String kind, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(name = "myN", required = false) String myN) {
		int currentPage = page != null ? page : 1;
		int listCount = nService.getSearchListCount(s);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);

		ArrayList<Notice> nList = null;
		ArrayList<HosBoard> bList = null;
		// System.out.println("kind:"+kind);
		// System.out.println(s);
		if (myN != null) {
			s.setEmpId(myN);
		}
		if (kind.equals("NOTICE")) {
			nList = nService.searchList(s, pi);

			if (nList != null) {
				mv.addObject("sList", nList);
				mv.addObject("search", s);
				mv.addObject("pi", pi);
				mv.setViewName("board/noticeListView");
			}
		} else {
			
			bList = bService.bSearchList(s, pi);
			if (bList != null) {
				mv.addObject("sList", bList);
				mv.addObject("search", s);
				mv.addObject("pi", pi);
				mv.setViewName("board/hosBoardListView");
			}
		}
		return mv;
	}

	/* 원내게시판 */

	@RequestMapping("hosboard.ap")
	public String goHosBoard(Model model, @RequestParam(name = "page", required = false) Integer page) {

		ArrayList<HosBoard> topList = bService.selectTopList();
		if (topList != null) {
			model.addAttribute("top", topList);
		}

		int currentPage = page != null ? page : 1;
		int listCount = bService.getHBListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);

		ArrayList<HosBoard> bList = bService.selectHBList(pi);

		if (bList != null) {
			model.addAttribute("bList", bList);
			return "board/hosBoardListView";
		} else {
			throw new commonException("게시판 글 목록 조회 실패");
		}
	}

	@RequestMapping("boardwrite.ap")
	public String goHosBoardForm() {

		return "board/hosBoardInsertForm";
	}

	@RequestMapping("boardinsert.ap")
	public String hosBoardInsert(HosBoard hb, Model model) {
		int result = bService.insertHB(hb);

		String msg = "null";
		if (result > 0) {
			msg = "게시글 작성 완료!";
		} else {
			msg = "게시글 작성 실패!";
		}

		model.addAttribute("aMsg", msg);

		return "redirect:hosboard.ap";
	}

	@RequestMapping("boarddetail.ap")
	public String hosBoardDetail(int hbId, Model m, HttpServletRequest req, HttpServletResponse res) {
		/* 쿠키 이용 조회수 증가 */
		boolean flag = false;
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("hbId" + hbId))
					flag = true;
			}
			if (!flag) {
				Cookie c = new Cookie("hbId" + hbId, String.valueOf(hbId));
				c.setMaxAge(7 * 24 * 60 * 60);
				res.addCookie(c);
			}

		}

		HosBoard hb = bService.selectHB(hbId,flag);
		if (hb != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(hb.getCreateDate());
			m.addAttribute("date", date);
			m.addAttribute("hb", hb);
			return "board/hosBoardDetailView";
		} else {
			throw new commonException("게시판 세부화면 이동 실패!");
		}
	}

	@RequestMapping("boardupdate.ap")
	public String goHosBoardUpdateForm(int hbId, Model m) {
		boolean flag = true;
		HosBoard hb = bService.selectHB(hbId,flag);
		if (hb != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(hb.getCreateDate());
			m.addAttribute("date", date);
			m.addAttribute("hb", hb);
			return "board/hosBoardUpdateForm";
		} else {
			throw new commonException("수정화면 이동 실패!");
		}
	}

	@RequestMapping("updateboard.ap")
	public String hosBoardUpdate(HosBoard hb) {
		int result = bService.updateHB(hb);

		if (result > 0) {
			return "redirect:hosboard.ap?hbId=" + hb.getHbId();
		} else {
			throw new commonException("게시글 수정 실패");
		}
	}

	@RequestMapping("boarddelete.ap")
	@ResponseBody
	public int hosBoardDelete(int hbId) {
		int result = bService.deleteHB(hbId);
		return result;
	}

	/* 파일 저장 메소드 */

	public Attachment saveFiles(MultipartFile file, HttpServletRequest req, String kind) {
		Attachment at = new Attachment();
		// 파일 저장 경로
		String root = req.getSession().getServletContext().getRealPath("resources");
		// System.out.println("root : " + root);
		String savePath = root + "\\uploadFiles";

		if (kind.equals("notice")) {
			savePath = savePath + "\\notice";
			at.setRefTable("NOTICE");
		} else {
			savePath = savePath + "\\hosBoard";
			at.setRefTable("HOS_BOARD");
		}

		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdirs();

		// 파일 Rename
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		// 확장자 추출
		String originFileName = file.getOriginalFilename();
		// String renameFileName = sdf.format(new Date()) + newOriginFileName +
		// originFileName.substring(originFileName.lastIndexOf("."));
		String renameFileName = sdf.format(new Date()) + originFileName;
		/*
		 * System.out.println("rename : " + renameFileName);
		 * System.out.println("origin : " + originFileName);
		 */

		at.setRenameFile(renameFileName);
		at.setFilePath(savePath);

		try {
			file.transferTo(new File(folder + "\\" + renameFileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		/* rename, filePath */
		return at;
	}

	public void deleteFile(String fileName, HttpServletRequest req, String kind) {
		String root = req.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		if (kind.equals("notice")) {
			savePath = savePath + "\\notice";
		} else {
			savePath = savePath + "\\hosBoard";
		}

		File f = new File(savePath + "\\" + fileName);

		if (f.exists())
			f.delete();

	}

	/* 비밀번호 확인용 메소드 */
	@RequestMapping("pwdconfirm.ap")
	@ResponseBody
	public int pwdConfirm(String pwd, HttpServletRequest req) {
		int result = 0;
		Employee writer = (Employee) req.getSession().getAttribute("loginUser");
		// System.out.println("넘어온 값 : " + pwd);
		String userPwd = writer.getPwd();
		// System.out.println("로그인 값 : " + userPwd);
		if (userPwd.equals(pwd)) {
			result += 1;
		}
		return result;
	}
	
}
