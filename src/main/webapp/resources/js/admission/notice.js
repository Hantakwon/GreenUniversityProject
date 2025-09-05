document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('.bn-search01.type01 .b-sel-box').forEach(function (box) {
    const title  = box.querySelector('.b-sel-title');                     // 버튼(표시 라벨)
    const label  = box.querySelector('label[for="search_type"]');         // 숨김 라벨
    const hidden = box.querySelector('#search_type')                      // hidden: searchType
                || document.getElementById('search_type');
    const list   = box.querySelector('ul');

    const isOpen = () => box.classList.contains('close');                 // 이 프로젝트: open 상태가 .close
    const open   = () => { box.classList.add('close');  title?.setAttribute('aria-expanded','true'); };
    const close  = () => { box.classList.remove('close');title?.setAttribute('aria-expanded','false'); };
    const toggle = () => (isOpen() ? close() : open());

    // 접근성
    if (title) {
      title.setAttribute('role','button');
      title.setAttribute('tabindex','0');
      title.setAttribute('aria-haspopup','listbox');
      title.setAttribute('aria-expanded','false');
    }

    // 버튼/라벨 클릭 시 토글
    title?.addEventListener('click', e => { e.preventDefault(); toggle(); });
    label?.addEventListener('click', e => { e.preventDefault(); toggle(); });

    // 옵션 선택 → hidden 값/표시 라벨 갱신
    list?.querySelectorAll('.searchOption').forEach(function (a) {
      a.addEventListener('click', function (e) {
        e.preventDefault();
        const val = a.dataset.value || '';
        const txt = a.textContent.trim();

        if (hidden) hidden.value = val;         // searchType 전달값
        if (title)  title.textContent = txt;    // 버튼 표기 변경

        list.querySelectorAll('li').forEach(li => li.classList.remove('selected'));
        a.parentElement?.classList.add('selected');

        close();
      });
    });

    // 바깥 클릭/ESC 닫기
    document.addEventListener('click', e => { if (!box.contains(e.target)) close(); });
    title?.addEventListener('keydown', function (e) {
      if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); toggle(); }
      if (e.key === 'Escape') { e.preventDefault(); close(); }
    });
  });
});
