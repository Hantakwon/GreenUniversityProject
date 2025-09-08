package dto;

public class UserDTO {
	
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_hp;
	private String user_email;
	private String postal_code;
	private String basic_addr;
	private String detail_addr;
	private int user_type;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_hp() {
		return user_hp;
	}
	public void setUser_hp(String user_hp) {
		this.user_hp = user_hp;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public String getBasic_addr() {
		return basic_addr;
	}
	public void setBasic_addr(String basic_addr) {
		this.basic_addr = basic_addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_pass=" + user_pass + ", user_name=" + user_name + ", user_hp="
				+ user_hp + ", user_email=" + user_email + ", postal_code=" + postal_code + ", basic_addr=" + basic_addr
				+ ", detail_addr=" + detail_addr + ", user_type=" + user_type + "]";
	}
	
	
}
