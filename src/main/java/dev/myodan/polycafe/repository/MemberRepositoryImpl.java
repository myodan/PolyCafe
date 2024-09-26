package dev.myodan.polycafe.repository;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.util.Pageable;
import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
public class MemberRepositoryImpl implements MemberRepository {

    private final SqlSession sqlSession;

    @Override
    public Long total() {
        return sqlSession.selectOne("member.total");
    }

    @Override
    public List<Member> findAll() {
        return sqlSession.selectList("member.findAll");
    }

    @Override
    public List<Member> findAll(Pageable pageable) {
        return sqlSession.selectList("member.findAllPageable", pageable);
    }

    @Override
    public Member findOneById(Long id) {
        return sqlSession.selectOne("member.findOneById", id);
    }

    @Override
    public void save(Member member) {
        sqlSession.insert("member.save", member);
    }

    @Override
    public void update(Member member) {
        sqlSession.update("member.update", member);
    }

    @Override
    public void delete(Member member) {
        sqlSession.delete("member.delete", member);
    }

    @Override
    public Member findOneByUsername(String username) {
        return sqlSession.selectOne("member.findOneByUsername", username);
    }

}
