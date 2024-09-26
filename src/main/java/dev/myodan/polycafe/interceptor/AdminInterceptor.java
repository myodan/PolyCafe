package dev.myodan.polycafe.interceptor;

import dev.myodan.polycafe.model.Member;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");

        if (member.getRole() != 4) {
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }

        return true;
    }

}
