package alan.zjc.register.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

import alan.zjc.register.model.Dept;
import alan.zjc.register.model.Patient;
import alan.zjc.register.service.RegisterService;
import alan.zjc.user.model.Doctor;
import alan.zjc.utils.UUIDUtils;
import net.sf.json.JSONArray;

public class RegisterAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private RegisterService registerService=null;

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	
	/**
	 * 挂号员跳转到初次挂号界面，为新患者分配病历号，并查询出所有科室信息
	 * @return
	 */
	public String gotofirstRegister(){
		registerService=new RegisterService();
		List<Dept> depts=registerService.findAllDept();
		String initDeptName=depts.get(0).getDeptName();
		List<Doctor> initDoctor=registerService.findDoctorsByDept(initDeptName);
		ValueStack vStack=ServletActionContext.getContext().getValueStack();
		vStack.set("initDoctor", initDoctor);
		vStack.set("depts", depts);
		String dignostId=UUIDUtils.getUUID();
		vStack.set("dignostId", dignostId);
		return "firstRegister";
	}
	
	public String getDoctors(){
		
		PrintWriter out=null;
		try{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			out=response.getWriter();
		registerService=new RegisterService();
		String deptName=request.getParameter("deptName");
		List<Doctor> doctors=registerService.findDoctorsByDept(deptName);
		JSONArray jsonArray=JSONArray.fromObject(doctors);
		System.out.println(jsonArray.toString());
		out.print(jsonArray);
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally {
			if(out!=null) out.close();
		}
		return NONE;
	}
	
	
	public String operateFirstRegister(){
		PrintWriter out=null;
		registerService=new RegisterService();
		try{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			out=response.getWriter();
			String dignostId=request.getParameter("dignostId");
			String patientName=request.getParameter("patientName");
			String sex=request.getParameter("sex");
			int patientAge=Integer.parseInt(request.getParameter("patientAge"));
			String patinetAddress=request.getParameter("patientAddress");
			String deptName=request.getParameter("deptName");
			String doctorName=request.getParameter("doctorName");
			int result=registerService.saveRegister(dignostId,patientName,sex,patientAge,patinetAddress,deptName,doctorName);
			if(result==0){
				out.print("registersuccess");
			}else{
				out.print("registerError");
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally {
			if(out!=null) out.close();
		}
		return NONE;
	}
	
	
	/**
	 * 复诊action
	 */
	public String gotoSecondRegister(){
		return "gotoSecondRegister";
	}
	
	public String goToSecondRegisterForm(){
		PrintWriter out=null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			registerService=new RegisterService();
			out=response.getWriter();
			String pathId=request.getParameter("pathId");
			Patient patient=registerService.findPatientByPathId(pathId);
			List<Dept> depts=registerService.findAllDept();
			ValueStack valueStack=ServletActionContext.getContext().getValueStack();
			if(patient!=null){
				request.getSession().setAttribute("existPatient", patient);
				request.getSession().setAttribute("depts", depts);
				out.print("success");
			}else{
				out.print("error");
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			if(out!=null) out.close();
		}
		return NONE;
	}
	
	
	public String operateSecondRegister(){
		PrintWriter out=null;
		registerService=new RegisterService();
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			out=response.getWriter();
			String dignostId=request.getParameter("dignostId");
			String patientName=request.getParameter("patientName");
			String sex=request.getParameter("sex");
			int patientAge=Integer.parseInt(request.getParameter("patientAge"));
			String patinetAddress=request.getParameter("patientAddress");
			String deptName=request.getParameter("deptName");
			String doctorName=request.getParameter("doctorName");
			int result=registerService.updateDignost(dignostId,doctorName);
			if(result==0){
				out.print("registersuccess");
			}else{
				out.print("registererror");
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			if(out!=null) out.close();
		}
		return NONE;
	}

}
