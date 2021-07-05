package com.zipbop;

import com.zipbop.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@RequiredArgsConstructor
@Component
public class DataInit {

    private final MemberRepository memberRepository;

    // 서버 시작 후, 탈퇴 후 6개월 지난 회원 자동 삭제 로직
    @PostConstruct
    public void init() {
        memberRepository.delete();
    }
}
