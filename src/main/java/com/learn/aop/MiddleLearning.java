package com.learn.aop;

public class MiddleLearning implements Learning {
    @Override
    public void learning() {
        System.out.println("中学生学习物理、生物、化学");
    }
}
