package controller.academic.notice;

import java.io.IOException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import src.main.java.dao.PagenationDTO;
import src.main.java.dto.academic.Academic_noticeDTO;
import src.main.java.service.academic.Academic_noticeService;

/*
 * 날짜 : 2025/09/04
 * 이름 : 한탁원
 * 내용 : 공지사항 출력
 */
@WebServlet("/academic/notice.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	private Academic_noticeService service = Academic_noticeService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		
		// 요청 페이지 번호 수신
		String page = request.getParameter("page");
		
		// 페이지네이션 처리 요청
		PagenationDTO pagenationDTO = service.getPagenationDTO(page, null, null);
				
		// 글 목록 조회
		int start = pagenationDTO.getStart();
		List<Academic_noticeDTO> dtoList = service.findAll(start);

		request.setAttribute("dtoList", dtoList);
		request.setAttribute("pagenationDTO", pagenationDTO);		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/academic/notice/notice.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
