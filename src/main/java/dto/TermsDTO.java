package dto;

/*
<!--
날짜 : 2025/09/11
이름 : 정순권
내용 : terms dto 작성
-->
*/
public class TermsDTO {
	private int no;
	private String terms;
	private String privacy;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	@Override
	public String toString() {
		return "TermsDTO [no=" + no + ", terms=" + terms + ", privacy=" + privacy + "]";
	}
	
	
}
