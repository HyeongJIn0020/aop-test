package com.aop.test.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthInterceptor implements HandlerInterceptor{
	private boolean isAjax(HttpServletRequest req) {
		return req.getHeader("x-requested-with")!=null;
	}
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("user")==null) {
			if(isAjax(req)) {
				res.setContentType("application/json;charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.write("{\"result\":\"fail\",\"msg\":\"로그인이 필요합니다.\"}");
				res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			} else {
				res.sendRedirect("/views/user/login");
			}
			return false;
		}
		return true;
	}
}
