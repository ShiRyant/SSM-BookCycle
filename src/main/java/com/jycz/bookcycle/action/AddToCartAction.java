package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.CartItem;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Base64;

@Getter
@Setter
public class AddToCartAction extends ActionSupport implements ModelDriven<CartItem> {
    private HttpServletResponse response = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();

    private CartItem cartItem = new CartItem();
    private List<CartItem> cartItemList;

    @Override
    public String execute() {
        if(session.getAttribute("cart") == null) {
            cartItemList = new ArrayList<>();
        } else {
            cartItemList = (List<CartItem>) session.getAttribute("cart");
        }
        cartItemList.add(cartItem);
        session.setAttribute("cart", cartItemList);
//        Cookie cartCookie = new Cookie("cart", cartItemList.toString());
//        cartCookie.setPath("/");
//        cartCookie.setMaxAge(60 * 60 * 24 * 7);
//        response.addCookie(cartCookie);

        return SUCCESS;
    }

    @Override
    public CartItem getModel() {
        return cartItem;
    }
}
