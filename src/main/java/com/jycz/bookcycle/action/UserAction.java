package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.UserService;
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

@Component("userAction")
@Scope("prototype")
@Getter
@Setter
public class UserAction extends ActionSupport implements ModelDriven<User>{
    @Autowired
    private UserService userService;

    private User user = new User();
    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response  = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();

    public User getModel() {
        return user;
    }

    public String userLogin(){
        User loginUser = userService.login(user);

        if(user == null)
            return "error";

        user.setUserId(loginUser.getUserId());
        user.setUsername(loginUser.getUsername());
        user.setPhoneNumber(loginUser.getPhoneNumber());
        user.setEmail(loginUser.getEmail());
        user.setRegisterTime(loginUser.getRegisterTime());

        session.setAttribute("user", user);

        Cookie cookie = new Cookie("userId", user.getUserId());
        cookie.setPath("/");
        cookie.setMaxAge(7 * 24 * 3600);
        response.addCookie(cookie);

        return "success";
    }

    public String userRegister(){
        String state = userService.register(user);
        if("failed".equals(state))
            return "error";
        else
            return "success";
    }

    public String userLogout() {
        Cookie cookie = new Cookie("userId", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        session.invalidate();
        return "logout";
    }

    public String userDataView(){
        String userId = request.getParameter("userId");
        User recievedUser = userService.getUser(userId);

        if(recievedUser == null)
            return "error";

        user.setUserId(recievedUser.getUserId());
        user.setUsername(recievedUser.getUsername());
        user.setPhoneNumber(recievedUser.getPhoneNumber());
        user.setEmail(recievedUser.getEmail());
        user.setRegisterTime(recievedUser.getRegisterTime());

        return "detail";
    }

    public String userCenter() {
        return "userCenter";
    }
}