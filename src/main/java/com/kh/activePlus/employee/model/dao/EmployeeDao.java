package com.kh.activePlus.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;

@Repository("eDao")
public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertEmployee(Employee e) {
		return sqlSession.insert("employeeMapper.insertemployee", e);
	}

	public Employee selectEmployee(Employee e) {
		System.out.println("dao : "+e);
		return sqlSession.selectOne("employeeMapper.selectOne", e);
	}

	public int selectListCount() {
		return sqlSession.selectOne("employeeMapper.selectListCount");
	}

	public ArrayList<Employee> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getEmployeeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getEmployeeLimit());
		return (ArrayList)sqlSession.selectList("employeeMapper.selectList", null, rowBounds);
	}

	/*public Employee selectEmployee(String name) {
		return sqlSession.selectOne("EmployeeMapper.selectOne", name);
	}*/

	public ArrayList<Employee> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("employeeMapper.searchList", search);
	}

	public Employee selectEmployee(String id) {
		System.out.println("Dao" + id);
		return sqlSession.selectOne("employeeMapper.selectOne1", id);
	}

	public int updateEmployee(Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}

	public int deleteEmployee(String id) {
		return sqlSession.update("employeeMapper.deleteEmployee", id);
	}


	public int endWorking(int tid, String kind) {
		HashMap<String,String> hmap = new HashMap<>();
		hmap.put("tid", tid+"");
		hmap.put("kind", kind);
		return sqlSession.update("employeeMapper.endWorking", hmap);
	}

	public ArrayList<Employee> selectEmpList() {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList");
	}

	public int halfCount(String now, String empId) {
		HashMap<String,String> hmap = new HashMap<>();
		// 한 해 동안의 사용량 체크
		hmap.put("startYear", now+"-01-01");
		hmap.put("endYear", now+"-12-31");
		hmap.put("empId", empId);
		System.out.println(empId);
		return sqlSession.selectOne("employeeMapper.getHalfCount",hmap);
		
	public int updatePass(Employee e) {
		return sqlSession.update("employeeMapper.updatePass", e);

	}

}
