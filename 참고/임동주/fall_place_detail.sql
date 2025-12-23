--------------------------------------------------
-- 가을 여행지 데이터 (9~11월)
--------------------------------------------------
INSERT INTO TRAVEL_PLACE VALUES
(100,'내장산 국립공원','전라북도 정읍시 내장동','10월 중순~말',
'../assets/images/fall-main.jpg',
'../assets/images/fall-main.jpg',10);

-- 9월
INSERT INTO TRAVEL_PLACE VALUES
(101,'담양 메타세쿼이아길','전라남도 담양군','9월',
'../assets/images/fall1.jpg',
'../assets/images/fall1.jpg',9);

INSERT INTO TRAVEL_PLACE VALUES
(102,'강릉 안반데기','강원도 강릉시 왕산면','9~10월',
'../assets/images/fall2.jpg',
'../assets/images/fall2.jpg',9);

-- 10월
INSERT INTO TRAVEL_PLACE VALUES
(103,'설악산 국립공원','강원도 속초시','10월',
'../assets/images/fall3.jpg',
'../assets/images/fall3.jpg',10);

-- 11월
INSERT INTO TRAVEL_PLACE VALUES
(104,'제주 오름','제주특별자치도 제주시','11월',
'../assets/images/fall4.jpg',
'../assets/images/fall4.jpg',11);

--------------------------------------------------
-- 가을 여행지 상세 설명
--------------------------------------------------

-- 담양 메타세쿼이아길
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,101,1,'담양 메타세쿼이아길은 초가을 산책에 가장 잘 어울리는 명소입니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,101,2,'직선으로 이어진 가로수가 가을 분위기를 극대화합니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,101,3,'가볍게 걷기 좋은 코스로 여행 부담이 적어요.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,101,4,'이런 분께 추천해요: 여유로운 가을 산책을 즐기고 싶은 분.');

-- 강릉 안반데기
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,102,1,'안반데기는 하늘과 가장 가까운 고원 마을로 유명합니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,102,2,'가을에는 구름과 억새 풍경이 어우러집니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,102,3,'사진 촬영과 감성 여행에 잘 어울립니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,102,4,'이런 분께 추천해요: 조용한 풍경을 좋아하는 분.');

-- 설악산
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,103,1,'설악산은 국내에서 단풍이 가장 먼저 시작되는 산입니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,103,2,'10월 중순 절정의 단풍을 감상할 수 있습니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,103,3,'트레킹과 자연 감상이 동시에 가능합니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,103,4,'이런 분께 추천해요: 가을 산행을 즐기는 분.');

-- 제주 오름
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,104,1,'제주 오름은 늦가을에 가장 차분한 매력을 보여줍니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,104,2,'완만한 코스로 부담 없이 오를 수 있어요.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,104,3,'바람과 풍경이 어우러진 힐링 여행지입니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,104,4,'이런 분께 추천해요: 조용한 가을 제주를 원하는 분.');

-- 내장산 상세 설명

INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,100,1,'내장산 국립공원은 전국 최고의 가을 단풍 명소로 손꼽힙니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,100,2,'10월 중순부터 산 전체가 붉은 단풍으로 물듭니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,100,3,'완만한 탐방로가 많아 가벼운 트레킹에 적합합니다.');
INSERT INTO TRAVEL_DESC VALUES (SEQ_DESC_ID.NEXTVAL,100,4,'이런 분께 추천해요: 가을 단풍과 자연 풍경을 모두 즐기고 싶은 분.');

COMMIT;


