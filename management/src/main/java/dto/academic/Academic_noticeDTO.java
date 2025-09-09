package dto.academic;

import java.sql.Date;

/*
 * 날짜 : 2025-09-04
 * 이름 : 한탁원
 * 내용 : 학사안내 - 공지사항 DTO
 */
public class Academic_noticeDTO {

	private int id;
	private String title;
	private String content;
	private String writer;
	private Date created_at;
	private int views;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	@Override
	public String toString() {
		return "Academic_noticeDTO [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", created_at=" + created_at + ", views=" + views + "]";
	}

}
