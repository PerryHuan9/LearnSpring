package com.learn.autowired;

import org.springframework.stereotype.Component;

@Component
public class Mystic implements CompactDisc{

    @Override
    public void play() {
        System.out.println("正在播放Mystic");
    }
}
