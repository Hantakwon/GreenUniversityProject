package controller.community.job;

import dao.community.JobDAO;
import dto.community.JobDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/community/job.do")
public class JobController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private JobDAO jobDao = new JobDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<JobDTO> jobList = jobDao.getJobList();
		
		request.setAttribute("jobList", jobList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/job.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}