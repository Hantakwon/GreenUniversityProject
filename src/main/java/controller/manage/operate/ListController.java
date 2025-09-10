package controller.manage.operate;

import java.io.IOException;
import java.util.List;

import dao.PagenationDTO;
import dto.LectureManageDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ManageService;

/*
 * 날짜 :
 * 이름 : 우지희
 * 내용 : 강의목록
 */

@WebServlet("/manage/operate/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private ManageService manageService = ManageService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	// 요청 페이지 번호 수신
	String pg = req.getParameter("pg");
	
	// 페이지네이션 처리 요청
	PagenationDTO pagenationDTO = manageService.getPagenationDTO(pg, null, null);
	
	// 글 목록 조회
	int start = pagenationDTO.getStart();
	List<LectureManageDTO> dtoList = manageService.findAll();
		
	//목록 데이터 요청
	req.setAttribute("dtoList", dtoList);
	req.setAttribute("pagenationDTO", pagenationDTO);	
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/manage/operate/list.jsp");
	dispatcher.forward(req, resp);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
