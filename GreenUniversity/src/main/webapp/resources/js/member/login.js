/*
*/
document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('loginForm');
    const userTypeRadios = document.querySelectorAll('input[name="userType"]');


    loginForm.addEventListener('submit', (e) => {
        let selectedUserType = false;

        for (const radio of userTypeRadios) {
            if (radio.checked) {
                selectedUserType = true;
                break;
            }
        }

        if (!selectedUserType) {
            alert('로그인 유형을 선택해주세요.');
            e.preventDefault(); // 폼 제출을 막습니다.
        }
    });
});