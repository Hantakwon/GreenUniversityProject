package controller.college.science;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 날짜 : 2025/09/05
 * 이름 : 한탁원
 * 내용 : 자연과학대학 이동
 */
@WebServlet("/college/science.do")
public class ScienceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		/* DB Logic 추가 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/college/science.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
