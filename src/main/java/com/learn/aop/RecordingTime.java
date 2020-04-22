package com.learn.aop;

import java.util.Date;

public class RecordingTime {
    private long startTime;
    private long endTime;

    public void recordStartTime() {
        startTime = new Date().getTime();
        System.out.println("记录开始学习时间点："+ new Date(startTime));
    }

    public void recordEndTime() {
        endTime = new Date().getTime();
        System.out.println("学习了"+ (endTime - startTime) +"ms");
    }

}
