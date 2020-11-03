package com.kh.activePlus.schedule.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.schedule.model.dao.ScheduleDao;
import com.kh.activePlus.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDao sDao;
	
	@Override
	public List<Schedule> selectSchedule(Map params) {
		
		return sDao.selectSchedule(params);
	}

	@Override
	public int insertSchedule(Schedule schd) {
		return sDao.insertSchdule(schd);
	}

	@Override
	public Schedule readSchedule(Map params) {
		return sDao.readSchedule(params);
	}

	@Override
	public int updateSchedule(Map params) {
		return sDao.updateSchedule(params);
	}

	@Override
	public int deleteSchedule(Map params) {
		return sDao.deleteSchedule(params);
	}

}
