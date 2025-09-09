package jboard.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jboard.dto.UserDTO;
import jboard.util.DBHelper;
import jboard.util.Sql;

public class UserDAO extends DBHelper {
	
	private final static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}	
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
			
	public void insert(UserDTO dto) {
		
	}
	
	public UserDTO select(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER_BY_PASS);
			psmt.setString(1, dto.getUsid());
			psmt.setString(2, dto.getPass());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				UserDTO userDTO = new UserDTO();
				userDTO.setUsid(rs.getString(1));
				userDTO.setPass(rs.getString(2));
				userDTO.setUsName(rs.getString(3));
				userDTO.setNick(rs.getString(4));
				userDTO.setEmail(rs.getString(5));
				userDTO.setHp(rs.getString(6));
				userDTO.setUsRole(rs.getString(7));
				userDTO.setZip(rs.getString(8));
				userDTO.setAddr1(rs.getString(9));
				userDTO.setAddr2(rs.getString(10));
				userDTO.setRegIp(rs.getString(11));
				userDTO.setRegDate(rs.getString(12));
				userDTO.setLeaveDate(rs.getString(13));
			}
			
			closeAll();
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public List<UserDTO> selectAll() {
		return null;
	}
	
	public void update(UserDTO dto) {
		
	}
	
	public void delete(String usid) {
		
	}
}