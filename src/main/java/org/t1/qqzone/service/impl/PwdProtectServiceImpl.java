package org.t1.qqzone.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.persistence.PwdProtectMapper;
import org.t1.qqzone.service.PwdProtectService;

@Service
public class PwdProtectServiceImpl implements PwdProtectService {

	@Autowired
	private PwdProtectMapper pwdProtectMapper;

	// 判断是否已经有密保
	@Override
	public boolean judgePwdProtect(String userId) {

		// 查询用户的密保问题数量
		long answersnum = this.pwdProtectMapper.getAnswersNum(userId);

		// 如果大于0则已有密保了;否则没有设置密保
		if (answersnum > 0) {
			return false;
		} else {
			return true;
		}
	}

	// 设置密保问题
	@Override
	public void setAnswers(PwdProtect pwdProtect) {

		// 生成一个随机字符串ID
		UUID uid = UUID.randomUUID();
		// 把生成的ID转为字符串
		String id = uid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toUpperCase();
		// 将生成的ID中的”-“去掉
		id = id.replaceAll("-", "");

		pwdProtect.setPid(id);

		// 将集合里的所有密保对象添加进数据库
		this.pwdProtectMapper.setAnswers(pwdProtect);

	}

}
