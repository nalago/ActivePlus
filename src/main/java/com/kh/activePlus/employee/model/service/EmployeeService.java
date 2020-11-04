package com.kh.activePlus.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;
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

	public int endWorking(int tid);


}
