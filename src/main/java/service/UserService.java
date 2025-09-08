package service;

import java.util.List;

import dao.UserDAO;
import dto.UserDTO;

/*
 * 날짜 : 2025-09-08
 * 이름 : 정순권
 * 내용 :
 */

public enum UserService {

	INSTANCE;

	private UserDAO dao = UserDAO.getInstance();

	public void register(UserDTO dto) {
		dao.insert(dto);
	}
	public int getUserCount(String col, String value) {
		return dao.selectCount(col, value);
	}	
	public UserDTO findByPass(UserDTO dto) {
		return dao.select(dto);
	}

	public List<UserDTO> findAll() {
		return dao.selectAll();
	}

	public void modify(UserDTO dto) {
		dao.update(dto);
	}

	public void remove(String user_id) {
		dao.delete(user_id);
	}
}