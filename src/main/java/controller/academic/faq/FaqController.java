package controller.academic.faq;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 * 날짜 : 2025/09/08
 * 이름 : 한탁원
 * 내용 : 학사안내 - 자주묻는 질문 이동
 */
@WebServlet("/academic/faq.do")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/academic/faq.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
