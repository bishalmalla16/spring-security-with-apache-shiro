package com.example.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class CustomExceptionHandler {
    private final static Logger logger = LoggerFactory.getLogger(CustomExceptionHandler.class);

    @ExceptionHandler(AuthorizationException.class)
    public String handleException(AuthorizationException ex, Model model){
        logger.debug("Unauthorized Exception", ex);
        Map<String, Object> errorMap = new HashMap<>();
        errorMap.put("status", HttpStatus.UNAUTHORIZED.value());
        errorMap.put("message", "No Message Available");
        model.addAttribute("errors", errorMap);
        return "error";
    }
}
