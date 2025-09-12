package dto.admission;

import java.sql.Date;

/*
 * 날짜 : 2025-09-11
 * 이름 : 한탁원
 * 내용 : 입학안내 - 입학상담 DTO
 */
public class Admission_noticeDTO {

	private int id;
	private String title;
	private String content;
	private Date created_at;
	private int views;
	private int is_new;
	private String writer;

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

	public int getIs_new() {
		return is_new;
	}

	public void setIs_new(int is_new) {
		this.is_new = is_new;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Admission_noticeDTO [id=" + id + ", title=" + title + ", content=" + content + ", created_at="
				+ created_at + ", views=" + views + ", is_new=" + is_new + ", writer=" + writer + "]";
	}

}
