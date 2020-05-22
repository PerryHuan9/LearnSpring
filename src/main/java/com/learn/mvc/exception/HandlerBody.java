package com.learn.mvc.exception;

public class HandlerBody {
    private int code;
    private String message;

    public HandlerBody(int code, String message) {
        this.code = code;
        this.message = message;
    }
}
