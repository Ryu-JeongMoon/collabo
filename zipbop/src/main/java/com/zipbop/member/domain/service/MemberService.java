package com.zipbop.member.domain.service;

import com.zipbop.member.domain.member.Available;
import com.zipbop.member.domain.member.Member;
import com.zipbop.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.Optional;

@RequiredArgsConstructor
@Transactional
@Service
public class MemberService {

    private final MemberRepository memberRepository;

    public Long join(Member member) {

        if (validateDuplicatedId(member))
            return 0L;

        member.setAvailable(Available.IN);
        member.setSignupDate(LocalDateTime.now());

        memberRepository.save(member);
        return member.getUuid();
    }

    private boolean validateDuplicatedId(Member member) {
        return memberRepository.findById(member.getId()).isPresent();
    }

    public Member update(Long uuid, Member member) {
        return memberRepository.update(uuid, member);
    }

    public void leave(Long uuid, HttpServletRequest request) {
        memberRepository.inactivate(uuid);

        HttpSession session = request.getSession(false);
        if(session != null)
            session.invalidate();
    }
}
