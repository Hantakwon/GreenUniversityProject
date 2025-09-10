package controller.manage.student;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.PagenationDTO;
import dto.StudentListDTO;
import dto.professor.ProfessorInfoDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.StudentService;

/*
 * 날짜 : 2025/09/10
 * 이름 : 한탁원
 * 내용 : 학생 목록
 */
@WebServlet("/manage/student/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	StudentService service = StudentService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 페이지 번호 수신
		String page = request.getParameter("page");

		// 페이지네이션 처리 요청
		PagenationDTO pagenationDTO = service.getPagenationDTO(page, null, null);

		// 글 목록 조회
		int start = pagenationDTO.getStart();
		List<StudentListDTO> dtoList = service.findInfoAll(start);
		
		/* 필요 시 DB Logic 추가 */	
		request.setAttribute("dtoList", dtoList);
		request.setAttribute("pagenationDTO", pagenationDTO);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/student/list2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
