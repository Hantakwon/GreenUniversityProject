package jboard.dto;

import java.sql.Timestamp;

public class CommentDTO {
	private int cno;
	private int ano;
	private String content;
	private String writer;
	private String regIp;
	private String wdate;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "CommentDTO [cno=" + cno + ", ano=" + ano + ", content=" + content + ", writer=" + writer + ", regIp="
				+ regIp + ", wdate=" + wdate + "]";
	}
}
