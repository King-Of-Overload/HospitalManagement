package alan.zjc.register.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import alan.zjc.register.model.Dept;
import alan.zjc.register.model.Patient;
import alan.zjc.user.model.Doctor;
import alan.zjc.utils.JdbcUtils;

public class RegisterDao {
	private Connection connection=null;
	private PreparedStatement pstmt=null;
	
	public List<Dept> findAllDept() {
		List<Dept> depts=null;
		Dept dept=null;
		try{
			connection=JdbcUtils.getConnection();
			String sql="SELECT * FROM dept ORDER BY deptId";
			pstmt=connection.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			depts=new ArrayList<>();
			while(rs.next()){
				dept=new Dept();
				dept.setDeptId(rs.getInt(1));
				dept.setDeptName(rs.getString(2));
				depts.add(dept);
			}	
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally {
			try{
				if(connection!=null) connection.close();
				if(pstmt!=null) pstmt.close(); 
			}catch(SQLException e){}
		}
		return depts;
	}

	public List<Doctor> findDoctorsByDept(String deptName) {
		List<Doctor> doctorList=null;
		Doctor doctor=null;
		try {
			connection=JdbcUtils.getConnection();
			String sql="SELECT doctorName FROM dept,doctor WHERE dept.deptId=doctor.deptId AND deptName=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, deptName);
			ResultSet rs=pstmt.executeQuery();
			doctorList=new ArrayList<>();
			while(rs.next()){
				doctor=new Doctor();
				doctor.setDoctorName(rs.getString(1));
				doctorList.add(doctor);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return doctorList;
	}

	public int saveRegister(Patient patient, String dignostId, String doctorName) {
		int totalResult;
		try{
			connection=JdbcUtils.getConnection();
			//更新病历表
			String dignostSQL="INSERT INTO dignost(pathId,doctorId) VALUES(?,?)";
			String queryDoctor="SELECT doctorId FROM doctor WHERE doctorName=?";
			pstmt=connection.prepareStatement(queryDoctor);
			pstmt.setString(1, doctorName);
			ResultSet rs=pstmt.executeQuery();
			String doctorId="";
			while(rs.next()){
				doctorId=rs.getString(1);
			}
			pstmt=connection.prepareStatement(dignostSQL);
			pstmt.setString(1, dignostId);
			pstmt.setString(2, doctorId);
			int result2=pstmt.executeUpdate();
			
			String patientSQL="INSERT INTO patient(patientName,patientSex,patientAge,patientAddress,pathId) VALUES(?,?,?,?,?)";
			pstmt=connection.prepareStatement(patientSQL);
			pstmt.setString(1, patient.getPatientName());
			pstmt.setString(2, patient.getPatientSex());
			pstmt.setInt(3, patient.getPatientAge());
			pstmt.setString(4, patient.getPatientAddress());
			pstmt.setString(5, patient.getPathId());
			int result1=pstmt.executeUpdate();

			if(result1==1&&result2==1){
				totalResult=0;
			}else{
				totalResult=1;
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally {
			try{
				if(connection!=null) connection.close();
				if(pstmt!=null) pstmt.close();
			}catch(SQLException e){}
		}
		return totalResult;
	}

	public Patient findPatientByPathId(String pathId) {
		Patient patient=null;
		try {
			connection=JdbcUtils.getConnection();
			String sql="SELECT * FROM patient WHERE pathId=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, pathId);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				patient=new Patient();
				patient.setPatientName(rs.getString(2));
				patient.setPatientSex(rs.getString(3));
				patient.setPatientAge(rs.getInt(4));
				patient.setPatientAddress(rs.getString(5));
				patient.setPathId(rs.getString(6));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(connection!=null) connection.close();
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {}
		}
		return patient;
	}

	public int updateDignost(String dignostId, String doctorName) {
		int totalResult=0;
		try {
			connection=JdbcUtils.getConnection();
			String sql="UPDATE dignost SET doctorId=? WHERE pathId=?";
			String queryDoctor="SELECT doctorId FROM doctor WHERE doctorName=?";
			pstmt=connection.prepareStatement(queryDoctor);
			pstmt.setString(1, doctorName);
			ResultSet rs=pstmt.executeQuery();
			String doctorId="";
			while(rs.next()){
				doctorId=rs.getString(1);
			}
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, doctorId);
			pstmt.setString(2, dignostId);
			int result=pstmt.executeUpdate();
			if(result==1){
				totalResult=0;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(connection!=null) connection.close();
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {}
		}
		return totalResult;
	}

}
