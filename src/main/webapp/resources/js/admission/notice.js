// /resources/js/admission/notice.js
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('.bn-search01.type01 .b-sel-box').forEach(function (box) {
    const title  = box.querySelector('.b-sel-title');                    // "전체" 버튼
    const label  = box.querySelector('label[for="search_key"]');         // 숨김 라벨
    const hidden = box.querySelector('#search_key') || document.getElementById('search_key');
    const list   = box.querySelector('ul');

    const isOpen = () => box.classList.contains('close');                // 이 프로젝트는 open 상태가 .close
    const open   = () => { box.classList.add('close');  title?.setAttribute('aria-expanded','true'); };
    const close  = () => { box.classList.remove('close');title?.setAttribute('aria-expanded','false'); };
    const toggle = () => (isOpen() ? close() : open());

    // 접근성 속성 부여
    if (title) {
      title.setAttribute('role','button');
      title.setAttribute('tabindex','0');
      title.setAttribute('aria-haspopup','listbox');
      title.setAttribute('aria-expanded','false');
    }

    // "전체" 버튼/라벨 클릭 → 열기/닫기
    title?.addEventListener('click', function (e) { e.preventDefault(); toggle(); });
    label?.addEventListener('click', function (e) { e.preventDefault(); toggle(); });

    // 옵션 선택 → hidden 값/라벨 갱신 후 닫기
    list?.querySelectorAll('.searchOption').forEach(function (a) {
      a.addEventListener('click', function (e) {
        e.preventDefault();
        const val = a.dataset.value || '';
        const txt = a.textContent.trim();

        if (hidden) hidden.value = val;               // 검색키 반영
        if (title)  title.textContent = txt;          // 버튼 라벨 교체

        // 선택 표시 업데이트
        list.querySelectorAll('li').forEach(li => li.classList.remove('selected'));
        a.parentElement?.classList.add('selected');

        close();
      });
    });

    // 바깥 클릭 시 닫기
    document.addEventListener('click', function (e) {
      if (!box.contains(e.target)) close();
    });

    // 키보드 제어(Enter/Space 토글, Esc 닫기)
    title?.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); toggle(); }
      if (e.key === 'Escape') { e.preventDefault(); close(); }
    });
  });
});
