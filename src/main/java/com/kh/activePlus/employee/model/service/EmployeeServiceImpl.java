package com.kh.activePlus.employee.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.dao.EmployeeDao;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.TNA;

@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao eDao;
	
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
		}
		return rTna;
	}

	@Override
	public ArrayList<TNA> selectTNA(String id) {
		return eDao.selectTNA(id);
	}
	
	


}
