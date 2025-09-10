package controller.manage.student;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.StudentDTO;
import dto.college.CollegeDTO;
import dto.college.DepartmentDTO;
import dto.professor.ProfessorDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;
import service.DepartmentService;
import service.ProfessorService;
import service.StudentService;

/*
 * 날짜 : 2025/09/10
 * 이름 : 한탁원
 * 내용 : 학생 등록
 */
@WebServlet("/manage/student/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	CollegeService collegeService = CollegeService.INSTANCE;
	DepartmentService departmentService = DepartmentService.INSTANCE;
	ProfessorService professorService = ProfessorService.INSTANCE;
	StudentService studentServcie = StudentService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */
		List<CollegeDTO> collegeList = collegeService.findAll();
		List<DepartmentDTO> departmentList = departmentService.findAll();
		List<ProfessorDTO> professorList = professorService.findAll();
		
		request.setAttribute("collegeList", collegeList);
		request.setAttribute("departmentList", departmentList);
		request.setAttribute("professorList", professorList);
		
		logger.debug(professorList.toString());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/student/register2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ===== 기본정보 =====
		String rrn = request.getParameter("rrn");
		String nameKor = request.getParameter("name_kor");
		String nameEng = request.getParameter("name_eng");
		String gender = request.getParameter("gender");
		String nationality = request.getParameter("nationality");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String zipCode = request.getParameter("zip_code");
		String addressBasic = request.getParameter("address_basic");
		String addressDetail = request.getParameter("address_detail");

		// ===== 학적정보 =====
		String entranceDateStr = request.getParameter("entrance_date");
		String graduateDateStr = request.getParameter("graduate_date");
		String statement = request.getParameter("statement");
		String grade = request.getParameter("grade"); // 값은 1,2,3,4
		String semester = request.getParameter("semester"); // 값은 1,2
		String category = request.getParameter("category"); // 수시, 정시, 편입 등

		// 대학, 학과, 지도교수
		int deptId = Integer.parseInt(request.getParameter("dept_id"));
		int proId = Integer.parseInt(request.getParameter("pro_id"));

		// ===== DTO 세팅 =====
		StudentDTO student = new StudentDTO();
		student.setRrn(rrn);
		student.setName_kor(nameKor);
		student.setName_eng(nameEng);
		student.setGender(gender);
		student.setNationality(nationality);
		student.setTel(tel);
		student.setEmail(email);
		student.setZip_code(zipCode);
		student.setAddress_basic(addressBasic);
		student.setAddress_detail(addressDetail);

		student.setEntrance_date(toSqlDateOrNull(entranceDateStr));
		student.setGraduate_date(toSqlDateOrNull(graduateDateStr));
		student.setStatement(statement);
		student.setGrade(grade);
		student.setSemester(semester);
		student.setCategory(category);

		student.setDept_id(deptId);
		student.setPro_id(proId);

		// ===== Service/DAO 호출 =====
		studentServcie.register(student);

		// 완료 후 리다이렉트
		response.sendRedirect("/manage/student/list.do");
	}

	// ====== 날짜 변환 유틸 ======
	private java.sql.Date toSqlDateOrNull(String s) {
		if (s == null || s.isBlank())
			return null;
		return java.sql.Date.valueOf(s);
	}

}
