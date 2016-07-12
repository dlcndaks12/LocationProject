package com.almond.ourproject.main.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.almond.ourproject.main.dao.MainDAO;

@Service
public class MainService {
	
	@Autowired
	private MainDAO mainDAO;
	
	public int insertLocation(HashMap<String, Object> param) {
		return mainDAO.insertLocation(param);
	}
	
	public HashMap<String, Object> getLocation(HashMap<String, Object> param) {
		return mainDAO.getLocation(param);
	}
}
