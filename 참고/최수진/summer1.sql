--------------------------------------------------
-- 0. 기존 테이블/시퀀스 삭제
--------------------------------------------------
DROP TABLE PLACE_TIPS CASCADE CONSTRAINTS;
DROP TABLE PLACE_SEASONS CASCADE CONSTRAINTS;
DROP TABLE PLACES CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_PLACE_SEASON_ID;
DROP SEQUENCE SEQ_PLACE_TIP_ID;

--------------------------------------------------
-- 1. PLACES (여행지 마스터)
--------------------------------------------------
CREATE TABLE PLACES (
  PLACE_ID     VARCHAR2(50) PRIMARY KEY,
  TITLE        VARCHAR2(100) NOT NULL,
  LOCATION     VARCHAR2(200),
  BANNER_IMG   VARCHAR2(255),
  LIST_IMG     VARCHAR2(255),
  SEASON_NOTE  VARCHAR2(100)
);

--------------------------------------------------
-- 2. PLACE_SEASONS (월 / 메인 매핑)
--------------------------------------------------
CREATE TABLE PLACE_SEASONS (
  SEASON_ID    NUMBER PRIMARY KEY,
  PLACE_ID     VARCHAR2(50) NOT NULL,
  SEASON_TYPE  VARCHAR2(20),
  MONTH_VAL    NUMBER(2),
  IS_FEATURED  CHAR(1),
  CONSTRAINT FK_PS_PLACE
    FOREIGN KEY (PLACE_ID)
    REFERENCES PLACES(PLACE_ID)
);

CREATE SEQUENCE SEQ_PLACE_SEASON_ID
START WITH 1 INCREMENT BY 1;

--------------------------------------------------
-- 3. PLACE_TIPS (상세 가이드)
--------------------------------------------------
CREATE TABLE PLACE_TIPS (
  TIP_ID     NUMBER PRIMARY KEY,
  PLACE_ID   VARCHAR2(50) NOT NULL,
  ORDER_NO   NUMBER(2),
  CONTENT    VARCHAR2(1000),
  CONSTRAINT FK_PT_PLACE
    FOREIGN KEY (PLACE_ID)
    REFERENCES PLACES(PLACE_ID)
);

CREATE SEQUENCE SEQ_PLACE_TIP_ID
START WITH 1 INCREMENT BY 1;

--------------------------------------------------
-- 4. PLACES 데이터 (총 12개)
--------------------------------------------------
-- 6월
INSERT INTO PLACES VALUES ('gangneung','강릉 경포대','강원도 강릉시 안현동','/assets/images/summer-main.jpg','/assets/images/summer-main.jpg','6월 초·중순');
INSERT INTO PLACES VALUES ('haeundae','부산 해운대','부산광역시 해운대구 우동','/assets/images/summer1.jpg','/assets/images/summer1.jpg','6월 중순~7월 초');
INSERT INTO PLACES VALUES ('heungjeong','평창 흥정계곡','강원도 평창군 봉평면','/assets/images/summer2.jpg','/assets/images/summer2.jpg','6월~8월');
INSERT INTO PLACES VALUES ('hyeopjae','제주 협재해변','제주특별자치도 제주시 한림읍','/assets/images/summer3.jpg','/assets/images/summer3.jpg','6월 초~7월 초');

-- 7월
INSERT INTO PLACES VALUES ('sangso','대전 상소동 산림욕장','대전광역시 동구 산내동','/assets/images/July1.jpg','/assets/images/July2.jpg','7월');
INSERT INTO PLACES VALUES ('yukbaek','평창 육백마지기','강원도 평창군 미탄면','/assets/images/July3.jpg','/assets/images/July3.jpg','7월~8월');
INSERT INTO PLACES VALUES ('ulleung','울릉도','경상북도 울릉군','/assets/images/July4.jpg','/assets/images/July4.jpg','7월~9월');
INSERT INTO PLACES VALUES ('hajodae','양양 하조대해수욕장','강원도 양양군 현북면','/assets/images/July5.jpg','/assets/images/July5.jpg','7월');

-- 8월
INSERT INTO PLACES VALUES ('pinocchio','가평 피노키오와 다빈치','경기도 가평군 청평면','/assets/images/August1.jpg','/assets/images/August2.jpg','8월');
INSERT INTO PLACES VALUES ('jangho','삼척 장호항','강원도 삼척시 근덕면','/assets/images/August3.jpg','/assets/images/August3.jpg','7월~9월');
INSERT INTO PLACES VALUES ('morningcalm','아침고요수목원','경기도 가평군 상면','/assets/images/August4.jpg','/assets/images/August4.jpg','8월');
INSERT INTO PLACES VALUES ('sunflower','태백 해바라기축제','강원도 태백시','/assets/images/August5.jpg','/assets/images/August5.jpg','8월 중순~말');

--------------------------------------------------
-- 5. PLACE_SEASONS (월 + 메인 배너)
--------------------------------------------------
-- 6월
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'gangneung','summer',6,'Y');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'haeundae','summer',6,'N');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'heungjeong','summer',6,'N');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'hyeopjae','summer',6,'N');

-- 7월
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'sangso','summer',7,'Y');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'yukbaek','summer',7,'N');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'ulleung','summer',7,'N');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'hajodae','summer',7,'N');

-- 8월
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'pinocchio','summer',8,'Y');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'jangho','summer',8,'N');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'morningcalm','summer',8,'N');
INSERT INTO PLACE_SEASONS VALUES (SEQ_PLACE_SEASON_ID.NEXTVAL,'sunflower','summer',8,'N');

