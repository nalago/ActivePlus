package com.kh.activePlus.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.MedicalTeam;
import com.kh.activePlus.employee.model.vo.TNA;

public interface EmployeeService {
	
	public Employee loginEmployee(Employee m);

	public int insertEmployee(Employee m);

	public int updateEmployee(Employee m);

	public int selectListCount();

	public ArrayList<Employee> selectList(PageInfo pi);

	public Employee selectEmployee(String id);

	public ArrayList<Employee> searchList(Search search);

	public Employee selectEmployee1(String id);

	public ArrayList<TNA> startWorking(TNA tna);

	public ArrayList<TNA> selectTNA(String id);

	public HashMap<String, ArrayList> selectMainList(String empId);

	public int endWorking(int tid, String kind);

	public ArrayList<Employee> selectEmpList();

	public int halfEnd(String now, String empId);
	
	public int updatePass(Employee e);

	public Employee selectmyEmployee(Employee e);

	public int insertEmployeeAttachment(Attachment at);

	public int insertMedicalTeam(MedicalTeam mt);

	public ArrayList<Attachment> selectAttachment(String eid);


	public String getPw(Map<String, Object> paramMap);
=
	public Attachment selectImg(String empId);



	public String getUserPwd(String id);

	public int updateMedicalTeam(MedicalTeam mt);

	public int updateEmployeeAttachment(Attachment at);

	public MedicalTeam selectMediTeam(String eid);
	
	public int deleteEmployee(String id);
}
