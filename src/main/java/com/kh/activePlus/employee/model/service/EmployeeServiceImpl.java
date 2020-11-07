package com.kh.activePlus.employee.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.dao.EmployeeDao;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.MedicalTeam;


@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao eDao;
	
	@Override
	public Employee loginEmployee(Employee e) {
		Employee loginUser = eDao.selectEmployee(e);
		
		/*System.out.println("서비스" + e);*/
		System.out.println("서비스 로그인유저 " + loginUser);
		
		return loginUser;
	}

	@Override
	public int insertEmployee(Employee e) {
		return eDao.insertEmployee(e);
	}

	@Override
	public int selectListCount() {
		return eDao.selectListCount();
	}

	@Override
	public ArrayList<Employee> selectList(PageInfo pi) {
	/*	System.out.println(pi);*/
		return eDao.selectList(pi);
	}

	@Override
	public Employee selectEmployee(String id) {
		/*System.out.println("serviceid :" + id);*/
		return eDao.selectEmployee(id);
	}
	
	@Override
	public /*ArrayList<Attachment> */Attachment selectAttachment(String id) {
		return eDao.selectAttachment(id);
	}

	@Override
	public ArrayList<Employee> searchList(Search search) {
		return eDao.searchList(search);
	}

	@Override
	public Employee selectEmployee1(String id) {
		return eDao.selectEmployee(id);
	}
	

	@Override
	public int updateEmployee(Employee e) {
		return eDao.updateEmployee(e);
	}

	@Override
	public int deleteEmployee(String id) {
		return eDao.deleteEmployee(id);
	}

	@Override
	public int updatePass(Employee e) {
		return eDao.updatePass(e);
	}

	@Override
	public Employee selectmyEmployee(Employee e) {
		return eDao.selectmyEmployee(e);
	}

	@Override
	public int insertEmployeeAttachment(Attachment at) {
		return eDao.insertEmployeeAttachment(at);
	}

	@Override
	public int insertMedicalTeam(MedicalTeam mt) {
		return eDao.insertMedicalTeam(mt);
	}




	


	
	


}
