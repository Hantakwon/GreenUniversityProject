package controller.manage;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.OperateDTO;
import dto.academic.Academic_noticeDTO;
import dto.admission.Admission_consultDTO;
import dto.manage.index.IndexOperateDTO;
import dto.manage.index.IndexStudentSummaryByDeptDTO;
import dto.manage.index.IndexStudentSummaryByGradeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.OperateService;
import service.academic.Academic_noticeService;
import service.admission.Admission_consultService;
import service.manage.index.IndexService;

/*
 * 날짜 : 2025/09/11
 * 이름 : 한탁원
 * 내용 : 꽌리 - 메인 페이지
 */
@WebServlet("/manage/index.do")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/* service, logger 추가 */
	IndexService indexService = IndexService.INSTANCE;
	OperateService oprateService = OperateService.INSTANCE;
	Academic_noticeService academic_Noticservice = Academic_noticeService.INSTANCE;
	Admission_consultService addmission_consultService = Admission_consultService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 필요 시 DB Logic 추가 */
		IndexOperateDTO indexOperateDto = indexService.findOperate();
		List<OperateDTO> operateList = oprateService.findInfoAll(0);
		List<IndexStudentSummaryByGradeDTO> gradeSummaryList = indexService.findStudentSummaryByGrade();
		List<IndexStudentSummaryByDeptDTO> deptSummaryList = indexService.findStudentSummaryByDept();
		List<Academic_noticeDTO> academic_NoticeList = academic_Noticservice.findAll(0);
		List<Admission_consultDTO> admission_consultList = addmission_consultService.findAll(0);
		
		logger.debug(gradeSummaryList.toString());
		logger.debug(deptSummaryList.toString());
		
		request.setAttribute("operateList", operateList);
		request.setAttribute("indexOperateDto", indexOperateDto);
		request.setAttribute("gradeSummaryList", gradeSummaryList);
		request.setAttribute("deptSummaryList", deptSummaryList);
		request.setAttribute("academic_NoticeList", academic_NoticeList);
		request.setAttribute("admission_consultList", admission_consultList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/manage/index2.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
