/**
 * 회원가입 유효성 검사
 * 
 *  작업자 : 정순권
 */

const reUserId = /^[a-zA-Z0-9]{1,10}$/; // (영문, 숫자 조합, 1~10자)
const rePass = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/; // (8~16자, 영문, 숫자, 특수문자 조합)
const reName = /^[가-힣]{2,10}$/
const reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

// 유효성 검사 상태 변수
let isUser_idOk = false;
let isPassOk = false;
let isNameOk = false;
let isEmailOk = false;
let isHpOk = false;

document.addEventListener('DOMContentLoaded', function() {

	const user_idResult = document.getElementsByClassName('user_idResult')[0];
	const passResult = document.getElementsByClassName('passResult')[0];
	const nameResult = document.getElementsByClassName('nameResult')[0];
	const hpResult = document.getElementsByClassName('hpResult')[0];
	const emailResult = document.getElementsByClassName('emailResult')[0];

	const form = document.getElementsByTagName('form')[0];
	// console.log(form);

	// 아이디 검사
	form.user_id.addEventListener('focusout', function(e) {
		const value = form.user_id.value;
		// console.log(value);

		// 아이디 유효성 검사
		if (!value.match(reUserId)) {
			user_idResult.innerText = '아이디가 유효하지 않습니다.';
			user_idResult.style.color = 'red';
			isUser_idOk = false;
			return;
		}

		// 아이디 중복 검사
		fetch('/member/check.do?col=user_id&value=' + value)
			.then(res => res.json())
			.then(data => {
				console.log(data);
				if (data.count > 0) {
					user_idResult.innerText = '이미 사용중인 아이디 입니다.';
					user_idResult.style.color = 'red';
					isUser_idOk = false;
				} else {
					user_idResult.innerText = '사용 가능한 아이디 입니다.';
					user_idResult.style.color = 'green';
					isUser_idOk = true;
				}
			})
			.catch(err => {
				console.log(err);
			});
	}); // 아이디 검사 끝

	// 비밀번호 검사
	form.user_pass2.addEventListener('focusout', function(e) {

		const pw1 = form.user_pass1.value;
		const pw2 = form.user_pass2.value;

		// 비밀번호 유효성 검사
		if (!pw1.match(rePass)) {
			passResult.innerText = '비밀번호가 유효하지 않습니다.';
			passResult.style.color = 'red';
			isPassOk = false;
			return;
		}

		// 비밀번호 2회 일치 여부
		if (pw1 == pw2) {
			passResult.innerText = '비밀번호가 일치합니다.';
			passResult.style.color = 'green';
			isPassOk = true;
		} else {
			passResult.innerText = '비밀번호가 일치하지 않습니다.';
			passResult.style.color = 'red';
			isPassOk = false;
		}
	}); // 비밀번호 검사 끝

	// 이름 검사
	form.user_name.addEventListener('focusout', function(e) {

		const value = form.user_name.value;

		if (!value.match(reName)) {
			nameResult.innerText = '이름이 유효하지 않습니다.';
			nameResult.style.color = 'red';
			isNameOk = false;
		} else {
			nameResult.innerText = '';
			isNameOk = true;
		}
	}); // 이름 검사 끝

	// 휴대폰 검사
	form.user_hp.addEventListener('focusout', function(e) {
		const value = form.user_hp.value;
		// console.log(value);

		// 휴대폰 유효성 검사
		if (!value.match(reHp)) {
			hpResult.innerText = '올바른 번호를 입력해주세요.';
			hpResult.style.color = 'red';
			isHpOk = false;
			return;
		}

		// 휴대폰 중복 검사
		fetch('/member/check.do?col=user_hp&value=' + value)
			.then(res => res.json())
			.then(data => {
				console.log(data);
				if (data.count > 0) {
					hpResult.innerText = '이미 사용중인 번호 입니다.';
					hpResult.style.color = 'red';
					isHpOk = false;
				} else {
					hpResult.innerText = '사용 가능한 번호 입니다.';
					hpResult.style.color = 'green';
					isHpOk = true;
				}
			})
			.catch(err => {
				console.log(err);
			});
	}); // 휴대폰 검사 끝

	// 이메일 검사
	form.user_email.addEventListener('focusout', function(e) {
		const value = form.user_email.value;
		// console.log(value);

		// 이메일 유효성 검사
		if (!value.match(reEmail)) {
			emailResult.innerText = '이메일이 유효하지 않습니다.';
			emailResult.style.color = 'red';
			isEmailOk = false;
			return;
		}

		// 이메일 중복 검사
		fetch('/member/check.do?col=user_email&value=' + value)
			.then(res => res.json())
			.then(data => {
				console.log(data);
				if (data.count > 0) {
					emailResult.innerText = '이미 사용중인 이메일 입니다.';
					emailResult.style.color = 'red';
					isEmailOk = false;
				} else {
					emailResult.innerText = '사용 가능한 이메일 입니다.';
					emailResult.style.color = 'green';
					isEmailOk = true;
				}
			})
			.catch(err => {
				console.log(err);
			});
	}); // 이메일 검사 끝

	// 최종 폼 전송 처리
	form.addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 폼전송 해제

		if (!isUser_idOk) {
			alert('아이디를 확인하세요.');
			return;
		}

		if (!isPassOk) {
			alert('비밀번호를 확인하세요.');
			return;
		}

		if (!isNameOk) {
			alert('이름을 확인하세요.');
			return;
		}


		if (!isEmailOk) {
			alert('이메일을 확인하세요.');
			return;
		}

		if (!isHpOk) {
			alert('휴대폰을 확인하세요.');
			return;
		}

		// 최종 폼 전송 실행
		form.submit();
	});

	// 취소
	document.getElementById('cancel').addEventListener('click', () => location.href = '/member/login.do');

}); // DOM 마지막