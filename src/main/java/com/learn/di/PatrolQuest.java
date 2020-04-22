package com.learn.di;

public class PatrolQuest implements Quest {

    @Override
    public boolean embark() {
        System.out.println("骑士执行巡逻任务");
        return true;
    }
}
