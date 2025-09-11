package controller.manage.professor;

import java.io.Console;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.college.CollegeDTO;
import dto.college.DepartmentDTO;
import dto.professor.ProfessorAcademicDTO;
import dto.professor.ProfessorDTO;
import dto.professor.ProfessorRoleDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;
import service.DepartmentService;
import service.ProfessorService;

/*
 * 날짜 : 2025/09/10
 * 이름 : 한탁원
 * 내용 : 교수 등록
 */
@WebServlet("/manage/professor/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	CollegeService collegeService = CollegeService.INSTANCE;
	DepartmentService departmentService = DepartmentService.INSTANCE;
	ProfessorService professorService = ProfessorService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		List<CollegeDTO> collegeList = collegeService.findAll();
		List<DepartmentDTO> departmentList = departmentService.findAll();
		
		request.setAttribute("collegeList", collegeList);
		request.setAttribute("departmentList", departmentList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/professor/register2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String rrn = request.getParameter("rrn");
         String nameKor = request.getParameter("name_kor");
         String nameEng = request.getParameter("name_eng");
         String gender = request.getParameter("gender");
         String nationality = request.getParameter("nationality");
         String tel = request.getParameter("tel");
         String email = request.getParameter("email");
         logger.debug(email);
         String zipCode = request.getParameter("zip_code");
         String addressBasic = request.getParameter("address_basic");
         String addressDetail = request.getParameter("address_detail");
         String statement = request.getParameter("statement");
         String position = request.getParameter("position");

         // 학적 정보
         String school = request.getParameter("school");
         String major = request.getParameter("major");
         String graduationAtStr = request.getParameter("graduation_at");
         String degree = request.getParameter("degree");
         String appointmentDateStr = request.getParameter("appointment_date");

         java.sql.Date appointmentDate = toSqlDateOrNull(appointmentDateStr);
         java.sql.Date graduationAt = toSqlDateOrNull(graduationAtStr);
         
         int deptId = Integer.parseInt(request.getParameter("dept_id"));
         
         ProfessorDTO professorDto = new ProfessorDTO();
         professorDto.setRrn(rrn);
         professorDto.setName_kor(nameKor);
         professorDto.setName_eng(nameEng);
         professorDto.setGender(gender);
         professorDto.setNationality(nationality);
         professorDto.setTel(tel);
         professorDto.setEmail(email);
         professorDto.setZip_code(zipCode);
         professorDto.setAddress_basic(addressBasic);
         professorDto.setAddress_detail(addressDetail);
         professorDto.setStatement(statement);
         professorDto.setPosition(position);
         
         ProfessorAcademicDTO academicDto = new ProfessorAcademicDTO();
         academicDto.setSchool(school);
         academicDto.setMajor(major);
         academicDto.setGraduation_at(graduationAt);
         academicDto.setDegree(degree);
         academicDto.setAppointment_at(appointmentDate);
       
         ProfessorRoleDTO roleDto = new ProfessorRoleDTO();
         roleDto.setDept_id(deptId);
         
         professorService.register(professorDto, academicDto, roleDto);
         response.sendRedirect("/manage/professor/list.do");
	}
	
	private static java.sql.Date toSqlDateOrNull(String s) {
	    if (s == null || s.isBlank()) return null;
	    return java.sql.Date.valueOf(s);
	}
}
