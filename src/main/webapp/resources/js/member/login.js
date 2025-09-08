document.addEventListener('DOMContentLoaded', () => {
    // 폼 요소와 라디오 버튼 그룹, 그리고 로그인 버튼을 선택합니다.
    const loginForm = document.getElementById('loginForm'); // 추가된 id로 선택
    const userTypeRadios = document.querySelectorAll('input[name="userType"]');
    const loginButton = document.querySelector('.loginBox form .loginBtn');
    const userTypeHidden = document.getElementById('userTypeHidden'); // 히든 input 필드 선택

    if (!loginForm || !loginButton || !userTypeHidden) {
        console.error("오류: 필수 HTML 요소를 찾을 수 없습니다. HTML 구조를 확인해주세요.");
        return;
    }

    // 로그인 버튼 클릭 이벤트 리스너를 추가합니다.
    loginButton.addEventListener('click', (e) => {
        let selectedUserType = null;
        for (const radio of userTypeRadios) {
            if (radio.checked) {
                selectedUserType = radio.value;
                break;
            }
        }

        // 라디오 버튼이 선택되지 않았을 경우 폼 제출을 막고 알림창을 띄웁니다.
        if (!selectedUserType) {
            alert('로그인 유형을 선택해주세요.');
            e.preventDefault();
            return;
        }

        // 폼의 action을 변경하는 대신, 히든 필드에 값을 설정합니다.
        userTypeHidden.value = selectedUserType;
    });
});