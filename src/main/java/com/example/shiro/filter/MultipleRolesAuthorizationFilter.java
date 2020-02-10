package com.example.shiro.filter;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.RolesAuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class MultipleRolesAuthorizationFilter extends RolesAuthorizationFilter {
    @Override
    public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws IOException {
        String[] multipleRoles = (String[]) mappedValue;
        Subject subject = getSubject(request, response);

        if(multipleRoles==null || multipleRoles.length==0)
            return true;

        for (String role: multipleRoles) {
            if(subject.hasRole(role))
                return true;
        }

        return false;
    }
}
