package controller.academic.notice;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.academic.Academic_noticeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.academic.Academic_noticeService;

/*
 * 날짜 : 2025/09/04
 * 이름 : 한탁원
 * 내용 : 공지사항 입력
 */
@WebServlet("/academic/notice/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Academic_noticeService service = Academic_noticeService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/academic/notice/register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Academic_noticeDTO dto = new Academic_noticeDTO();
		dto.setTitle(title);
		dto.setContent(content);
		
		service.register(dto);
		
		response.sendRedirect("/academic/notice.do");
	}

}
