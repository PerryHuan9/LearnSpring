package com.learn.di;

import java.io.PrintStream;

public class Minstrel {
    private PrintStream stream;
    public Minstrel(PrintStream stream) {
        this.stream = stream;
    }

    public void singBeforeQuest() {
        stream.println("诗人在任务前开始记录");
    }

    public void singAfterQuest() {
        stream.println("诗人歌颂骑士的事迹");
    }
}
