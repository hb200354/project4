/* =================================================
 가을(fall) 여행지 데이터 전체 INSERT
 destinations + destination_images
================================================= */

/* =========================
 1️⃣ destinations (여행지)
========================= */

-- 9월 대표
INSERT INTO destinations
(season_id, month, title, short_desc, location, visit_season, is_featured)
VALUES ('fall', 9, '담양 메타세쿼이아길', '초가을 산책 감성 코스', '전남 담양', '9월', 1);

INSERT INTO destinations VALUES (DEFAULT,'fall',9,'강릉 안반데기','고원 풍경 감성','강릉','9월',0);
INSERT INTO destinations VALUES (DEFAULT,'fall',9,'하늘공원','가을풀·노을','서울','9월',0);
INSERT INTO destinations VALUES (DEFAULT,'fall',9,'순천만습지','갈대가 물드는 계절','전남 순천','9월',0);

-- 10월 대표
INSERT INTO destinations
(season_id, month, title, short_desc, location, visit_season, is_featured)
VALUES ('fall', 10, '내장산 국립공원', '전국 최고의 단풍 명소', '전북 정읍', '10월', 1);

INSERT INTO destinations VALUES (DEFAULT,'fall',10,'설악산 국립공원','단풍 시작','강원 인제','10월',0);
INSERT INTO destinations VALUES (DEFAULT,'fall',10,'문경새재','고갯길 트레킹','경북 문경','10월',0);
INSERT INTO destinations VALUES (DEFAULT,'fall',10,'주왕산 국립공원','계곡 단풍','경북 청송','10월',0);

-- 11월 대표
INSERT INTO destinations
(season_id, month, title, short_desc, location, visit_season, is_featured)
VALUES ('fall', 11, '백양사', '늦가을 단풍 사찰', '전남 장성', '11월', 1);

INSERT INTO destinations VALUES (DEFAULT,'fall',11,'제주 오름','늦가을 트레킹','제주도','11월',0);
INSERT INTO destinations VALUES (DEFAULT,'fall',11,'남이섬','가을 산책','강원 춘천','11월',0);
INSERT INTO destinations VALUES (DEFAULT,'fall',11,'경주 불국사','따뜻한 분위기','경주','11월',0);


/* =========================
 2️⃣ destination_images (이미지)
========================= */

INSERT INTO destination_images (destination_id, image_url, description)
SELECT id, '../통합/assets/images/fall-damyang-metasequoia.jpg', '담양 메타세쿼이아길'
FROM destinations WHERE title='담양 메타세쿼이아길';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-anbandae.jpg', '강릉 안반데기'
FROM destinations WHERE title='강릉 안반데기';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-haneul-park.jpg', '하늘공원'
FROM destinations WHERE title='하늘공원';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-suncheonman.jpg', '순천만습지'
FROM destinations WHERE title='순천만습지';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-seoraksan.jpg', '설악산 국립공원'
FROM destinations WHERE title='설악산 국립공원';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-naejangsan.jpg', '내장산 국립공원'
FROM destinations WHERE title='내장산 국립공원';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-mungyeong-saejae.jpg', '문경새재'
FROM destinations WHERE title='문경새재';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-juwangsan.jpg', '주왕산 국립공원'
FROM destinations WHERE title='주왕산 국립공원';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-baekyangsa.jpg', '백양사'
FROM destinations WHERE title='백양사';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-jeju-oreum.jpg', '제주 오름'
FROM destinations WHERE title='제주 오름';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-namiseom.jpg', '남이섬'
FROM destinations WHERE title='남이섬';

INSERT INTO destination_images
SELECT id, '../통합/assets/images/fall-bulguksa.jpg', '경주 불국사'
FROM destinations WHERE title='경주 불국사';
