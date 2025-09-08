
/*
 * 날짜 : -
 * 이름 : 정순권
 * 내용 : -
 */

document.addEventListener('DOMContentLoaded', () => {
    // 폼 요소와 라디오 버튼 그룹을 선택합니다.
    const loginForm = document.getElementById('loginForm');
    const userTypeRadios = document.querySelectorAll('input[name="userType"]');

    // 폼 제출 이벤트 리스너를 추가합니다.
    loginForm.addEventListener('submit', (e) => {

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
    });
});