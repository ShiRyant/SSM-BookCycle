package com.jycz.bookcycle.filter;

import javax.servlet.*;
import javax.servlet.http.*;

import com.jycz.bookcycle.model.CartItem;
import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.UserService;
import lombok.Setter;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Setter
public class AutoLoginFilter implements Filter {

    private UserService userService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        Cookie[] cookies = request.getCookies();
        List<CartItem> cartItems = new ArrayList<>();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if("userId".equals(cookie.getName())) {
                    String userId = cookie.getValue();
                    try {
                        User user = userService.getUser(userId);
                        if(user != null) {
                            request.getSession().setAttribute("user", user);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
//                if("cart".equals(cookie.getName())) {
//                    String cartData = cookie.getValue();
//                    System.out.println(cartData);
//                    cartItems = parseCartData(cartData);
//                    request.getSession().setAttribute("cart", cartItems);
//                    break;
//                }
            }
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
