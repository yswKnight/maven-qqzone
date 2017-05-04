package org.t1.qqzone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.persistence.DicMapper;
import org.t1.qqzone.service.DicService;

@Service
public class DicServiceImpl implements DicService {

	@Autowired
	private DicMapper dicMapper;

	@Override
	public List<Dic> findQuestionsAll() {
		return this.dicMapper.findQuestionsAll();
	}

	@Override
	public Dic getDicById(String dicid) {
		// TODO Auto-generated method stub
		return this.dicMapper.getDicById(dicid);
	}

}
