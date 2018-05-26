package alan.zjc.register.model;

import java.io.Serializable;

public class Dept implements Serializable {
	private int deptId;
	private String deptName;
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
