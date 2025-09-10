package controller.manage.department;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CollegeDTO;
import dto.DepartmentDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;
import service.DepartmentService;

/*
 * 날짜 : -
 * 이름 : 김수진
 * 내용 : -
 */
@WebServlet("/manage/department/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	CollegeService collegeService = CollegeService.INSTANCE;
	DepartmentService departmentService = DepartmentService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */
		List<CollegeDTO> collegeList = collegeService.findAll();
		
		request.setAttribute("collegeList", collegeList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/department/register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int colId = Integer.parseInt(request.getParameter("col_id"));
        String nameKor = request.getParameter("name_kor");
        String nameEng = request.getParameter("name_eng");
        String foundedDateStr = request.getParameter("founded_date");
        String tel = request.getParameter("tel");
        String office = request.getParameter("office");

        DepartmentDTO dto = new DepartmentDTO();
        dto.setCol_id(colId);
        dto.setName_kor(nameKor);
        dto.setName_eng(nameEng);
        if (foundedDateStr != null && !foundedDateStr.isBlank()) {
            dto.setFounded_date(Date.valueOf(LocalDate.parse(foundedDateStr)));
        }
        dto.setTel(tel);
        dto.setOffice(office);

        // 3) 등록 (dept_no는 내부에서 (col_id별) MAX+1 → LPAD 2자리로 생성)
        departmentService.register(dto);	

        // 4) 목록으로 이동
        response.sendRedirect("/manage/department/list.do");
	}

}
