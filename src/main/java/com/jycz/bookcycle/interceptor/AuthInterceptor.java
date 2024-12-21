package com.jycz.bookcycle.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Object user = invocation.getInvocationContext().getSession().get("user");
        if (user == null) {
            return "login";
        }
        return invocation.invoke();
    }
}
