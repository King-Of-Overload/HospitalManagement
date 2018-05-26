package alan.zjc.user.service;

import alan.zjc.user.dao.UserDao;
import alan.zjc.user.model.Doctor;
import alan.zjc.user.model.Users;

public class UserService {
	private UserDao userDao=new UserDao();

	public Users findUser(String username, String password, String office) {
		return userDao.findUser(username,password,office);
	}

	
	public Doctor findDoctor(String username, String password) {
		return userDao.findDoctor(username,password);
	}

}
