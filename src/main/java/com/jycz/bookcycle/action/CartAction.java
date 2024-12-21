package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.CartItem;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.List;

@Component("cartAction")
@Scope("prototype")
@Getter
@Setter
public class CartAction extends ActionSupport implements ModelDriven<CartItem> {
    private CartItem cartItem = new CartItem();
    private HttpSession session = ServletActionContext.getRequest().getSession();


    @Override
    public CartItem getModel() {
        return cartItem;
    }

    public String execute() {
        return SUCCESS;
    }

    public String removeItem() {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        if(items != null && cartItem != null) {
            Iterator<CartItem> iterator = items.iterator();
            while(iterator.hasNext()) {
                CartItem next = iterator.next();
                int nextId = next.getBookId();
                if(nextId == cartItem.getBookId()) {
                    iterator.remove();
                }
            }
            session.setAttribute("cart", items);
        }
        return SUCCESS;
    }
}
