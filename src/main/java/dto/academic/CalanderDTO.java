package dto.academic;
/*
 * 날짜 : 2025-09-08
 * 이름 : 박효빈
 * 내용 : 학사안내 - 학사일정 DTO 작성
 */
public class CalanderDTO {
	private int id;
	private String title;
	private String content;
	private String start_date;
	private String end_date;
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
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	@Override
	public String toString() {
		return "CalanderDTO [id=" + id + ", title=" + title + ", content=" + content + ", start_date=" + start_date
				+ ", end_date=" + end_date + "]";
	}
	
	

}
