package com.learn.di;

import java.io.PrintStream;

public class DragonQuest implements Quest {

    private PrintStream stream;
    public DragonQuest(PrintStream stream) {
        this.stream = stream;
    }
    @Override
    public boolean embark() {
        this.stream.println("骑士开始击杀巨龙");
        return true;
    }
}
