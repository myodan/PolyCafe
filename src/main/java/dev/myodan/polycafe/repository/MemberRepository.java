package dev.myodan.polycafe.repository;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.util.Pageable;

import java.util.List;

public interface MemberRepository {

    Long total();

    List<Member> findAll();

    List<Member> findAll(Pageable pageable);

    Member findOneById(Long id);

    void save(Member member);

    void update(Member member);

    void delete(Member member);

    Member findOneByUsername(String username);

}
