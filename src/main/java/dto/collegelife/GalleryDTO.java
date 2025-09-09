package dto.collegelife;
/*
 * 날짜 : 2025-09-09
 * 이름 : 박효빈
 * 내용 : MySQL GalleryDTO 작성
 */
public class GalleryDTO {
	private int gno;
	private String title;
	private String image_path;
	private String rdcnt;
	private String reg_date;
	private String content;
	private String writer;
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(String rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
	@Override
	public String toString() {
		return "GalleryDTO [gno=" + gno + ", title=" + title + ", image_path=" + image_path + ", rdcnt=" + rdcnt
				+ ", reg_date=" + reg_date + ", content=" + content + ", writer=" + writer + "]";
	}

}
