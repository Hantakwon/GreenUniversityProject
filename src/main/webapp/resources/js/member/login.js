document.addEventListener('DOMContentLoaded', () => {
    // 폼 요소와 라디오 버튼 그룹, 그리고 로그인 버튼을 선택합니다.
    const loginForm = document.querySelector('.loginBox form');
    const userTypeRadios = document.querySelectorAll('input[name="userType"]');
    const loginButton = document.querySelector('.loginBox form .loginBtn');

    // 폼 또는 버튼이 존재하지 않으면 오류 메시지를 출력하고 종료합니다.
    if (!loginForm || !loginButton) {
        console.error("오류: 로그인 폼 또는 버튼을 찾을 수 없습니다. HTML 구조를 확인해주세요.");
        return;
    }

    // 로그인 버튼 클릭 이벤트 리스너를 추가합니다.
    loginButton.addEventListener('click', (e) => {
        // 선택된 라디오 버튼의 값을 찾습니다.
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
            e.preventDefault(); // 기본 동작(폼 제출)을 막습니다.
            return;
        }

        // 선택된 값에 따라 폼의 action URL을 설정하고 폼을 제출합니다.
        if (selectedUserType === 'student') {
            loginForm.action = '/student/login.do';
        } else if (selectedUserType === 'staff') {
            loginForm.action = '/staff/login.do';
        } else if (selectedUserType === 'general') {
            loginForm.action = '/general/login.do';
        }

        // 폼을 수동으로 제출합니다.
        loginForm.submit();
    });
});