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
	// 显示所有日志
	public List<LogAct> findLogActAll(String userId) {
		return logActMapper.findLogActAll(userId);
	}
	// 根据ID查看日志明细
	public LogAct getLogActById(String logId) {

		return logActMapper.getLogActById(logId);
	}

	// 添加日志
	public void addLogAct(LogAct logAct,Activity activity) {
        //生成一个随机字符串ID
		UUID uid1 = UUID.randomUUID();
		//把生成的ID转为字符串
		String id1 = uid1.toString();
		//将生成的ID所有字母转换为大写
		id1=id1.toUpperCase();
		//将生成的ID中的”-“去掉
		id1= id1.replaceAll("-","");
		//添加日志动态
		activity.setActid(id1);
		
		//生成一个随机字符串ID
		UUID uid2 = UUID.randomUUID();
		//把生成的ID转为字符串
		String id2 = uid2.toString();
		//将生成的ID所有字母转换为大写
		id2=id2.toUpperCase();
		//将生成的ID中的”-“去掉
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

	// 根据ID删除日志
	public void deleteLogAct(String logId) {
		activityMapper.deleteActivity(logId);
		logActMapper.deleteLogAct(logId);
	}
	// 修改日志
	public void updateLogAct(LogAct logAct){
		logActMapper.updateLogAct(logAct);
	};
}
