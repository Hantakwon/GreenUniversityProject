package controller.member;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.StudentDTO;
import dto.UserDTO;
import dto.professor.ProfessorDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.ProfessorService;
import service.StudentService;
import service.UserService;

/*
 * 날짜 : 09/09
 * 이름 : 정순권
 * 내용 : 학생,교수 로그인 작업
 */
@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService userService = UserService.INSTANCE;
	private StudentService studentService = StudentService.INSTANCE;
	private ProfessorService professorService = ProfessorService.INSTANCE;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 세션에서 메시지를 가져옵니다.
		HttpSession session = request.getSession();
		String message = (String) session.getAttribute("message");

		// 메시지가 있으면 request에 담고, 세션에서는 제거합니다.
		if (message != null) {
			request.setAttribute("message", message);
			session.removeAttribute("message");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id");
		String user_pass = request.getParameter("user_pass");
		String userType = request.getParameter("userType");

		 String clean_pass = user_pass.replace("-", ""); 
		
		logger.debug("user_id: " + user_id);
		logger.debug("user_pass: " + user_pass);
		logger.debug("userType: " + userType);

		UserDTO user = new UserDTO();
		user.setUser_id(user_id);
		user.setUser_pass(user_pass);
		
		StudentDTO student = new StudentDTO();
		student.setStd_id(user_id);
		student.setRrn(clean_pass);
		
		
		ProfessorDTO professor = new ProfessorDTO();
		professor.setPro_id(user_id);
		professor.setRrn(clean_pass);

		UserDTO userDTO = null;
		StudentDTO stdDTO = null;
		ProfessorDTO profDTO = null;

		if ("student".equals(userType)) {
			stdDTO = studentService.findByPass(student);
		} else if ("staff".equals(userType)) {
			profDTO = professorService.findByPass(professor);
		} else if ("general".equals(userType)) {
			userDTO = userService.findByPass(user);
		}

		
		if (userDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", userDTO);
			response.sendRedirect(request.getContextPath() + "/college/science.do?user");
		} else if(stdDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", stdDTO);
			response.sendRedirect(request.getContextPath() + "/college/human.do?std");
		} else if(profDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", profDTO);
			response.sendRedirect(request.getContextPath() + "/college/graduate.do?prof");
		} else {
			// 로그인 실패 시 세션에 메시지를 저장하고 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("message", "로그인 오류 아이디/비밀번호를 확인하세요");
			response.sendRedirect(request.getContextPath() + "/member/login.do?fail");
		}
	}
}
