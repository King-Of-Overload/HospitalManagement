package alan.zjc.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import alan.zjc.user.model.Doctor;
import alan.zjc.user.model.Users;
import alan.zjc.user.service.UserService;

public class UserAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private UserService userService=null;//需要实例化
	



	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}


	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	
	/**
	 * 登录action
	 * @return
	 */
	public String login(){
		PrintWriter out=null;
		try{
		userService=new UserService();
		out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String office=request.getParameter("office");
		System.out.println(username+password+office);
		if(office.equals("挂号员")){
			Users users=userService.findUser(username,password,office);
			if(users!=null){
				request.getSession().setAttribute("sessionUser", users);
				out.print("success");
			}else{
				out.print("error");
			}
		}else if(office.equals("医生")){
			Doctor doctor=userService.findDoctor(username,password);
			if(doctor!=null){
				request.getSession().setAttribute("sessionUser", doctor);
				out.print("success");
			}else{
				out.print("error");
			}
		}
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally {
			if(out!=null) out.close();
			if(userService!=null) userService=null;
		}
		return NONE;
	}
	
	public String quit(){
		try{
		ServletActionContext.getRequest().getSession().invalidate();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return "gotoLogin";
	}
	
	public String updatePasswordUI() throws UnsupportedEncodingException{
		return "updatePasswordUI";
	}
	
	public String updatePassword() throws IOException{
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("text/html;charset=utf-8");
//		String oldPassword=request.getParameter("oldPassword");
//		String newPassword=request.getParameter("newPassword");
//		request.getSession().getAttribute("sessionUser");
		response.getWriter().print("success");
		return NONE;
	}

	

}
