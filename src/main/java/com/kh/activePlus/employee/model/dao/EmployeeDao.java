package com.kh.activePlus.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.MedicalTeam;

@Repository("eDao")
public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertEmployee(Employee e) {
		return sqlSession.insert("employeeMapper.insertemployee", e);
	}

	public Employee selectEmployee(Employee e) {
		System.out.println("dao : " + e);
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
		/*System.out.println("Dao" + id);*/
		return sqlSession.selectOne("employeeMapper.selectOne1", id);
	}
	
	public /*ArrayList<Attachment>*/Attachment selectAttachment(String eid) {
		return /*(ArrayList)*/sqlSession.selectOne/*List*/("employeeMapper.selectAttachment", eid);
	}

	public int updateEmployee(Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}

	public int deleteEmployee(String id) {
		return sqlSession.update("employeeMapper.deleteEmployee", id);
	}

	public int updatePass(Employee e) {
		return sqlSession.update("employeeMapper.updatePass", e);
	}

	public Employee selectmyEmployee(Employee e) {
		return sqlSession.selectOne("employeeMapper.selectmyInfo", e);
	}

	public int insertEmployeeAttachment(Attachment at) {
		return sqlSession.insert("employeeMapper.insertempAttachment", at);
	}

	public int insertMedicalTeam(MedicalTeam mt) {
		return sqlSession.insert("employeeMapper.insertMediTeam", mt);
	}

	

	


}
