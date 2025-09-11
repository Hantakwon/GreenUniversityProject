-- TB_Faq 테이블 생성 --
CREATE TABLE TB_Faq (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(100) NOT NULL,
    question VARCHAR(500) NOT NULL,
    answer TEXT NOT NULL,
    created_at DATETIME NOT NULL
);
-- TB_Faq Insert --

INSERT INTO TB_Faq (category, question, answer, created_at) VALUES
('휴·복학 관련', '일반휴학 연장은 몇 학기까지 가능한가요?', '휴학연장은 1회에 2학기 가능하고 총 6학기 휴학 가능합니다.', NOW()),
('휴·복학 관련', '복학하려고 하는데 어떻게 신청하나요?', '마이페이지에서 복학신청 메뉴를 통해 신청하실 수 있습니다.', NOW()),
('휴·복학 관련', '등록금 납부해서 등록 후 일반 휴학 가능한가요? 환불은 언제 되나요?', '등록금 납부 후 일반 휴학은 가능하며 환불 관련 내용은 학사 공지사항을 참고해 주세요.', NOW()),
('휴·복학 관련', '군휴학 내려면 입영통지서 말고 어떤 서류가 필요하나요?', '입영통지서 외에도 관련 부대의 휴학 승인서가 필요합니다.', NOW()),

('교과 및 학사 관련', '학과별 교과과정과 학사안내를 확인하고 싶은데, 어떻게 확인할 수 있나요?', '홈페이지 내 대학요람(대학생활 안내)를 통해 해당 입학년도, 학과 교과과정과 학사안내를 확인하세요.', NOW()),
('교과 및 학사 관련', '복수전공 취소 또는 부전공 전환 신청은 어떻게 하나요?', '마이페이지 > 복수전공 메뉴에서 신청하실 수 있습니다.', NOW()),
('교과 및 학사 관련', '수강 신청은 어떻게 하나요?', '수강신청 기간에 학사시스템에서 수강과목을 선택 후 신청하면 됩니다.', NOW()),

('수강신청 관련', '4학년 2학기에도 최소 12학점을 수강해야 하나요?', '네, 졸업 이수 요건에 따라 최소 학점 수강이 필요합니다.', NOW()),
('수강신청 관련', '9학기 이상 등록자는 수강신청학점에 따라 등록금이 달라지나요?', '9학기 이상 등록자는 등록금 기준이 다르니 학사 공지사항을 확인하세요.', NOW()),
('수강신청 관련', '수강 신청은 어떻게 하나요?', '수강신청 안내를 참고하시기 바랍니다.', NOW());

-- TB_Academic_Calendar 테이블 생성 학사 안내 -> 학사일정 --
CREATE TABLE TB_Academic_Calendar (
    id INT AUTO_INCREMENT PRIMARY KEY,     -- 고유 ID
    title VARCHAR(255) NOT NULL,           -- 일정 제목 (예: 중간고사)
    content TEXT DEFAULT NULL,             -- 상세 설명 (예: 2학기 중간고사 기간)
    start_date DATE NOT NULL,              -- 시작일 (예: 2025-09-01)
    end_date DATE NOT NULL                 -- 종료일 (예: 2025-09-05)
);
-- TB_Academic_Calendar 학사일정 데이터 추가 --
INSERT INTO TB_Academic_Calendar (title, content, start_date, end_date) VALUES
('2학기 수강신청 기간', '2025학년도 2학기 수강신청 기간입니다.', '2025-08-26', '2025-08-30'),
('수강신청 정정 기간', '수강신청 변경 및 정정 기간입니다.', '2025-09-03', '2025-09-06'),
('2학기 개강', '2025학년도 2학기 개강일입니다.', '2025-09-02', '2025-09-02'),
('중간고사 기간', '2학기 중간고사 기간입니다.', '2025-10-21', '2025-10-25'),
('기말고사 기간', '2학기 기말고사 기간입니다.', '2025-12-09', '2025-12-13'),
('성적 정정 기간', '성적 정정 신청 기간입니다.', '2025-12-16', '2025-12-18'),
('겨울방학 시작', '2025학년도 겨울방학이 시작됩니다.', '2025-12-20', '2025-12-20');

-- TB_Collegelife_Gallery 테이블 생성 - 
CREATE TABLE TB_Collegelife_Gallery (
	gno INT AUTO_INCREMENT PRIMARY KEY,          -- 게시글 고유 no (기본 키, 자동 증가)
    title VARCHAR(255) NOT NULL,                      -- 게시글 제목
    image_path VARCHAR(500) NOT NULL,                 -- 이미지 파일 경로 (서버 내의 상대 경로)
    rdcnt INT DEFAULT 0,                         	-- 조회수 (기본값 0, 방문 시마다 1 증가)
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,      -- 등록일 (게시글 생성 시 현재 시간 자동 기록)
    content TEXT,                                     -- 게시글 내용 (선택적)
    writer VARCHAR(100)                               -- 작성자 (선택적)
);

-- TB_Collegelife_Gallery 테이블 데이터 추가 - 
INSERT INTO TB_Collegelife_Gallery (title, image_path, rdcnt, reg_date, content, writer) VALUES
('제40회 1995학년도 학위수여식', '/resources/images/gallary_sample1.png', 33, '2025-02-28 10:00:00', '1995학년도 학위수여식에 대한 안내입니다.', '관리자'),
('그린대학교 2025년 신입생 모집', '/resources/images/gallary_sample2.png', 125, '2025-03-15 14:30:00', '꿈과 열정으로 가득한 신입생 여러분을 환영합니다.', '입학처'),
('IT 신기술 세미나 개최', '/resources/images/gallary_sample3.png', 88, '2025-04-01 09:00:00', '최신 IT 기술 동향과 적용 사례를 다루는 세미나입니다.', '교무처'),
('봄맞이 캠퍼스 환경 미화', '/resources/images/gallary_sample4.png', 55, '2025-04-10 16:00:00', '깨끗하고 아름다운 캠퍼스를 위한 환경 미화 활동에 참여해주세요.', '학생처'),
('그린대학교 동아리 박람회', '/resources/images/gallary_sample5.png', 210, '2025-05-05 11:00:00', '다양한 동아리를 한눈에 볼 수 있는 박람회입니다.', '학생지원팀');


INSERT INTO TB_Collegelife_Gallery (title, image_path, rdcnt, reg_date, content, writer) VALUES
('제40회 1995학년도 고양이수여식', '/resources/images/imacat1.jpg', 33, '2024-02-28 10:00:00', '1995학년도 학위수여식에 대한 안내입니다.', '관리자'),
('그린대학교 2025년 신입 고양이 모집', '/resources/images/imcat2.jpg', 125, '2024-03-15 14:30:00', '꿈과 열정으로 가득한 신입생 여러분을 환영합니다.', '입학처'),
('IT 고양이 신기술 세미나 개최', '/resources/images/imacat3.jpg', 88, '2024-04-01 09:00:00', '최신 IT 기술 동향과 적용 사례를 다루는 세미나입니다.', '교무처'),
('봄맞이 캠퍼스 고양이 관람', '/resources/images/imacat4.jpg', 55, '2024-04-10 16:00:00', '깨끗하고 아름다운 캠퍼스를 위한 환경 미화 활동에 참여해주세요.', '학생처'),
('그린대학교 고양이tb_academic_calendar 박람회', '/resources/images/imacat5.jpg', 210, '2024-05-05 11:00:00', '다양한 동아리를 한눈에 볼 수 있는 박람회입니다.', '학생지원팀');

SELECT * FROM TB_Collegelife_Gallery;