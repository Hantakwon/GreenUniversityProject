package controller.admission.consult;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.admission.Admission_noticeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.admission.Admission_noticeService;

/*
 * 날짜 : 2025/09/11
 * 이름 : 한탁원
 * 내용 : 입학상담 등록
 */
@WebServlet("/admission/consult/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Admission_noticeService service = Admission_noticeService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admission/consult/register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Admission_noticeDTO dto = new Admission_noticeDTO();
		dto.setTitle(title);
		dto.setContent(content);
		
		service.register(dto);
		
		response.sendRedirect("/admission/consult.do");
	}

}
