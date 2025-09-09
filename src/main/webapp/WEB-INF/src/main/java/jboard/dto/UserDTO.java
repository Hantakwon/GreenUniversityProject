package jboard.dto;

import java.sql.Timestamp;

public class UserDTO {
	private String usid;
	private String pass;
	private String usName;
	private String nick;
	private String email;
	private String hp;
	private String usRole;
	private String zip;
	private String addr1;
	private String addr2;
	private String regIp;
	private String regDate;
	private String leaveDate;

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getUsName() {
		return usName;
	}

	public void setUsName(String usName) {
		this.usName = usName;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getUsRole() {
		return usRole;
	}

	public void setUsRole(String usRole) {
		this.usRole = usRole;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	@Override
	public String toString() {
		return "UserDTO [usid=" + usid + ", pass=" + pass + ", usName=" + usName + ", nick=" + nick + ", email=" + email
				+ ", hp=" + hp + ", usRole=" + usRole + ", zip=" + zip + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", regIp=" + regIp + ", regDate=" + regDate + ", leaveDate=" + leaveDate + "]";
	}
}
