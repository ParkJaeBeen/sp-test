package com.sp.bdi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sp.bdi.user.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionFilter implements Filter {

    public SessionFilter() {
    	
    }
    @Override
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpSession hs = hsr.getSession();
		String uri = hsr.getRequestURI();
		UserVO user = null;
		if(hs.getAttribute("user") != null) {
			user = (UserVO) hs.getAttribute("user");
			log.debug("user : {}",user);
		}
		if(user == null && uri.indexOf("login") == -1) {
			if(uri.indexOf("/views") == 0) {
				hsr.setAttribute("msg", "로그인 해주세요");
				hsr.setAttribute("url", "/views/user/login");
				RequestDispatcher rd = request.getRequestDispatcher("/views/msg");
				rd.forward(request, response);
				return;
			}
			throw new ServletException("로그인이 필요합니다");
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
