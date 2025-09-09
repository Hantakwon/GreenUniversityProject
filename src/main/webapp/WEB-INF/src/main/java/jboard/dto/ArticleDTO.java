package jboard.dto;

import java.sql.Timestamp;

public class ArticleDTO {
	private int ano; // 글 번호
	private String cate; // 카테고리 (free, notice 등)
	private String title; // 제목
	private String content; // 내용
	private int commentCnt; // 댓글 수
	private int fileCnt; // 파일 첨부 수
	private int hitCnt; // 조회 수
	private String writer; // 작성자 ID
	private String regIp; // 작성자 IP
	private String wdate; // 작성일

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public int getFileCnt() {
		return fileCnt;
	}

	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}

	public int getHitCnt() {
		return hitCnt;
	}

	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
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
		return "ArticleDTO [ano=" + ano + ", cate=" + cate + ", title=" + title + ", content=" + content
				+ ", commentCnt=" + commentCnt + ", fileCnt=" + fileCnt + ", hitCnt=" + hitCnt + ", writer=" + writer
				+ ", regIp=" + regIp + ", wdate=" + wdate + "]";
	}
}
