package jboard.util;

public enum ResultCode {
	
	REGISTER_SUCCESSS(100, "회원가입이 완료되었습니다."),
	LOGIN_FAIL(101, "로그인 실패"),
	LOGOUT_SUCCESS(102, "로그아웃");
	
	private final int code;
	private final String message;
	
	private ResultCode(int code, String message) {
		this.code = code;
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
	
	// 코드 값으로 enum 객체 변환
	public static ResultCode fromCode(int code) {
		
		for(ResultCode rc : values()) { // values() : enum 객체의 내장 메서드로 전체 열거상수를 배열로 반환
			if(rc.code == code) {
				return rc;
			}
		}
		return null;
	};
	
}
