package com.aop.test.interceptor;

import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("user")==null) {
			res.sendRedirect("/views/user/login");
			return false;
		}
		return true;
	}
}
