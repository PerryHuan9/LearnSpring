package com.learn.autowired;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class BrotherhoodTest {

    @Autowired
    private CompactDisc brotherhood;

    private Mystic mystic;

    @Autowired
    void setMystic(Mystic mystic) {
        this.mystic = mystic;
    }

    @Test
    void brotherhoodShoutNotNull() {
        brotherhood.play();
        mystic.play();
        assertNotNull(brotherhood);
        assertNotNull(mystic);
    }

}
