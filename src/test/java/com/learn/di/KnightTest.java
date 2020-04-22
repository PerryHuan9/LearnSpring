package com.learn.di;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import  org.junit.jupiter.api.Assertions;

@SpringBootTest
public class KnightTest {
    @Autowired
    Knight knight;

    @Test
    void testKnight() {
        knight.embarkOnQuest();
        Assertions.assertNotNull(knight);
    }


}
