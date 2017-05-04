package org.t1.qqzone.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.Praise;
import org.t1.qqzone.domain.Say;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.persistence.ActivityMapper;
import org.t1.qqzone.persistence.UserMapper;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.util.Page;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityMapper activityMapper;
	@Autowired
	private UserMapper userMapper;

	// 添加日志动态
	public void addActivity(Activity activity) {
		// 生成一个随机字符串ID
		UUID uid = UUID.randomUUID();
		// 把生成的ID转为字符串
		String id = uid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toUpperCase();
		// 将生成的ID中的”-“去掉
		id = id.replaceAll("-", "");
		activity.setActid(id);
		Dic dic = new Dic();
		dic.setDicid("22");
		activity.setDic(dic);
		activity.setActcreatetime(new Date());
		activityMapper.addActivity(activity);
	}

	// 查询所有动态
	@Override
	public Page<Activity> findAllActivitys(Map<String, Object> map) {

		// 设置每页六条动态
		final Integer pageSize = 4;

		Page<Activity> page = new Page<Activity>();
		Integer pageNo = (Integer) map.get("pageNo");
		Integer pageStrat = (pageNo - 1) * pageSize;
		map.put("pageStart", pageStrat);
		map.put("pageSize", pageSize);

		List<Activity> result = this.activityMapper.queryActivitysByUserAndFriends(map);

		for (Activity act : result) {
			List<User> listusers = this.getPraiseNum(act.getActid());
			List<Comment> comments = this.queryCommentsByActId(act.getActid());
			for (Comment com : comments) {
				if (com != null) {
					com.setGiveuser(this.userMapper.getUserById(com.getGiveuser().getUserid()));
					com.setAdoptuser(this.userMapper.getUserById(com.getAdoptuser().getUserid()));
				}
			}
			
			if(act.getSay() != null){
				Say say = new Say();
				say = act.getSay();
				say.setPhotosrc(this.activityMapper.getSayPictureSrc(say.getSayid()));
				act.setSay(say);
			}
			
			act.setComments(comments);
			act.setPraise(listusers.size());
			act.setListUser(listusers);
		}

		// 设置对应集合
		page.setResult(result);

		// 设置page参数
		page.setPageNo(Integer.parseInt(map.get("pageNo").toString()));
		page.setPageSize(pageSize);

		return page;
	}

	// 返回点赞的用户集合
	@Override
	public List<User> getPraiseNum(String actId) {
		List<Praise> list = this.activityMapper.getActPraiseCount(actId);
		List<User> users = new ArrayList<User>();
		for (Praise pra : list) {
			users.add(pra.getUser());
		}
		return users;
	}

	// 赞动态
	@Override
	public void PraiseActivity(Praise praise) {

		// 生成一个随机字符串ID
		UUID uid = UUID.randomUUID();
		// 把生成的ID转为字符串
		String id = uid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toUpperCase();
		// 将生成的ID中的”-“去掉
		id = id.replaceAll("-", "");

		praise.setPraid(id);

		this.activityMapper.praiseActivity(praise);
	}

	// 取消赞
	@Override
	public void backPraiseActivity(Praise praise) {
		this.activityMapper.backPraiseActivity(praise);
	}

	@Override
	public List<Comment> queryCommentsByActId(String actId) {
		return this.activityMapper.queryCommentsByActId(actId);
	}

	@Override
	public void insertActivityByPhoto(Activity activity) {
		this.activityMapper.insertActivityByPhoto(activity);
	}

	@Override
	public List<Comment> findActivityByPhoroId(String photoid) {
		// TODO Auto-generated method stub
		return this.activityMapper.findActivityByPhoroId(photoid);
	}

}
