package controller.stusup.curriculum;

import java.io.IOException;
import java.util.List;

import dao.stusup.CurriculumDAO;
import dto.stusup.CurriculumDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 교과과정 정보를 처리하는 서블릿입니다.
 * URL 패턴 "/stusup/curriculum"에 대한 GET 요청을 처리합니다.
 */
@WebServlet("/stusup/curriculum.do")
public class CurriculumController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CurriculumDAO curriculumDAO;

    public void init() throws ServletException {
        // 서블릿 초기화 시 DAO 객체를 생성합니다.
        curriculumDAO = new CurriculumDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. DAO를 통해 교과과정 데이터를 조회합니다.
            List<CurriculumDTO> curriculumList = curriculumDAO.getCurriculumList();

            // 2. 조회된 데이터를 Request 속성(attribute)에 저장합니다.
            request.setAttribute("curriculumList", curriculumList);

            // 3. 교과과정 목록을 보여주는 JSP 페이지로 요청을 전달(포워딩)합니다.
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/stusup/curriculum.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "교과과정 데이터 처리 중 오류가 발생했습니다.");
        }
    }
}