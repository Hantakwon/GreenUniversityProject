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
		

		UserDTO userDTO = null;
		StudentDTO stdDTO = null;
		ProfessorDTO profDTO = null;

		if ("student".equals(userType)) {
            // student 타입일 때만 studentDTO 객체 생성
            StudentDTO student = new StudentDTO();
            student.setStd_id(Integer.parseInt(user_id)); // String을 숫자로 변환
            student.setRrn(clean_pass);
            stdDTO = studentService.findByPass(student);
        } else if ("staff".equals(userType)) {
            // staff 타입일 때만 professorDTO 객체 생성
            ProfessorDTO professor = new ProfessorDTO();
            professor.setPro_id(user_id);
            professor.setRrn(clean_pass);
            profDTO = professorService.findByPass(professor);
        } else if ("general".equals(userType)) {
            userDTO = userService.findByPass(user);
        }


		
		if (userDTO != null) {
			if("admin".equals(userDTO.getUser_id())) { // 관리자 계정일경우 학사관리로 이동 admin / admin123!
				HttpSession session = request.getSession();
				session.setAttribute("sessUser", userDTO);
				response.sendRedirect(request.getContextPath() + "/manage/index.do?admin");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("sessUser", userDTO);
				response.sendRedirect(request.getContextPath() + "/");
			}
		} else if(stdDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", stdDTO);
			response.sendRedirect(request.getContextPath() + "/");
		} else if(profDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", profDTO);
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			// 로그인 실패 시 리다이렉트
			response.sendRedirect(request.getContextPath() + "/member/login.do?fail");
		}
	}
}
