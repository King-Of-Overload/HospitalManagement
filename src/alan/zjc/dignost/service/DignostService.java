package alan.zjc.dignost.service;

import java.util.List;

import alan.zjc.dignost.dao.DignostDao;
import alan.zjc.dignost.model.Dignost;
import alan.zjc.register.model.Patient;

public class DignostService {
	private DignostDao dignostDao=new DignostDao();

	public List<Patient> findAllDoctorPatient(String doctorName) {
		return dignostDao.findAllDoctorPatient(doctorName);
	}

	public Patient findOnePatient(String pathId) {
		return dignostDao.findOnePatient(pathId);
	}

	public int updateDignostByDoctor(String pathId, String pathHistory, String pathAllergy, String pathSymptom,
			String pathAnalyse) {
		Dignost dignost=new Dignost();
		dignost.setPathHistory(pathHistory);
		dignost.setPathAllergy(pathAllergy);
		dignost.setPathAnalyse(pathAnalyse);
		dignost.setPathSymptom(pathSymptom);
		dignost.setPathId(pathId);
		return dignostDao.updateDignostByDoctor(dignost);
	}

	public Dignost findDignostByPathId(String pathId) {
		return dignostDao.findDignostByPathId(pathId);
	}

}
