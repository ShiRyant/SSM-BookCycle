package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.Seller;
import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.SellerService;
import com.jycz.bookcycle.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component("sellerAction")
@Scope("prototype")
@Getter
@Setter
public class SellerAction extends ActionSupport implements ModelDriven<Seller> {
    @Autowired
    private SellerService sellerService;

    private Seller seller = new Seller();
    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response  = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();

    @Override
    public Seller getModel() {
        return seller;
    }

    public String execute() {
        return SUCCESS;
    }

    public String registerSeller() {
        User user = (User) session.getAttribute("user");
        String userId = "";

        if(user == null) {
            Cookie[] cookies = request.getCookies();
            if(cookies != null) {
                for(Cookie cookie : cookies) {
                    if (cookie.getName().equals("userId"))
                        userId = cookie.getValue();
                    else {
                        addActionError("未登录，请先登录！");
                        return ERROR;
                    }
                }
            }
            else {
                addActionError("未登录，请先登录！");
                return ERROR;
            }
        }
        else
            userId = user.getUserId();

        if(sellerService.registerSeller(seller, userId))
            return SUCCESS;
        else {
            System.out.println(userId);
            addActionError("注册卖家失败，请重试！");
            return ERROR;
        }
    }
}
