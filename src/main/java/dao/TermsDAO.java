package dao;

import dto.TermsDTO;
import util.DBHelper;
import util.Sql;

/*
<!--
날짜 : 2025/09/11
이름 : 정순권
내용 : terms dao 작성
-->
*/
public class TermsDAO extends DBHelper{
	private final static TermsDAO INSTANCE = new TermsDAO();
	public static TermsDAO getInstance() {
		return INSTANCE;
	}
	private TermsDAO() {}
	
public TermsDTO select(int no) {
		
		TermsDTO dto = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_TERMS);
			psmt.setInt(1, no);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new TermsDTO();
				dto.setNo(rs.getInt(1));
				dto.setTerms(rs.getString(2));
				dto.setPrivacy(rs.getString(3));
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
