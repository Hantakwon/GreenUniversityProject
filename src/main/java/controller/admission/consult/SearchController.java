package controller.admission.consult;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.PagenationDTO;
import dto.admission.Admission_consultDTO;
import dto.admission.Admission_noticeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.admission.Admission_consultService;

/*
 * 날짜 : 2025/09/11
 * 이름 : 한탁원
 * 내용 : 입학상담 검색
 */
@WebServlet("/admission/consult/search.do")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Admission_consultService service = Admission_consultService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		String page = request.getParameter("page");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		PagenationDTO pagenationDTO = service.getPagenationDTO(page, searchType, keyword);
		
		int start = pagenationDTO.getStart();
		
		List<Admission_consultDTO> dtoList = service.findAllSearch(start, searchType, keyword);
		
		logger.debug(service.findAllSearch(start, searchType, keyword).toString());
		
		request.setAttribute("dtoList", dtoList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pagenationDTO", pagenationDTO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admission/consult/search.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
