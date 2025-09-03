package jboard.controller.user;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jboard.dto.UserDTO;
import jboard.service.UserService;
import jboard.util.ResultCode;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService userService = UserService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String code = req.getParameter("code");
		
		if(code != null) {
			int messageCode = Integer.parseInt(code);
			ResultCode rc = ResultCode.fromCode(messageCode);
			
			String message = rc.getMessage();
			req.setAttribute("message", message);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		UserDTO dto = new UserDTO();
		dto.setUsid(uid);
		dto.setPass(pass);
		
		logger.debug(dto.toString());
		
		UserDTO userDTO = userService.findByPass(dto);
		
		if(userDTO != null) {
			HttpSession session = req.getSession();
			session.setAttribute("sessUser", userDTO);
			
			resp.sendRedirect("/jboard/article/list.do?code="+ResultCode.REGISTER_SUCCESSS.getCode());
		} else {
			resp.sendRedirect("/jboard/user/login.do?code=");
		}
		
	}

}