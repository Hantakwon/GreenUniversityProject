package notice_test3.dto;

public class NoticeDTO {
	
	private int id;
	private String title;
	private String content;
	private String created_at;
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
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
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
		return "ArticleDTO [id=" + id + ", title=" + title + ", content=" + content + ", created_at=" + created_at
				+ ", views=" + views + "]";
	}
	
	

}
