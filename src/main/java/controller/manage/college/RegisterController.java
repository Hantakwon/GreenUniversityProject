package controller.manage.college;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Set;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.college.CollegeDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import service.CollegeService;

/*
 * 날짜 : 2025/09/10
 * 이름 : 한탁원
 * 내용 : 대학등록
 */
@WebServlet("/manage/college/register.do")
@MultipartConfig(
		fileSizeThreshold = 0, maxFileSize = 10 * 1024 * 1024, 
		maxRequestSize = 20 * 1024 * 1024
)
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CollegeService service = CollegeService.INSTANCE;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		final String nameKor = request.getParameter("name_kor");
		final String nameEng = request.getParameter("name_eng");
		final String title = request.getParameter("title");
		final String content = request.getParameter("content");

		// 업로드 경로 준비
		final String uploadUri = "/uploads/college"; // 웹에서 접근 경로
		final String realPath = getServletContext().getRealPath(uploadUri);
		if (realPath == null) {
			// 일부 배포환경에서 null 가능 → 필요한 경우 외부 경로로 대체
			throw new ServletException("업로드 경로 해석 실패: " + uploadUri);
		}
		Files.createDirectories(Paths.get(realPath));

		logger.debug("UPLOAD realPath = {}", getServletContext().getRealPath("/uploads/college"));

		// 파일 파트
		String imagePath = null;
		Part imagePart;
		try {
			imagePart = request.getPart("image");
		} catch (Exception e) {
			logger.warn("이미지 파트 파싱 실패(이미지 없이 등록할 수도 있음): {}", e.getMessage());
			imagePart = null;
		}

		if (imagePart != null && imagePart.getSize() > 0) {
			final String submitted = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

			// 확장자 검증
			String ext = "";
			int dot = submitted.lastIndexOf('.');
			if (dot > -1)
				ext = submitted.substring(dot).toLowerCase();

			Set<String> allow = Set.of(".jpg", ".jpeg", ".png", ".gif", ".webp");
			if (!allow.contains(ext)) {
				throw new ServletException("허용되지 않은 파일 형식입니다: " + ext);
			}

			// MIME도 한 번 체크(선택)
			String ct = imagePart.getContentType();
			if (ct == null || !ct.startsWith("image/")) {
				throw new ServletException("이미지 MIME 타입이 아닙니다: " + ct);
			}

			// 저장 파일명
			String saveName = UUID.randomUUID().toString() + ext;
			Path savePath = Paths.get(realPath, saveName);

			imagePart.write(savePath.toString());
			imagePath = uploadUri + "/" + saveName; // DB에는 상대경로 저장
		}

		// DTO 구성
		CollegeDTO dto = new CollegeDTO();
		dto.setName_kor(nameKor);
		dto.setName_eng(nameEng);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setImage(imagePath); 

		service.register(dto);

		response.sendRedirect("/manage/department/list.do");
	}
}
