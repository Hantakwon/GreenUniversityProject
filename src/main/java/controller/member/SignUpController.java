package controller.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;

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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		userService.register(dto);
		
		resp.sendRedirect("/member/login.do");
	}

}
