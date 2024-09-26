import z from "https://cdn.jsdelivr.net/npm/zod@3.23.8/+esm";

const passwordRegExp = new RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,32}$/,);
const signUpSchema = z.object({
    username: z
        .string()
        .min(3, {message: "사용자 이름은 최소 3자 이상이어야 합니다."})
        .max(32, {message: "사용자 이름은 최대 32자 이하이어야 합니다."})
        .superRefine(async (val, ctx) => {
            const check = await fetch(`/auth/check-username?username=${val}`)
                .then((res) => res.text())
                .then((resText) => resText === "true");

            if (!check) {
                ctx.addIssue({
                    code: z.ZodIssueCode.custom, message: "이미 사용하고있는 사용자 이름입니다.",
                });
            }
        }), password: z.string().regex(passwordRegExp, {
        message: "비밀번호는 최소 8자에서 최대 32자, 하나 이상의 대문자, 소문자, 숫자, 특수문자(#?!@$%^&*-)를 포함해야합니다.",
    }), name: z
        .string()
        .min(2, {message: "이름은 최소 2자 이상이어야 합니다."})
        .max(16, {message: "이름은 최대 16자 이하이어야 합니다."}), tel: z
        .string()
        .min(13, {message: "전화번호는 최소 13자 이상이어야 합니다."})
        .max(14, {message: "전화번호는 최대 14자 이하이어야 합니다."}),
});

const formEl = document.getElementById("sign-up");

formEl.querySelectorAll("input").forEach((input) => {
    input.addEventListener("input", (event) => {
        const target = event.target;
        target.removeAttribute("aria-invalid");
        const helper = document.getElementById(`${target.id}-helper`);
        helper.innerHTML = "";
    });
});

formEl.addEventListener("submit", async (event) => {
    event.preventDefault();

    const formData = new FormData(event.target);
    const formObject = Object.fromEntries(formData.entries());

    const result = await signUpSchema.parseAsync(formObject).catch((err) => {
        if (err instanceof z.ZodError) {
            err.issues.forEach((zodError) => {
                const input = document.getElementById(zodError.path[0]);
                input.setAttribute("aria-invalid", true);
                const helper = document.getElementById(`${zodError.path[0]}-helper`);
                helper.innerHTML = zodError.message;
            });
        }
    });

    if (!result) {
        return;
    }

    event.target.submit();
});
