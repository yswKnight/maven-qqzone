package org.t1.qqzone.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.persistence.CommentMapper;
import org.t1.qqzone.service.CommentService;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;

	@Override
	public void save(Comment comment) {

		Integer corder = this.getCommentCorder();
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		String uuidStr = str.replace("-", "");

		comment.setCommid(uuidStr);

		comment.setCommcreatetime(new Date());

		comment.setNewcorder(corder + 1);

		this.commentMapper.save(comment);

	}
	
	@Override
	public void saves(Comment comment) {

		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		String uuidStr = str.replace("-", "");

		comment.setCommid(uuidStr);

		comment.setCommcreatetime(new Date());

		this.commentMapper.save(comment);

	}

	@Override
	public Integer getCommentCorder() {
		return this.commentMapper.getCommentCorder();
	}

	@Override
	public void deleteComment(String commid) {
		this.commentMapper.deleteComment(commid);
	}
}
