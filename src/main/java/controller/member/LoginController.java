package controller.member;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

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

	/* service, logger 추가 */
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService userService = UserService.INSTANCE;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */
		String code = request.getParameter("code");

		if (code != null) {

			String message = "로그인 오류 아이디/비밀번호를 확인하세요";
			request.setAttribute("message", message);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 전송 데이터 수신
		String user_id = request.getParameter("user_id");
		String user_pass = request.getParameter("user_pass");
		String userType = request.getParameter("userType"); // 추가된 userType 값 수신

		logger.debug("user_id: " + user_id);
		logger.debug("user_pass: " + user_pass);
		logger.debug("userType: " + userType); // 콘솔에 userType이 잘 넘어오는지 확인
		
		 String hashed_pass = hashPassword(user_pass);

		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_pass(hashed_pass); // <--- 암호화된 비밀번호를 DTO에 설정

		UserDTO userDTO = null;

		// userType 값에 따라 분기 처리
		if ("student".equals(userType)) {
			// 학생 로그인 로직 구현 (예: studentService.findByPass(dto))
			// 현재는 일반인 로그인 로직과 동일하게 진행
		} else if ("staff".equals(userType)) {
			// 교직원 로그인 로직 구현
		} else if ("general".equals(userType)) {
			// 일반인 로그인 로직 구현
			userDTO = userService.findByPass(dto);
		} else {
			// userType이 없을 경우 오류 처리
			String message = "로그인 유형을 선택하세요.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
			dispatcher.forward(request, response);
			return;
		}

		// 로그인 성공/실패 처리
		if (userDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessUser", userDTO);
			response.sendRedirect(request.getContextPath() + "/college/education.do");
		} else {
			String message = "로그인 오류 아이디/비밀번호를 확인하세요";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
			dispatcher.forward(request, response);
		}

	}
	private String hashPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			byte[] byteData = md.digest();

			// 바이트를 16진수 문자열로 변환
			StringBuilder sb = new StringBuilder();
			for (byte b : byteData) {
				sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}