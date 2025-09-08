package dto.academic;

public class FaqDTO {
	
	private int id;
	private String category;
	private String question;
	private String answer;
	private String created_at;
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getCreated_at() {
		return created_at;
	}
	@Override
	public String toString() {
		return "FaqDTO [id=" + id + ", category=" + category + ", question=" + question + ", answer=" + answer
				+ ", created_at=" + created_at + "]";
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}
