package controller.stusup.profile;
/*
날짜: 2025/09/11
이름: 장진원
내용: 프로필 컨트롤러
 */
import java.io.IOException;
import java.util.List;

import dao.stusup.ProfileDAO;
import dto.stusup.CreditStatusDTO;
import dto.stusup.ProfileDTO;
import dto.stusup.SemesterCreditDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/stusup/profile.do")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProfileDAO profileDAO;

    public void init() throws ServletException {
        profileDAO = new ProfileDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. DAO를 통해 각 학적 정보를 조회합니다.
            ProfileDTO profileInfo = profileDAO.getProfileInfo();
            CreditStatusDTO creditStatus = profileDAO.getCreditStatus();
            List<SemesterCreditDTO> semesterCreditList = profileDAO.getSemesterCredits();

            // 2. 조회된 데이터를 Request 속성(attribute)에 저장합니다.
            request.setAttribute("profileInfo", profileInfo);
            request.setAttribute("creditStatus", creditStatus);
            request.setAttribute("semesterCreditList", semesterCreditList);

            // 3. JSP 페이지로 요청을 전달(포워딩)합니다.
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/stusup/profile.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 처리 중 오류가 발생했습니다.");
        }
    }
}