package dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import util.DBHelper;
import util.Sql;

/*
 * 날짜 : 2025-09-08
 * 이름 : 정순권
 * 내용 : 회원 DAO
 */
public class UserDAO extends DBHelper {
	
	private final static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}	
	
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pass());
			psmt.setString(3, dto.getUser_name());
			psmt.setString(4, dto.getUser_hp());
			psmt.setString(5, dto.getUser_email());
			psmt.setString(6, dto.getPostal_code());
			psmt.setString(7, dto.getBasic_addr());
			psmt.setString(8, dto.getDetail_addr());
			
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectCount(String col, String value) {
		
		int count = 0;
		
		try {
			conn = getConnection();
			
			StringBuilder sql = new StringBuilder(Sql.SELECT_COUNT);
			
			if(col.equals("user_id")) {
				sql.append(Sql.WHERE_USER_ID);
			}else if(col.equals("user_email")) {
				sql.append(Sql.WHERE_EMAIL);
			}else if(col.equals("user_hp")){
				sql.append(Sql.WHERE_HP);
			}			
			psmt= conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		return count;
	}
	
	public UserDTO select(UserDTO dto) {
		
		UserDTO userDTO = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER_BY_PASS);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pass());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				userDTO = new UserDTO();
				userDTO.setUser_id(rs.getString(1));
				userDTO.setUser_pass(rs.getString(2));
				userDTO.setUser_name(rs.getString(3));
				userDTO.setUser_hp(rs.getString(4));
				userDTO.setUser_email(rs.getString(5));
				userDTO.setPostal_code(rs.getString(6));
				userDTO.setBasic_addr(rs.getString(7));
				userDTO.setDetail_addr(rs.getString(8));
				userDTO.setUser_type(rs.getString(9));
			}
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return userDTO;
	}
	
	public List<UserDTO> selectAll() {
		return null;
	}
	
	public void update(UserDTO dto) {
		
	}
	
	public void delete(String user_id) {
		
	}
}