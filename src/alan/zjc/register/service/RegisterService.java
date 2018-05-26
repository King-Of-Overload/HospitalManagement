package alan.zjc.register.service;

import java.util.List;

import alan.zjc.register.dao.RegisterDao;
import alan.zjc.register.model.Dept;
import alan.zjc.register.model.Patient;
import alan.zjc.user.model.Doctor;

public class RegisterService {
	private RegisterDao registerDao=new RegisterDao();

	public List<Dept> findAllDept() {
		return registerDao.findAllDept();
	}

	public List<Doctor> findDoctorsByDept(String deptName) {
		return registerDao.findDoctorsByDept(deptName);
	}

	public int saveRegister(String dignostId, String patientName, String sex, int patientAge, String patinetAddress,
			String deptName, String doctorName) {
		Patient patient=new Patient();
		patient.setPatientName(patientName);
		patient.setPatientAge(patientAge);
		patient.setPatientSex(sex);
		patient.setPatientAddress(patinetAddress);
		patient.setPathId(dignostId);
		return registerDao.saveRegister(patient,dignostId,doctorName);
	}

	public Patient findPatientByPathId(String pathId) {
		return registerDao.findPatientByPathId(pathId);
	}

	public int updateDignost(String dignostId, String doctorName) {
		return registerDao.updateDignost(dignostId,doctorName);
	}

}
