package org.t1.qqzone.util;

import java.util.List;

public class Page<T> {

	// 页码
	private Integer pageNo;
	// 每页长度
	private Integer pageSize;
	// 对应集合
	private List<T> result;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getResult() {
		return result;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}

}
