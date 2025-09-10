package controller.academic.calander;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.academic.CalanderDAO;
import dto.academic.CalanderDTO;

/*
 * 날짜 : 2025/09/08
 * 이름 : 박효빈
 * 내용 : 학사안내 - 학사일정 컨트롤러 작업
 */
@WebServlet("/academic/calander.do")
public class CalanderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */		
		CalanderDAO dao = CalanderDAO.getInstance();
		List<CalanderDTO> calanderList = dao.selectAll(); 
		request.setAttribute("calanderList", calanderList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/academic/calander.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
