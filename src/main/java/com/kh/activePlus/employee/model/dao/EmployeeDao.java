package com.kh.activePlus.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.TNA;

@Repository("eDao")
public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertEmployee(Employee m) {
		return sqlSession.insert("employeeMapper.insertEmployee", m);
	}

	public Employee selectEmployee(Employee m) {
		return sqlSession.selectOne("employeeMapper.selectOne", m);
	}

	public int selectListCount() {
		return sqlSession.selectOne("employeeMapper.selectListCount");
	}

	public ArrayList<Employee> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("employeeMapper.selectList", null, rowBounds);
	}

	public Employee selectEmployee(String name) {
		return sqlSession.selectOne("employeeMapper.selectOne", name);
	}

	public ArrayList<Employee> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("employeeMapper.searchList", search);
	}

	public Employee selectEmployee1(String id) {
		return sqlSession.selectOne("employeeMapper.selectOne1", id);
	}

	public int startWorking(TNA tna) {
		return sqlSession.insert("employeeMapper.startWorking", tna);
	}

	public ArrayList<TNA> selectTNA(String empId) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectTNA", empId);
	}

}
