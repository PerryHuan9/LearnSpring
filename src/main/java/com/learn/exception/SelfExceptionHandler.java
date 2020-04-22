package com.learn.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SelfExceptionHandler {

    @ExceptionHandler(BaseException.class)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody HandlerBody handleNotFoundException(NotFountException e) {
        System.out.println("ExceptionHandler;" + e);
        return new HandlerBody(e.code, e.message);
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public @ResponseBody HandlerBody handleRuntimeException(RuntimeException e) {
        System.out.println("ExceptionHandler;" + e);
        return new HandlerBody(501, "服务器维护中，请稍后再尝试");
    }

}
