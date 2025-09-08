package controller.member;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;


/*
 * 날짜 : -
 * 이름 : 정순권
 * 내용 : -
 */
@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService userService = UserService.INSTANCE;

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

		logger.debug("user_id: " + user_id);
		logger.debug("user_pass: " + user_pass);
		logger.debug("userType: " + userType);

		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_pass(user_pass);

		UserDTO userDTO = null;

		if ("student".equals(userType)) {
			// 학생 로그인 로직 (아직 미구현)
		} else if ("staff".equals(userType)) {
			// 교직원 로그인 로직 (아직 미구현)
		} else if ("general".equals(userType)) {
			userDTO = userService.findByPass(dto);
		}

		if (userDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", userDTO);
			response.sendRedirect(request.getContextPath() + "/college/science.do");
		} else {
			// 로그인 실패 시 세션에 메시지를 저장하고 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("message", "로그인 오류 아이디/비밀번호를 확인하세요");
			response.sendRedirect(request.getContextPath() + "/member/login.do");
		}
	}
}

