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
    
	/* service, logger 추가 */
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService userService = UserService.INSTANCE;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 전송 데이터 수신
		String user_id = req.getParameter("user_id");
		String user_pass = req.getParameter("user_pass");

		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_pass(user_pass);

		logger.debug(dto.toString());

		// 서비스 요청
		UserDTO userDTO = userService.findByPass(dto);

		if (userDTO != null) {
			// 회원이 맞으면 세션 저장
			HttpSession session = req.getSession();
			session.setAttribute("sessUser", userDTO);

			// 목록 이동
			resp.sendRedirect("/community/free.do"); // 임시 경로

		} else {
			// 회원이 아니면 로그인 이동
			resp.sendRedirect("/member/login.do");
		}
	}

}
