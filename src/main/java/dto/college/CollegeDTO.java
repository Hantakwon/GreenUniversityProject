package dto.college;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class CollegeDTO {
	private int col_id; 
	private String name_kor;
	private String name_eng;
	private String title;
	private String content; 
	private String image;

	public int getCol_id() {
		return col_id;
	}

	public void setCol_id(int col_id) {
		this.col_id = col_id;
	}

	public String getName_kor() {
		return name_kor;
	}

	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}

	public String getName_eng() {
		return name_eng;
	}

	public void setName_eng(String name_eng) {
		this.name_eng = name_eng;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "CollegeDTO [col_id=" + col_id + ", name_kor=" + name_kor + ", name_eng=" + name_eng + ", title=" + title
				+ ", content=" + content + ", image=" + image + "]";
	}

}
