package controller.admission.consult;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.PagenationDTO;
import dto.admission.Admission_consultDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.admission.Admission_consultService;

/*
 * 날짜 : 2025/09/05
 * 이름 : 한탁원
 * 내용 : 입학상담 이동
 */
@WebServlet("/admission/consult.do")
public class ConsultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */
	private Admission_consultService service = Admission_consultService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* DB Logic 추가 */
		
		// 요청 페이지 번호 수신
		String page = request.getParameter("page");

		// 페이지네이션 처리 요청
		PagenationDTO pagenationDTO = service.getPagenationDTO(page, null, null);

		// 글 목록 조회
		int start = pagenationDTO.getStart();
		List<Admission_consultDTO> dtoList = service.findAll(start);

		request.setAttribute("dtoList", dtoList);
		request.setAttribute("pagenationDTO", pagenationDTO);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admission/consult/consult.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
