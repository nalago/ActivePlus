package com.kh.activePlus.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.activePlus.board.model.dao.BoardDao;
import com.kh.activePlus.board.model.vo.HosBoard;
import com.kh.activePlus.board.model.vo.Notice;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.dao.EmployeeDao;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.TNA;
import com.kh.activePlus.mail.model.dao.MailDao;
import com.kh.activePlus.mail.model.vo.Email;

@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao eDao;
	@Autowired
	private MailDao mDao;
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public Employee loginEmployee(Employee m) {
		Employee loginUser = eDao.selectEmployee(m);
		System.out.println(loginUser);
		/*if(loginUser != null &&
				!bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			loginUser = null;
		}*/
		return loginUser;
	}

	@Override
	public int insertEmployee(Employee m) {
		return eDao.insertEmployee(m);
	}

	@Override
	public int updateEmployee(Employee m) {
		return 0;
	}

	@Override
	public int selectListCount() {
		return eDao.selectListCount();
	}

	@Override
	public ArrayList<Employee> selectList(PageInfo pi) {
		System.out.println(pi);
		return eDao.selectList(pi);
	}

	@Override
	public Employee selectEmployee(String id) {
		return eDao.selectEmployee(id);
	}

	@Override
	public ArrayList<Employee> searchList(Search search) {
		return eDao.searchList(search);
	}

	@Override
	public Employee selectEmployee1(String id) {
		return eDao.selectEmployee1(id);
	}

	@Override
	public ArrayList<TNA> startWorking(TNA tna) {
		int result = eDao.startWorking(tna);
		ArrayList<TNA> rTna = null;
		if(result > 0) {
			rTna = eDao.selectTNA(tna.getEmpId());
			rTna.get(0).setTid(result);;
		}
		return rTna;
	}

	@Override
	public ArrayList<TNA> selectTNA(String id) {
		return eDao.selectTNA(id);
	}
	
	@Override
	public HashMap<String, ArrayList> selectMainList(String empId){
		HashMap<String, ArrayList> hMap = new HashMap<>();
		ArrayList<Email> mList = mDao.selectInList(empId, "inMail", null);
		ArrayList<Notice> nList = bDao.selectList(null);
		ArrayList<HosBoard> hbList = bDao.selectHBList(null);
		
		hMap.put("mList", mList);
		hMap.put("nList", nList);
		hMap.put("hbList", hbList);
		
		return hMap;
	}

	// 퇴근
	@Override
	public int endWorking(int tid, String kind) {
		return eDao.endWorking(tid, kind);
	}

	@Override
	public ArrayList<Employee> selectEmpList() {
		return eDao.selectEmpList();
	}

	@Override
	public int halfEnd(String now, String empId) {
		return eDao.halfCount(now, empId);
	}

	@Override
	public Attachment selectImg(String empId) {
		return eDao.selectImg(empId);
	}
	
}




