package com.learn.di;

import org.springframework.context.annotation.Configuration;

@Configuration
public class KnightConfig {
    public Knight knight() {
        return  new Knight(quest());
    }
    public Quest quest() {
        return  new PatrolQuest();
    }
}
