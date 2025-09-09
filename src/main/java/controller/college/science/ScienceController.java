package controller.college.science;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DepartmentService;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.DepartmentHeadDTO;

/*
 * 날짜 : 2025/09/09
 * 이름 : 정순권
 * 내용 : 자연과학대학 이동
 */
@WebServlet("/college/science.do")
public class ScienceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	private DepartmentService service = DepartmentService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		/* DB Logic 추가 */
		List<DepartmentHeadDTO> dtoList = service.findAllHeadByCollege(2); // 임의의 대학번호

		request.setAttribute("dtoList", dtoList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/college/science.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
