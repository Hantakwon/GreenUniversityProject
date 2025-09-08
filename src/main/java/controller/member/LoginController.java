package controller.member;

import dto.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private UserService userService = UserService.INSTANCE;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code != null) {
            String message = "로그인 오류 아이디/비밀번호를 확인하세요";
            request.setAttribute("message", message);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 전송 데이터 수신
        String user_id = request.getParameter("user_id");
        String user_pass = request.getParameter("user_pass");
        String userType = request.getParameter("userType"); // 추가된 부분

        logger.debug("user_id: " + user_id);
        logger.debug("user_pass: " + user_pass);
        logger.debug("userType: " + userType);

        UserDTO dto = new UserDTO();
        dto.setUser_id(user_id);
        dto.setUser_pass(user_pass);

        UserDTO userDTO = null;

        if ("student".equals(userType)) {
            // 학생 로그인 로직 (아직 미구현)
            // ...
        } else if ("staff".equals(userType)) {
            // 교직원 로그인 로직 (아직 미구현)
            // ...
        } else if ("general".equals(userType)) {
            // 일반인 로그인 로직: DB와 아이디/비밀번호를 비교합니다.
            userDTO = userService.findByPass(dto);
        } else {
            // userType이 없을 경우 오류 처리
            String message = "로그인 유형을 선택하세요.";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (userDTO != null) {
            HttpSession session = request.getSession();
            session.setAttribute("sessUser", userDTO);
            response.sendRedirect(request.getContextPath() + "/index.do");
        } else {
            String message = "로그인 오류 아이디/비밀번호를 확인하세요";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}