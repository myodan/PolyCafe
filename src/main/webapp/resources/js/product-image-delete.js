/** Array<HTMLButtonElement> */
const deleteButtons = Array.from(document.querySelectorAll("button.prod-img-del-btn"),);

/** @param {MouseEvent} event */
const deleteButtonOnClick = (event) => {
    if (!confirm("정말 이 상품 이미지를 삭제하시겠습니까?")) {
        return;
    }

    /** @type HTMLButtonElement */
    const target = event.currentTarget;
    const imageId = target.dataset.imageId;

    fetch(`/products/images/${imageId}`, {method: "DELETE"})
        .then((response) => {
            if (response.status === 200) {
                target.parentNode.remove();
            } else {
                alert("몰라 모르는 오류남 알아서 해결해 ㅋ");
            }
        })
        .catch(() => {
            alert("오류남 ㅅㄱ~");
        });
};

if (deleteButtons) {
    deleteButtons.forEach((button) => {
        button.addEventListener("click", deleteButtonOnClick);
    });
}
