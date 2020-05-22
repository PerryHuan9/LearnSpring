package com.learn.mvc.exception;

public class NotFountException extends BaseException {
    public static final int NOT_FOUND_CODE = 404;

    public NotFountException(String message) {
        super(NOT_FOUND_CODE, message);
    }

    public NotFountException() {
        super(NOT_FOUND_CODE, "");
    }
}
