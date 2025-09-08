package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

/*
 * 날짜 : -
 * 이름 : 정순권
 * 내용 : -
 */
@WebServlet("/member/check.do")
public class CheckUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService userService = UserService.INSTANCE;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String col = req.getParameter("col");
		String value = req.getParameter("value");
		
		int count = userService.getUserCount(col, value);
		
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("count", count);		
				
		// JSON 출력 - 브라우저 주소창에 http://localhost:8080/jboard/user/check.do?col=uid&value=a101 테스트 확인
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(json);
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
