package controller.manage.department;

import java.io.IOException;
import java.util.List;

import dto.college.DepartmentListDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DepartmentService;

/*
 * 날짜 : 2020/09/10
 * 이름 : 한탁원
 * 내용 : 학과 목록 이동
 */
@WebServlet("/manage/department/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	DepartmentService service = DepartmentService.INSTANCE;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */
		List<DepartmentListDTO> dtoList = service.findAllWithInfo();

		request.setAttribute("dtoList", dtoList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/department/list2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
