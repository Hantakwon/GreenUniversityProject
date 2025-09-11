package controller.manage.lecture;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.college.CollegeDTO;
import dto.college.DepartmentDTO;
import dto.lecture.LectureDTO;
import dto.professor.ProfessorDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;
import service.DepartmentService;
import service.LectureService;
import service.ProfessorService;

/*
 * 날짜 : 2025/09/10
 * 이름 : 한탁원
 * 내용 : 강의 등록
 */
@WebServlet("/manage/lecture/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	CollegeService collegeService = CollegeService.INSTANCE;
	DepartmentService departmentService = DepartmentService.INSTANCE;
	ProfessorService professorService = ProfessorService.INSTANCE;
	LectureService lectureService = LectureService.INSTANCE;

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

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/lecture/register2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pro_id = request.getParameter("pro_id");
		String dept_id = request.getParameter("dept_id");
		String grade = request.getParameter("grade"); // String (DTO와 일치)
		String semester = request.getParameter("semester"); // 필요하면 폼에 추가
		String credit = request.getParameter("credit"); // String (DTO와 일치)
		String category = request.getParameter("category");
		String lec_name = request.getParameter("lec_name");
		String description = request.getParameter("description");
		String start_date = request.getParameter("start_date"); // yyyy-MM-dd
		String end_date = request.getParameter("end_date"); // yyyy-MM-dd
		String start_time = request.getParameter("start_time"); // HH:mm
		String end_time = request.getParameter("end_time"); // HH:mm
		String day_of_week = request.getParameter("day_of_week"); // "MON,WED,FRI"
		String evaluation = request.getParameter("evaluation");
		String textbook = request.getParameter("textbook");
		String classroom = request.getParameter("classroom");
		String max_enroll = request.getParameter("max_enrollment");

		// 2) DTO 구성 (문자열 → 타입 변환)
		LectureDTO dto = new LectureDTO();
		dto.setPro_id(Integer.parseInt(pro_id));
		dto.setDept_id(Integer.parseInt(dept_id));
		dto.setGrade(grade);
		dto.setSemester(semester); 
		dto.setCredit(credit);
		dto.setCategory(category);
		dto.setLec_name(lec_name);
		dto.setDescription(description);
		dto.setStart_date(parseSqlDate(start_date));
		dto.setEnd_date(parseSqlDate(end_date));
		dto.setStart_time(parseLocalTime(start_time));
		dto.setEnd_time(parseLocalTime(end_time));
		dto.setDay_of_week(day_of_week);
		dto.setEvaluation(evaluation);
		dto.setTextbook(textbook);
		dto.setClassroom(classroom);
		dto.setMax_enrollment(Integer.parseInt(max_enroll));

		lectureService.register(dto);

		// 4) 목록으로 이동
		response.sendRedirect("/manage/lecture/list.do");
	}

	private static Date parseSqlDate(String s) {
		try {
			return (s == null || s.isEmpty()) ? null : Date.valueOf(s); // "yyyy-MM-dd"
		} catch (Exception e) {
			return null;
		}
	}

	private static LocalTime parseLocalTime(String s) {
		try {
			return (s == null || s.isEmpty()) ? null : LocalTime.parse(s); // "HH:mm" 또는 "HH:mm:ss"
		} catch (Exception e) {
			return null;
		}
	}
}
