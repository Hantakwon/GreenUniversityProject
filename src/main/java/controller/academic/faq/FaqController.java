package controller.academic.faq;

import java.io.IOException;
import java.util.List;

import dao.academic.FaqDAO;
import dto.academic.FaqDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 날짜 : 2025/09/08
 * 이름 : 박효빈
 * 내용 : 자주묻는질문 (/academic/faq.do) - 임시테이블로 구현 
 */

@WebServlet("/academic/faq.do")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */
		
		FaqDAO dao = FaqDAO.getInstance();
		List<FaqDTO> faqList = dao.selectAll();
	
		request.setAttribute("faqList", faqList);
		
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/academic/faq.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
