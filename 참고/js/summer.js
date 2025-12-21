// ==============================
// 여름 페이지 JavaScript
// ==============================

// DOM 로드 완료 후 실행
document.addEventListener("DOMContentLoaded", function () {

    // 카드 영역
    const placeList = document.querySelector(".place-list");

    // 나중에 여름 여행지 데이터 추가 예정
    const summerPlaces = [
        // {
        //     title: "",
        //     desc: "",
        //     img: ""
        // }
    ];
    // 카드 생성 함수
    function createPlaceCard(place) {
        const card = document.createElement("div");
        card.className = "place-card";

        const imgBox = document.createElement("div");
        imgBox.className = "img-box";

        const textBox = document.createElement("div");
        textBox.className = "text-box";

        const title = document.createElement("h3");
        title.textContent = place.title;

        const desc = document.createElement("p");
        desc.textContent = place.desc;

        textBox.appendChild(title);
        textBox.appendChild(desc);

        card.appendChild(imgBox);
        card.appendChild(textBox);

        return card;
    }

    // 카드 자동 출력
    summerPlaces.forEach(place => {
        placeList.appendChild(createPlaceCard(place));
    });

});
