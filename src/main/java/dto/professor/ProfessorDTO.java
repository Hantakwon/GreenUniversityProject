package dto.professor;

/*
 * 날짜 : 2025-09-08
 * 이름 : 한탁원
 * 내용 : DTO 작성 예정
 */
public class ProfessorDTO {
	private int pro_id;
	private String pro_no;
	private String rrn;
	private String name_kor;
	private String name_eng;
	private String gender;
	private String nationality;
	private String tel;
	private String email;
	private String zip_code;
	private String address_basic;
	private String address_detail;
	private String statement;
	private String position;

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getAddress_basic() {
		return address_basic;
	}

	public void setAddress_basic(String address_basic) {
		this.address_basic = address_basic;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "ProfessorDTO [pro_id=" + pro_id + ", pro_no=" + pro_no + ", rrn=" + rrn + ", name_kor=" + name_kor
				+ ", name_eng=" + name_eng + ", gender=" + gender + ", nationality=" + nationality + ", tel=" + tel
				+ ", email=" + email + ", zip_code=" + zip_code + ", address_basic=" + address_basic
				+ ", address_detail=" + address_detail + ", statement=" + statement + ", position=" + position + "]";
	}

}
