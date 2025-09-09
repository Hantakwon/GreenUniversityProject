package controller.manage.operate;

import java.io.IOException;
import java.util.List;

import dto.manage.LectureManageDTO;
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
		
	//목록 데이터 요청
	List<LectureManageDTO> dtoList = manageService.findAllLecture();
	req.setAttribute("dtoList", dtoList);
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/manage/operate/list.jsp");
	dispatcher.forward(req, resp);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
