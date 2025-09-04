/* app-nojq.js : 헤더 GNB(hover/focus/touch) + 푸터 클릭(토글/외부링크/스크롤) */

(function() {
	'use strict';

	// ---------- 작은 유틸 ----------
	const $ = (sel, root = document) => root.querySelector(sel);
	const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));
	const within = (el, sel) => !!(el && el.closest(sel));

	// ---------- Header: GNB ----------
	function initGNB() {
		const gnb = $('.gnb');
		if (!gnb) return;

		const wrap = $('.bottom-header-wrap') || gnb;
		const items = $$('.gnb-ul > li', gnb);
		const subs = $$('.sub-mn', gnb);

		const closeAll = () => {
			items.forEach(li => {
				li.classList.remove('is-open');
				const a = $('> a', li);
				if (a) a.classList.remove('active'), a.setAttribute('aria-expanded', 'false');
			});
			subs.forEach(ul => ul.classList.remove('is-open'));
		};

		const open = li => {
			closeAll();
			li.classList.add('is-open');
			const a = $('> a', li);
			if (a) a.classList.add('active'), a.setAttribute('aria-expanded', 'true');
			const sub = $('> .sub-mn', li);
			if (sub) sub.classList.add('is-open');
		};

		// 초기 상태
		closeAll();

		// 마우스 진입/이탈
		items.forEach(li => {
			li.addEventListener('mouseenter', () => open(li));
		});
		wrap.addEventListener('mouseleave', closeAll);

		// 키보드 접근 (탭/쉬프트탭/ESC)
		gnb.addEventListener('focusin', e => {
			const li = e.target.closest('.gnb-ul > li');
			if (li) open(li);
		});
		gnb.addEventListener('keydown', e => {
			if (e.key === 'Escape') {
				closeAll();
				const curLi = e.target.closest('.gnb-ul > li');
				const a = curLi && $('> a', curLi);
				if (a) a.focus();
			}
		});

		// 바깥 클릭 시 닫기
		document.addEventListener('mousedown', e => {
			if (!within(e.target, '.gnb')) closeAll();
		});

		// 터치: 첫 탭은 열기, 두 번째는 이동
		const touchCapable = 'ontouchstart' in window || navigator.maxTouchPoints > 0;
		if (touchCapable) {
			items.forEach(li => {
				const a = $('> a', li);
				if (!a) return;
				a.addEventListener('click', e => {
					const sub = $('> .sub-mn', li);
					if (!sub) return;       // 서브가 없으면 기본 이동
					const opened = sub.classList.contains('is-open');
					if (!opened) {          // 닫혀 있으면 열고 이동 막기
						e.preventDefault();
						open(li);
					}
				});
			});
		}
	}

	// ---------- Footer: 클릭 기능 ----------
	// 아래 3가지를 지원합니다.
	// 1) [data-footer-toggle] : 접힘/펼침 토글 (예: 회사정보, 패밀리사이트 영역 등)
	// 2) [data-url]           : 클릭 시 해당 URL 새 탭 열기
	// 3) [data-scroll-top]    : 클릭 시 맨 위로 스크롤
	function initFooter() {
		const root = document;

		// 1) 토글: [data-footer-toggle] 버튼 누르면 바로 다음 형제 요소 열고 닫기
		$$
			('[data-footer-toggle]', root).forEach(btn => {
				const iconSync = () => {
					const panel = btn.nextElementSibling;
					if (!panel) return;
					const expanded = panel.getAttribute('aria-hidden') === 'false';
					btn.setAttribute('aria-expanded', String(expanded));
				};

				// 초기 상태 세팅 (접힘 기본)
				const panel = btn.nextElementSibling;
				if (panel) {
					panel.setAttribute('aria-hidden', panel.getAttribute('aria-hidden') ?? 'true');
					panel.style.display = (panel.getAttribute('aria-hidden') === 'false') ? '' : 'none';
					btn.setAttribute('aria-controls', panel.id || (panel.id = 'ft-panel-' + Math.random().toString(36).slice(2)));
					btn.setAttribute('aria-expanded', panel.getAttribute('aria-hidden') === 'false' ? 'true' : 'false');
				}

				btn.addEventListener('click', () => {
					const p = btn.nextElementSibling;
					if (!p) return;
					const hidden = p.getAttribute('aria-hidden') !== 'false';
					p.setAttribute('aria-hidden', hidden ? 'false' : 'true');
					p.style.display = hidden ? '' : 'none';
					iconSync();
				});
			});

		// 2) 외부 링크: [data-url] 클릭 시 새 탭
		$$
			('[data-url]', root).forEach(el => {
				el.addEventListener('click', e => {
					const url = el.getAttribute('data-url');
					if (!url) return;
					// a 태그가 아니라면 기본 동작 방지
					if (el.tagName.toLowerCase() !== 'a') e.preventDefault();
					window.open(url, '_blank', 'noopener');
				});
			});

		// 3) 맨 위로: [data-scroll-top]
		$$
			('[data-scroll-top]', root).forEach(el => {
				el.addEventListener('click', e => {
					e.preventDefault();
					window.scrollTo({ top: 0, behavior: 'smooth' });
				});
			});
	}

	// ---------- 부트 ----------
	document.addEventListener('DOMContentLoaded', function() {
		initGNB();
		initFooter();
	});
})();
