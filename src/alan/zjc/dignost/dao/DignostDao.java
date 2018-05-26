package alan.zjc.dignost.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import alan.zjc.dignost.model.Dignost;
import alan.zjc.register.model.Patient;
import alan.zjc.utils.JdbcUtils;

public class DignostDao {
	private Connection connection=null;
	private PreparedStatement pstm=null;

	public List<Patient> findAllDoctorPatient(String doctorName) {
		List<Patient> patients=new ArrayList<>();
		Patient patient=null;
		try {
			connection=JdbcUtils.getConnection();
			String sql="SELECT patientId,patientName,patientSex,patientAge,patient.pathId FROM patient,dignost,doctor WHERE patient.pathId=dignost.pathId AND dignost.doctorId=doctor.doctorId AND doctorName=?";
			pstm=connection.prepareStatement(sql);
			pstm.setString(1, doctorName);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()){
				patient=new Patient();
				patient.setPatientId(rs.getInt(1));
				patient.setPatientName(rs.getString(2));
				patient.setPatientSex(rs.getString(3));
				patient.setPatientAge(rs.getInt(4));
				patient.setPathId(rs.getString(5));
				patients.add(patient);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(connection!=null) connection.close();
				if(pstm!=null) pstm.close();
			} catch (Exception e) {}
		}
		return patients;
	}

	public Patient findOnePatient(String pathId) {
		Patient patient=null;
		try {
			connection=JdbcUtils.getConnection();
			String sql="SELECT * FROM patient WHERE pathId=?";
			pstm=connection.prepareStatement(sql);
			pstm.setString(1, pathId);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()){
				patient=new Patient();
				patient.setPatientId(rs.getInt(1));
				patient.setPatientName(rs.getString(2));
				patient.setPatientSex(rs.getString(3));
				patient.setPatientAge(rs.getInt(4));
				patient.setPathId(rs.getString(6));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(connection!=null) connection.close();
				if(pstm!=null) pstm.close();
			} catch (Exception e) {}
		}
		return patient;
	}

	public int updateDignostByDoctor(Dignost dignost) {
		int totalResult=1;
		try {
			connection=JdbcUtils.getConnection();
			String sql="UPDATE dignost SET pathHistory=?,pathAllergy=?,pathSymptom=?,pathAnalyse=? WHERE pathId=?";
			pstm=connection.prepareStatement(sql);
			pstm.setString(1, dignost.getPathHistory());
			pstm.setString(2, dignost.getPathAllergy());
			pstm.setString(3, dignost.getPathSymptom());
			pstm.setString(4, dignost.getPathAnalyse());
			pstm.setString(5, dignost.getPathId());
			int result=pstm.executeUpdate();
			if(result==1){
				totalResult=0;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(connection!=null) connection.close();
				if(pstm!=null) pstm.close();
			} catch (Exception e) {}
		}
		return totalResult;
	}

	public Dignost findDignostByPathId(String pathId) {
		Dignost dignost=null;
		try {
			connection=JdbcUtils.getConnection();
			String sql="SELECT * FROM dignost WHERE pathId=?";
			pstm=connection.prepareStatement(sql);
			pstm.setString(1, pathId);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()){
				dignost=new Dignost();
				dignost.setPathHistory(rs.getString(2));
				dignost.setPathAllergy(rs.getString(3));
				dignost.setPathSymptom(rs.getString(4));
				dignost.setPathAnalyse(rs.getString(5));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(connection!=null) connection.close();
				if(pstm!=null) pstm.close();
			} catch (Exception e) {}
		}
		return dignost;
	}

}
