package com.learn.di;

import java.util.Arrays;
import java.util.List;

public class Knight {
    private Quest quest;
    private String title;
    private List<String> friends;

    public Knight(Quest quest) {
        this.quest = quest;

    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setFriends(List<String> friends) {
        this.friends = friends;
    }

    public void embarkOnQuest() {
        boolean state = this.quest.embark();
        if (state) {
            System.out.println("执行成功");
        } else {
            System.out.println("执行失败");
        }
        if (title != null && friends != null) {
            System.out.println("title:" + title);
            System.out.println("friends:" + Arrays.toString(friends.toArray()));
        }
    }
}
