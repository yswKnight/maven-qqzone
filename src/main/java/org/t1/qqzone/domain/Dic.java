package org.t1.qqzone.domain;

/**
 * @author wangchao ×Öµä±í
 */
public class Dic {

	// ×ÖµäID
	private String dicid;
	// ¶¯Ì¬ID
	private String dicvalue;

	public String getDicid() {
		return dicid;
	}

	public void setDicid(String dicid) {
		this.dicid = dicid;
	}

	public String getDicvalue() {
		return dicvalue;
	}

	public void setDicvalue(String dicvalue) {
		this.dicvalue = dicvalue;
	}

	@Override
	public String toString() {
		return "Dic [dicid=" + dicid + ", dicvalue=" + dicvalue + "]";
	}

	
}
