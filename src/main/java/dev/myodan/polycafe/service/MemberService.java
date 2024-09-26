package dev.myodan.polycafe.service;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.util.Pageable;

import java.util.List;

public interface MemberService {

    List<Member> getList();

    List<Member> getList(Pageable pageable);

    Member getItem(Long id);

    void save(Member member);

    void update(Member member);

    void delete(Member member);

    Member signIn(Member member);

    void signUp(Member member) throws Exception;

    boolean checkUsername(String username);

}