package service;

import dao.TermsDAO;
import dto.TermsDTO;

public enum TermsService {
	INSTANCE;
	private TermsDAO dao = TermsDAO.getInstance();
	
	public TermsDTO findById(int no) {
		return dao.select(no);
	}
}
