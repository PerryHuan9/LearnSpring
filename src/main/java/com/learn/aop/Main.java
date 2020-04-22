package com.learn.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("/student.xml");
        Student student = context.getBean(Student.class);
        student.doLearning();
    }
}
