package com.kh.activePlus.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.MedicalTeam;
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

	public String getPw(Map<String, Object> paramMap) {
		return sqlSession.selectOne("employeeMapper.getPWd", paramMap);
	}
	
	public String getUserPwd(String id) {
		return (String)sqlSession.selectOne("employeeMapper.getUserPwd",id);
	}

	public int updateMedicalTeam(MedicalTeam mt) {
		return sqlSession.update("employeeMapper.updateMediTeam", mt);
	}

	public int updateAttachment(Attachment at) {
		return sqlSession.update("employeeMapper.updateAttachment", at);
	}


	public MedicalTeam selectMediTeam(String eid) {
		return sqlSession.selectOne("employeeMapper.selectMediTeam", eid);
	}
	
	public ArrayList<Attachment> selectAttachment(String eid) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAttachment", eid);
	}
	public int deleteEmployee(String id) {
		return sqlSession.update("employeeMapper.deleteEmployee", id);
	}
	public int updateEmployee(Employee e) {
	      return sqlSession.update("employeeMapper.updateEmployee", e);
	   }
	

	public Attachment selectImg(String empId) {
		return sqlSession.selectOne("employeeMapper.selectImg",empId);
	}


}
