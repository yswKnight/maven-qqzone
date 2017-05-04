package org.t1.qqzone.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;
/**
* @ClassName:SessionFilter
* @Description: 关于过滤器的工具类
* @author wangchao
* @date 2017-3-7 上午8:33:08 
* @version 1.0
 */
public class SessionFilter extends OncePerRequestFilter {
	//http://blog.csdn.net/geloin/article/details/7445441
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		 // 不过滤的uri  
        String[] notFilter = new String[] { "/maven-qqzone/loginuser/toindex"};  
  
        // 请求的uri
        String uri = request.getRequestURI();  
  
        // uri中包含tohome时才进行过滤 
        if (uri.indexOf("tohome") != -1) {
            // 是否过滤
            boolean doFilter = true;  
            if (doFilter) {  
                // 执行过滤  
                // 从session中获取登录者实体  
                Object obj = request.getSession().getAttribute("loginUser");  
                if (null == obj) {  
                	response.sendRedirect("/maven-qqzone/loginuser/toindex");
                } else {  
                    // 如果session中存在登录者实体，则继续  
                    filterChain.doFilter(request, response);  
                }  
            } else {  
                // 如果不执行过滤，则继续  
                filterChain.doFilter(request, response);  
            }  
        }else {
            // 如果uri中不包含tohome则继续  
            filterChain.doFilter(request, response);  
        }
    }  		
}
