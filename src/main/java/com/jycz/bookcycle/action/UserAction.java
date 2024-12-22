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
    private String confirm;
    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response  = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();

    public User getModel() {
        return user;
    }

    public String userLogin(){

        User loginUser = userService.login(user);

        if(loginUser == null) {
            addActionError("用户名或密码错误！");
            return "error";
        }

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

    public void validateUserRegister() {
        // 验证用户名
        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            addFieldError("user.username", "用户名不能为空");
        } else if (!user.getUsername().matches("^[a-zA-Z0-9]{6,12}$")) {
            addFieldError("user.username", "用户名必须为6-12个字符的字母或数字");
        }

        // 验证密码
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            addFieldError("user.password", "密码不能为空");
        } else if (!user.getPassword().matches("^.{6,16}$")) {
            addFieldError("user.password", "密码必须为6-16个字符");
        }

        // 验证确认密码
        if (confirm == null || confirm.isEmpty()) {
            addFieldError("confirmPassword", "确认密码不能为空");
        } else if (!confirm.equals(user.getPassword())) {
            addFieldError("confirmPassword", "确认密码必须与密码一致");
        }

        // 验证电话
        if (user.getPhoneNumber() == null || user.getPhoneNumber().isEmpty()) {
            addFieldError("user.phone", "电话号码不能为空");
        } else if (!user.getPhoneNumber().matches("^1\\d{10}$")) {
            addFieldError("user.phone", "电话号码必须是11位数字，以1开头");
        }

        // 验证邮箱
        if (user.getEmail() == null || user.getEmail().isEmpty()) {
            addFieldError("user.email", "邮箱不能为空");
        } else if (!user.getEmail().matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")) {
            addFieldError("user.email", "请输入有效的邮箱地址");
        }
    }
}