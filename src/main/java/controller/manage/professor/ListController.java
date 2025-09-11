package controller.manage.professor;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.PagenationDTO;
import dto.admission.Admission_noticeDTO;
import dto.professor.ProfessorInfoDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProfessorService;

/*
 * 날짜 : 2025/09/09
 * 이름 : 한탁원
 * 내용 : 교수 목록 이동
 */
@WebServlet("/manage/professor/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	private ProfessorService service = ProfessorService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 페이지 번호 수신
		String page = request.getParameter("page");
		
	    String searchType = request.getParameter("searchType");
	    String keyword = request.getParameter("keyword");

		// 페이지네이션 처리 요청
		PagenationDTO pagenationDTO = service.getPagenationDTO(page, searchType, keyword);

		// 글 목록 조회
		int start = pagenationDTO.getStart();
		List<ProfessorInfoDTO> dtoList = service.findInfoAll(start);
		
		/* 필요 시 DB Logic 추가 */
		request.setAttribute("dtoList", dtoList);
		request.setAttribute("pagenationDTO", pagenationDTO);
		request.setAttribute("keyword", keyword);
		request.setAttribute("searchType", searchType);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/professor/list2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
