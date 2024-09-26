package dev.myodan.polycafe.util;

import lombok.Getter;
import lombok.Setter;

import java.util.*;

@Getter
@Setter
public class Pageable {

    private int page = 1;
    private int offset = 10;
    private int group = 5;
    private int count = 0;

    public int getLast() {
        return (int) Math.ceil((double) count / offset);
    }

    public int getPrev() {
        return page <= group ? 1 : (((page - 1) / group) - 1) * group + 1;
    }

    public int getNext() {
        int next = (((page - 1) / group) + 1) * group + 1;
        int last = this.getLast();
        return Math.min(next, last);
    }

    public List<Integer> getList() {
        List<Integer> list = new ArrayList<>();
        int startPage = (((page - 1) / group)) * group + 1;

        for (int i = startPage; i < startPage + group && i <= this.getLast(); i++) {
            list.add(i);
        }

        if (list.isEmpty()) {
            list.add(1);
        }

        return list;
    }

}