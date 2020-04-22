package com.learn.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("/knights.xml");
//        ApplicationContext context = new FileSystemXmlApplicationContext("src/com/spring/knight/knights.xml");
        Knight knight = context.getBean(Knight.class);
        knight.embarkOnQuest();
    }
}
