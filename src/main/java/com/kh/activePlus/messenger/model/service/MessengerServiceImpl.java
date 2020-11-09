package com.kh.activePlus.messenger.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.messenger.model.dao.MessengerDao;
import com.kh.activePlus.messenger.model.vo.Emergency;
@Service("mesService")
public class MessengerServiceImpl implements MessengerService, EmergencyService{
	@Autowired
	private MessengerDao mesDao;
	
	
	@Override
	public int emergencyCall(Emergency em) {
		return mesDao.emergencyCall(em);
	}
	
}
