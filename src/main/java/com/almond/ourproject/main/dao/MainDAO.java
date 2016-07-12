package com.almond.ourproject.main.dao;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.almond.ourproject.common.dao.AbstractDAO;

@Repository
public class MainDAO extends AbstractDAO {

	public int insertLocation(HashMap<String, Object> param) {
		return (int) insert("MainDAO.insertLocation", param);
	}
}
