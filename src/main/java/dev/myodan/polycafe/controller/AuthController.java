package dev.myodan.polycafe.controller;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.service.MemberService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
@AllArgsConstructor
public class AuthController {

    private final static String AUTH_PATH = "auth";
    private final static String SIGN_IN_REDIRECT = "redirect:/" + AUTH_PATH + "/sign-in";
    private final static String SIGN_UP_REDIRECT = "redirect:/" + AUTH_PATH + "/sign-up";

    private final MemberService memberService;

    @GetMapping("/sign-in")
    public String showSignInForm() {
        return AUTH_PATH + "/sign-in";
    }

    @PostMapping("/sign-in")
    public String signIn(Member member, HttpSession session, RedirectAttributes redirectAttributes) {
        Member signInMember = memberService.signIn(member);
        if (signInMember == null) {
            redirectAttributes.addFlashAttribute("message", "잘못된 사용자 이름 또는 비밀번호입니다.");
            return SIGN_IN_REDIRECT;
        }
        session.setAttribute("member", signInMember);
        return "redirect:/";
    }

    @GetMapping("/sign-up")
    public String showSignUpForm() {
        return AUTH_PATH + "/sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(Member member, RedirectAttributes redirectAttributes) {
        try {
            memberService.signUp(member);
            return "redirect:/";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("member", member);
            redirectAttributes.addFlashAttribute("message", e.getMessage());
            return SIGN_UP_REDIRECT;
        }
    }

    @GetMapping("/sign-out")
    public String signOut(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/check-username")
    @ResponseBody
    public String checkUsername(String username) {
        return String.valueOf(memberService.checkUsername(username));
    }

}