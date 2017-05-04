package org.t1.qqzone.service.impl;


import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.LogAct;
import org.t1.qqzone.persistence.ActivityMapper;
import org.t1.qqzone.persistence.LogActMapper;
import org.t1.qqzone.service.LogActService;


@Service
public class LogActServiceImpl implements LogActService {
	@Autowired
	private LogActMapper logActMapper;
	@Autowired
	private ActivityMapper activityMapper;
	// ��ʾ������־
	public List<LogAct> findLogActAll(String userId) {
		return logActMapper.findLogActAll(userId);
	}
	// ����ID�鿴��־��ϸ
	public LogAct getLogActById(String logId) {

		return logActMapper.getLogActById(logId);
	}

	// �����־
	public void addLogAct(LogAct logAct,Activity activity) {
        //����һ������ַ���ID
		UUID uid1 = UUID.randomUUID();
		//�����ɵ�IDתΪ�ַ���
		String id1 = uid1.toString();
		//�����ɵ�ID������ĸת��Ϊ��д
		id1=id1.toUpperCase();
		//�����ɵ�ID�еġ�-��ȥ��
		id1= id1.replaceAll("-","");
		//�����־��̬
		activity.setActid(id1);
		
		//����һ������ַ���ID
		UUID uid2 = UUID.randomUUID();
		//�����ɵ�IDתΪ�ַ���
		String id2 = uid2.toString();
		//�����ɵ�ID������ĸת��Ϊ��д
		id2=id2.toUpperCase();
		//�����ɵ�ID�еġ�-��ȥ��
		id2= id2.replaceAll("-","");
		LogAct log=new LogAct();
		log.setLogId(id2);
		activity.setLog(log);
		Dic dic=new Dic();
		dic.setDicid("22");
		activity.setDic(dic);
		activity.setActcreatetime(new Date());
		
		activityMapper.addActivity(activity);
		logAct.setLogId(id2);
		
		java.sql.Date swTime = new java.sql.Date(System.currentTimeMillis());
		logAct.setLogcreateTime(swTime);

		logActMapper.addLogAct(logAct);
	}

	// ����IDɾ����־
	public void deleteLogAct(String logId) {
		activityMapper.deleteActivity(logId);
		logActMapper.deleteLogAct(logId);
	}
	// �޸���־
	public void updateLogAct(LogAct logAct){
		logActMapper.updateLogAct(logAct);
	};
}