--------------------------------------------------
-- 6. PLACE_TIPS (12곳 전체)
--------------------------------------------------
-- 강릉 경포대
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'gangneung',1,'강릉 경포대는 초여름 바다 분위기를 가장 먼저 느낄 수 있는 대표 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'gangneung',2,'6월에는 성수기 전이라 비교적 한적해 산책과 휴식 위주의 여행을 즐기기 좋아요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'gangneung',3,'해변 산책로와 주변 카페, 맛집까지 동선이 깔끔하게 이어집니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'gangneung',4,'이런 분께 추천해요: 여유로운 바다 산책과 힐링을 원하는 분.');

-- 부산 해운대
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'haeundae',1,'해운대는 여름을 대표하는 국내 최고의 해변 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'haeundae',2,'바다, 먹거리, 야경을 한 번에 즐길 수 있어 여행 만족도가 높아요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'haeundae',3,'6월에는 본격적인 성수기 전이라 비교적 여유로운 편입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'haeundae',4,'이런 분께 추천해요: 여름 분위기를 제대로 느끼고 싶은 분.');

-- 평창 흥정계곡
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'heungjeong',1,'흥정계곡은 한여름에도 시원함을 느낄 수 있는 계곡 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'heungjeong',2,'물이 맑고 주변이 조용해 휴식 중심 여행에 잘 어울려요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'heungjeong',3,'바다보다 계곡을 선호하는 분들에게 특히 추천됩니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'heungjeong',4,'이런 분께 추천해요: 조용한 자연 속에서 쉬고 싶은 분.');

-- 제주 협재해변
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hyeopjae',1,'협재해변은 에메랄드빛 바다로 유명한 제주 서쪽 대표 해변입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hyeopjae',2,'수심이 얕아 산책과 가벼운 물놀이 모두 즐기기 좋아요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hyeopjae',3,'근처 카페와 해변 산책 코스가 잘 어우러져 있습니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hyeopjae',4,'이런 분께 추천해요: 한적한 제주 바다를 좋아하는 분.');

-- 대전 상소동 산림욕장
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sangso',1,'상소동 산림욕장은 한여름에도 그늘이 많아 시원한 숲 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sangso',2,'무리 없는 산책 코스가 잘 조성돼 있어 부담 없이 걸을 수 있어요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sangso',3,'도심과 가까워 당일치기 힐링 여행으로 좋습니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sangso',4,'이런 분께 추천해요: 조용한 숲길 산책을 좋아하는 분.');

-- 평창 육백마지기
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'yukbaek',1,'육백마지기는 탁 트인 초원 풍경이 인상적인 고지대 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'yukbaek',2,'여름에도 바람이 불면 비교적 시원하게 느껴져요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'yukbaek',3,'사진 찍기 좋은 장소로 감성 여행에 잘 어울립니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'yukbaek',4,'이런 분께 추천해요: 넓은 풍경을 보며 기분 전환하고 싶은 분.');

-- 울릉도
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'ulleung',1,'울릉도는 섬 특유의 청량한 풍경이 매력적인 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'ulleung',2,'이동 과정 자체가 여행의 일부가 되는 곳이에요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'ulleung',3,'자연 풍경 위주의 여행을 선호하는 분들에게 추천됩니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'ulleung',4,'이런 분께 추천해요: 특별한 섬 여행을 경험하고 싶은 분.');

-- 양양 하조대해수욕장
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hajodae',1,'하조대해수욕장은 탁 트인 바다 풍경이 시원한 해변입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hajodae',2,'관광지 느낌이 과하지 않아 비교적 여유로운 편이에요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hajodae',3,'여름 밤 산책 코스로도 잘 어울립니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'hajodae',4,'이런 분께 추천해요: 한적한 동해 바다를 좋아하는 분.');

-- 가평 피노키오와 다빈치
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'pinocchio',1,'피노키오와 다빈치는 걷고 구경하는 감성 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'pinocchio',2,'동화와 예술 콘셉트 공간이 많아 사진 찍기 좋아요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'pinocchio',3,'8월 평일 방문 시 비교적 여유롭게 즐길 수 있습니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'pinocchio',4,'이런 분께 추천해요: 가볍게 산책하며 여행하고 싶은 분.');

-- 삼척 장호항
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'jangho',1,'장호항은 바다색이 유난히 맑아 보이는 항구 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'jangho',2,'투명한 바다와 항구 풍경이 잘 어우러져 있어요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'jangho',3,'사람이 몰리는 시간을 피하면 더욱 여유롭습니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'jangho',4,'이런 분께 추천해요: 조용한 바다 풍경을 좋아하는 분.');

-- 아침고요수목원
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'morningcalm',1,'아침고요수목원은 여름에 초록이 가장 짙어지는 정원 여행지입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'morningcalm',2,'산책 동선이 잘 정리돼 있어 천천히 걷기 좋아요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'morningcalm',3,'자극적이지 않은 힐링 여행에 잘 어울립니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'morningcalm',4,'이런 분께 추천해요: 차분한 자연 산책을 원하는 분.');

-- 태백 해바라기축제
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sunflower',1,'해바라기축제는 여름의 끝자락을 느낄 수 있는 시즌 여행입니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sunflower',2,'노란 해바라기 밭이 한눈에 펼쳐져 사진 명소로 유명해요.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sunflower',3,'축제 특유의 분위기를 가볍게 즐기기 좋습니다.');
INSERT INTO PLACE_TIPS VALUES (SEQ_PLACE_TIP_ID.NEXTVAL,'sunflower',4,'이런 분께 추천해요: 계절감 있는 여행을 좋아하는 분.');

--------------------------------------------------
COMMIT;