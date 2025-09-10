package controller.community.dataroom;

import dao.community.DataroomDAO;
import dto.community.DataroomDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/community/dataroom.do")
public class DataroomController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private DataroomDAO dataroomDao = new DataroomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<DataroomDTO> dataroomList = dataroomDao.getDataroomList();
        
        request.setAttribute("dataroomList", dataroomList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/dataroom.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
