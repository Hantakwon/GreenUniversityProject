package dto.admission;

import java.sql.Date;

/*
 * 날짜 : 2025-09-05
 * 이름 : 한탁원
 * 내용 : 입학안내 - 공지사항 DTO
 */
public class Admission_consultDTO {

	private int id;
	private String category;
	private String title;
	private String writer;
	private String content;
	private Date created_at;
	private Boolean is_answered;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public Boolean getIs_answered() {
		return is_answered;
	}

	public void setIs_answered(Boolean is_answered) {
		this.is_answered = is_answered;
	}

	@Override
	public String toString() {
		return "Admission_noticeDTO [id=" + id + ", category=" + category + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", created_at=" + created_at + ", is_answered=" + is_answered + "]";
	}

}
