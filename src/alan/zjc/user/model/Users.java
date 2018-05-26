package alan.zjc.user.model;

import java.io.Serializable;

public class Users implements Serializable {
	private int uid;
	private String uname;
	private String upassword;
	private String uoffice;
	private int ustatus;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUoffice() {
		return uoffice;
	}
	public void setUoffice(String uoffice) {
		this.uoffice = uoffice;
	}
	public int getUstatus() {
		return ustatus;
	}
	public void setUstatus(int ustatus) {
		this.ustatus = ustatus;
	}
	public Users() {
		
	}
	
	

}
