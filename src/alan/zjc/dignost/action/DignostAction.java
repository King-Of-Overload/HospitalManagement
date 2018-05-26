package alan.zjc.dignost.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

import alan.zjc.dignost.model.Dignost;
import alan.zjc.dignost.service.DignostService;
import alan.zjc.register.model.Patient;
import alan.zjc.user.model.Doctor;


public class DignostAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private DignostService dignostService;
	
	private List<Patient> patients;
	
	public List<Patient> getPatients() {
		return patients;
	}

	public void setPatients(List<Patient> patients) {
		this.patients = patients;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	
	public String showAllDignost(){
		try{
			dignostService=new DignostService();
			Doctor doctor=(Doctor) request.getSession().getAttribute("sessionUser");
			String doctorName=doctor.getDoctorName();
			patients=dignostService.findAllDoctorPatient(doctorName);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return "showAllDignost";
	}
	
	public String dignosting(){
		try {
			dignostService=new DignostService();
		  String pathId=request.getParameter("pathId");
		  Patient patient=dignostService.findOnePatient(pathId);
		  ValueStack valueStack=ServletActionContext.getContext().getValueStack();
		  valueStack.set("dignostPatient", patient);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "goToDignost";
	}
	/*xmlHttp.send("pathId="+pathId+"&pathHistory="+pathHistory+"&pathAllergy="
	 * +pathAllergy+"&pathSymptom="+pathSymptom+"&pathAnalyse="+pathAnalyse);*/
	public String updateDignost(){
		PrintWriter out=null;
		dignostService=new DignostService();
		try {
			out=response.getWriter();
			String pathId=request.getParameter("pathId");
			String pathHistory=request.getParameter("pathHistory");
			String pathAllergy=request.getParameter("pathAllergy");
			String pathSymptom=request.getParameter("pathSymptom");
			String pathAnalyse=request.getParameter("pathAnalyse");
			int result=dignostService.updateDignostByDoctor(pathId,pathHistory,pathAllergy,pathSymptom,pathAnalyse);
			if(result==0){
				out.print("dignostsuccess");
			}else{
				out.print("dignosterror");
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally {
			if(out!=null) out.close();
		}
		return NONE;
	}
	
	
	public String updateDignostUI(){
		try {
			dignostService=new DignostService();
		  String pathId=request.getParameter("pathId");
		  Patient patient=dignostService.findOnePatient(pathId);
		  ValueStack valueStack=ServletActionContext.getContext().getValueStack();
		  valueStack.set("dignostPatient", patient);
		  Dignost dignost=dignostService.findDignostByPathId(pathId);
		  valueStack.set("existDignost", dignost);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "updateDignostUI";
	}

}
