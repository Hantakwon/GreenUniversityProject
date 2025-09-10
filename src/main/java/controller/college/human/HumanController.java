package controller.college.human;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CollegeDTO;
import dto.DepartmentHeadDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;
import service.DepartmentService;

/*
 * 날짜 : 2025/09/05
 * 이름 : 한탁원
 * 내용 : 인문사회대학 이동
 */
@WebServlet("/college/human.do")
public class HumanController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	private CollegeService collegeService = CollegeService.INSTANCE;
 	private DepartmentService departmentService = DepartmentService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		/* DB Logic 추가 */
		CollegeDTO dto = collegeService.findById(1);
		List<DepartmentHeadDTO> dtoList = departmentService.findAllHeadByCollege(1);
		
		request.setAttribute("dto", dto);
		request.setAttribute("dtoList", dtoList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/college/human.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
