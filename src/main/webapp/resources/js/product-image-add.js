/** @type HTMLButtonElement */
const addProductImageButton = document.getElementById("add-product-image-button");
/** @type HTMLTemplateElement */
const addProductImageTemplate = document.getElementById("add-product-image-template");
/** @type HTMLUListElement */
const productImageList = document.getElementById("product-image-list");

/** @param {MouseEvent} event */
const remove = (event) => {
    /** @type HTMLButtonElement */
    const currentEl = event.currentTarget;
    /** @type HTMLUListElement */
    const currentParentEl = currentEl.parentElement;

    currentParentEl.remove();
}

addProductImageButton.addEventListener("click", () => {
    /** @type HTMLLIElement */
    const cloneNode = addProductImageTemplate.content.cloneNode(true);
    cloneNode.querySelector("button").addEventListener("click", remove)
    productImageList.appendChild(cloneNode);
})
