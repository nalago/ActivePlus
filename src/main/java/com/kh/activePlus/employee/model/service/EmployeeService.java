package com.kh.activePlus.employee.model.service;

import java.util.ArrayList;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;


public interface EmployeeService {
	
	public Employee loginEmployee(Employee e);

	public int insertEmployee(Employee e);

	public int updateEmployee(Employee e);

	public int selectListCount();

	public ArrayList<Employee> selectList(PageInfo pi);

	public Employee selectEmployee(String id);

	public ArrayList<Employee> searchList(Search search);

	public Employee selectEmployee1(String id);

	public int deleteEmployee(String id);

	public int updatePass(Employee e);


}
