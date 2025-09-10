package controller.college.graduate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;
import service.DepartmentService;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.college.CollegeDTO;
import dto.college.DepartmentHeadDTO;

/*
 * 날짜 : 2025/09/05
 * 이름 : 한탁원
 * 내용 : 대학원 이동
 */
/*
 * 날짜 : 2025/09/09
 * 이름 : 정순권
 * 내용 : 대학원 이동
 */
@WebServlet("/college/graduate.do")
public class GraduateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	private DepartmentService departmentService = DepartmentService.INSTANCE;
	private CollegeService collegeService = CollegeService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		/* DB Logic 추가 */
		CollegeDTO dto = collegeService.findById(5);
		List<DepartmentHeadDTO> dtoList = departmentService.findAllHeadByCollege(5);
		
		request.setAttribute("dto", dto);
		logger.debug(dto.toString());
		
		request.setAttribute("dtoList", dtoList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/college/graduate.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
