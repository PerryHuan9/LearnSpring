package com.learn.aspectJ;

import org.springframework.stereotype.Component;


@Component
public class SingPerformance implements Performance {
    @Override
    public void perform(String type) {
        if (type == "1") {
            System.out.println("歌手在唱歌");
        } else if (type == "0") {
            throw new RuntimeException("出现意外了");
        }
    }
}
