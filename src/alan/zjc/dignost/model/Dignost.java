package alan.zjc.dignost.model;

import java.io.Serializable;

public class Dignost implements Serializable {
	private String pathId;
	private String pathHistory;
	private String pathAllergy;
	private String pathSymptom;
	private String pathAnalyse;
	private String doctorId;
	public String getPathId() {
		return pathId;
	}
	public void setPathId(String pathId) {
		this.pathId = pathId;
	}
	public String getPathHistory() {
		return pathHistory;
	}
	public void setPathHistory(String pathHistory) {
		this.pathHistory = pathHistory;
	}
	public String getPathAllergy() {
		return pathAllergy;
	}
	public void setPathAllergy(String pathAllergy) {
		this.pathAllergy = pathAllergy;
	}
	public String getPathSymptom() {
		return pathSymptom;
	}
	public void setPathSymptom(String pathSymptom) {
		this.pathSymptom = pathSymptom;
	}
	public String getPathAnalyse() {
		return pathAnalyse;
	}
	public void setPathAnalyse(String pathAnalyse) {
		this.pathAnalyse = pathAnalyse;
	}
	public String getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}
	public Dignost() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
