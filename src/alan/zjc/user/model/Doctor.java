package alan.zjc.user.model;

import java.io.Serializable;

public class Doctor implements Serializable {
	private String doctorId;
	private String doctorName;
	private String doctorPassword;
	private int deptId;
	private String doctorSpecial;
	
	
	public String getDoctorPassword() {
		return doctorPassword;
	}
	public void setDoctorPassword(String doctorPassword) {
		this.doctorPassword = doctorPassword;
	}
	public String getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDoctorSpecial() {
		return doctorSpecial;
	}
	public void setDoctorSpecial(String doctorSpecial) {
		this.doctorSpecial = doctorSpecial;
	}
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
