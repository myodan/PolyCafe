package dev.myodan.polycafe.interceptor;

import dev.myodan.polycafe.model.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");

        if (member == null) {
            response.sendRedirect(request.getContextPath() + "/auth/sign-in");
            return false;
        }

        return true;
    }
}
