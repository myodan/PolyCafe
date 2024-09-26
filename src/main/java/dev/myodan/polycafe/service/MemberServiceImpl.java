package dev.myodan.polycafe.service;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.repository.MemberRepository;
import dev.myodan.polycafe.util.Pageable;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;

    @Override
    public List<Member> getList() {
        return memberRepository.findAll();
    }

    @Override
    public List<Member> getList(Pageable pageable) {
        return memberRepository.findAll(pageable);
    }

    @Override
    public Member getItem(Long id) {
        return memberRepository.findOneById(id);
    }

    @Override
    public void save(Member member) {
        memberRepository.save(member);
    }

    @Override
    public void update(Member member) {
        memberRepository.update(member);
    }

    @Override
    public void delete(Member member) {
        memberRepository.delete(member);
    }

    @Override
    public Member signIn(Member member) {
        Member findedMember = memberRepository.findOneByUsername(member.getUsername());

        if (findedMember == null) {
            return null;
        }

        if (!findedMember.getPassword().equals(member.getPassword())) {
            return null;
        }

        findedMember.setPassword(null);

        return findedMember;
    }

    @Override
    public void signUp(Member member) throws Exception {
        Member findedMember = memberRepository.findOneByUsername(member.getUsername());

        if (findedMember != null) {
            throw new Exception("이미 존재하는 사용자 이름입니다.");
        }

        memberRepository.save(member);
    }

    @Override
    public boolean checkUsername(String username) {
        return memberRepository.findOneByUsername(username) == null;
    }

}
