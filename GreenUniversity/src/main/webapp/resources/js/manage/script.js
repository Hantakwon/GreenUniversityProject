// ---------- include ----------
function includePart(id, file){
  return fetch(file).then(r=>r.text()).then(html=>{
    const el = document.getElementById(id);
    if(el) el.innerHTML = html;
  });
}

function initMenuActive(){
  const path = location.pathname.split('/').pop();
  document.querySelectorAll('#sidebarWrap a').forEach(a=>{
    const href = a.getAttribute('href');
    if(href && href.indexOf('.html')>-1 && href===path){
      a.classList.add('active');
    }
  });
}
function colorizeStatuses(){
  document.querySelectorAll('td').forEach(td=>{
    const t = td.textContent.trim();
    if(['재학중','재직중','답변완료'].includes(t)) td.classList.add('status','ok');
    if(['휴학중','보류','대기'].includes(t)) td.classList.add('status','wait');
    if(['퇴직','제적','종료'].includes(t)) td.classList.add('status','bad');
  });
}
// optional: login gate (front에서 token 전달)
// 호출자에서 ?token=xxxxx 형태로 넘겨주면 됨
function checkLogin(){
  const p = new URLSearchParams(location.search);
  const token = p.get('token');
  // if(!token){ location.href = 'login.html'; }
  if(token){ console.log('login token ok'); }
}

window.addEventListener('DOMContentLoaded', ()=>{
  Promise.all([
    includePart('include-header','/WEB-INF/views/manage/common/header.html'),
    includePart('include-sidebar','/WEB-INF/views/manage/common/sidebar.html'),
    includePart('include-footer','/WEB-INF/views/manage/common/footer.html')
  ]).then(()=>{
    initMenuActive();
    colorizeStatuses();
    checkLogin();
  });
});
