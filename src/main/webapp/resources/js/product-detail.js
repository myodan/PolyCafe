const cartButton = document.getElementById("card-btn");
const buyButton = document.getElementById("buy-btn");
const amount = document.getElementById("amount").value;
const isAuth = document.getElementById("is-auth").value === "true";

cartButton.addEventListener("click", (event) => {
    if (!isAuth) {
        signInWindow();
        return;
    }
    alert("cartButton")
})

buyButton.addEventListener("click", (event) => {
    if (!isAuth) {
        signInWindow();
        return;
    }
    alert("buyButton")
})

const signInWindow = () => {
    const width = 400;
    const height = 500;
    const left = window.screenX + ((window.screen.width - width) / 2);
    const top = window.screenY + ((window.screen.height - height) / 2);

    window.open(`/auth/sign-in?popup=true`, "login_popup", `left=${left}, top=${top}, width=${width}, height=${height}`);
}