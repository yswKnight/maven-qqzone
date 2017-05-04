package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Dic;

public interface DicMapper {

	public List<Dic> findQuestionsAll();
	
	public Dic getDicById(String dicid);
	
}
