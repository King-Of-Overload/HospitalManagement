package alan.zjc.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import alan.zjc.user.model.Doctor;
import alan.zjc.user.model.Users;
import alan.zjc.utils.JdbcUtils;

public class UserDao {
	Connection connection=null;
	PreparedStatement pstmt=null;

	public Users findUser(String username, String password, String office) {
		Users users=null;
		try{
			connection=JdbcUtils.getConnection();
			String sql="SELECT * FROM users WHERE uname=? AND upassword=? AND uoffice=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, office);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				users=new Users();
				users.setUid(rs.getInt(1));
				users.setUname(rs.getString(2));
				users.setUpassword(rs.getString(3));
				users.setUoffice(rs.getString(4));
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			try{
				if(connection!=null) connection.close();
				if(pstmt!=null) pstmt.close();
			}catch(SQLException e){}
		}
		return users;
	}

	public Doctor findDoctor(String username, String password) {
		Doctor doctor=null;
		try{
			connection=JdbcUtils.getConnection();
			String sql="SELECT * FROM doctor WHERE doctorName=? AND doctorPassword=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				doctor=new Doctor();
				doctor.setDoctorId(rs.getString(1));
				doctor.setDoctorName(rs.getString(2));
				doctor.setDoctorPassword(rs.getString(3));
				doctor.setDeptId(rs.getInt(4));
				doctor.setDoctorSpecial(rs.getString(5));
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return doctor;
	}
	
	
	


}
