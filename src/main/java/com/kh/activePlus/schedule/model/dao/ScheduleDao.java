package com.kh.activePlus.schedule.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.schedule.model.vo.Schedule;

@Repository("sDao")
public class ScheduleDao {
	@Autowired
	private SqlSession session;
	
	public List<Schedule> selectSchedule(Map params) {
		return session.selectList("schdMapper.selectSchedule", params);
	}

	public int insertSchdule(Schedule schd) {
		return session.insert("schdMapper.insertSchedule", schd);
	}

	public Schedule readSchedule(Map params) {
		return session.selectOne("schdMapper.readSchedule", params);
	}

	public int updateSchedule(Map params) {
		return session.update("schdMapper.updateSchedule", params);
	}

	public int deleteSchedule(Map params) {
		return session.delete("schdMapper.deleteSchedule", params);
	}

}
