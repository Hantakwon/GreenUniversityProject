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
 * 내용 : 공지사항 검색
 */
@WebServlet("/academic/notice/search.do")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Academic_noticeService service = Academic_noticeService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		
		String page = request.getParameter("page");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		logger.debug(searchType + keyword);
		
		PagenationDTO pagenationDTO = service.getPagenationDTO(page, searchType, keyword);
		logger.debug(pagenationDTO.toString());
		
		int start = pagenationDTO.getStart();
		
		List<Academic_noticeDTO> dtoList = service.findAllSearch(start, searchType, keyword);
		
		request.setAttribute("dtoList", dtoList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pagenationDTO", pagenationDTO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/academic/notice/search.jsp");
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
