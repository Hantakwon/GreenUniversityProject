package controller.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;

/*
 * 날짜 : -
 * 이름 : 정순권
 * 내용 : -
 */
@WebServlet("/member/signup.do")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	private UserService userService = UserService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/signup.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String user_id = req.getParameter("user_id");
		String user_pass = req.getParameter("user_pass1");
		String user_name = req.getParameter("user_name");
		String user_hp = req.getParameter("user_hp");
		String user_email = req.getParameter("user_email");
		String postal_code = req.getParameter("postal_code");
		String basic_addr = req.getParameter("basic_addr");
		String detail_addr = req.getParameter("detail_addr");

		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_pass(user_pass);
		dto.setUser_name(user_name);
		dto.setUser_hp(user_hp);
		dto.setUser_email(user_email);
		dto.setPostal_code(postal_code);
		dto.setBasic_addr(basic_addr);
		dto.setDetail_addr(detail_addr);

		// logger.debug("dto: " + dto.toString());

		try {
			userService.register(dto);

			// 회원가입 성공 시 세션에 메시지 저장 후 리다이렉트
			HttpSession session = req.getSession();
			session.setAttribute("message", "회원가입이 완료되었습니다.");
			resp.sendRedirect(req.getContextPath() + "/member/login.do");

		} catch (Exception e) {
			logger.error("회원가입 중 오류 발생", e);
			resp.sendRedirect(req.getContextPath() + "/member/signup.do");
		}
	}
}
