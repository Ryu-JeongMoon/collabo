package com.zipbop.member.domain.login;

import com.zipbop.member.domain.member.Available;
import com.zipbop.member.domain.member.Member;
import com.zipbop.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final MemberRepository memberRepository;

    public boolean hasLoginId(String id) {
        return memberRepository.findById(id)
                               .filter(member -> member.getAvailable() == Available.IN)
                               .isPresent();
    }

    public Member login(String id, String password) {
        return memberRepository.findById(id)
                               .filter(m -> m.getPassword().equals(password) && m.getAvailable() == Available.IN)
                               .orElse(null);
    }
}
