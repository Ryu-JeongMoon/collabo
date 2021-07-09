package com.zipbop;

import com.zipbop.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@EnableScheduling
//@Configuration
@RequiredArgsConstructor
public class SchedulingConfig {

    private final MemberRepository memberRepository;

    // 서버 시작 후, 탈퇴 후 6개월 지난 회원 자동 삭제 로직
    @PostConstruct
    public void init() {
        log.info("POSTCONSTRUCT ACTIVATED");
        memberRepository.delete();
    }

//    @Scheduled(cron = "0/5 * * * * *")
    public void test() {
        System.out.println("yaho");
    }

    // 매일 새벽 4시에 실행되는, 탈퇴 후 6개월 지난 회원 삭제 로직
    @Scheduled(cron = "0 0 4 * * *")
    public void cleanMemberList() {
        log.info("CLENAING ACTIVATED");
        memberRepository.delete();
    }
}
