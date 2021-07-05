package com.zipbop.member.domain.repository;

import com.zipbop.member.domain.member.Member;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.EntityManager;
import java.util.List;


@Slf4j
@PropertySource("classpath:application.yml")
@RunWith(SpringRunner.class)
@SpringBootTest
class JpaMemberRepositoryTest {

    @Autowired
    JpaMemberRepository jpaMemberRepository;

    @Autowired
    EntityManager em;

    @Test
//    @Transactional
//    @Rollback(true)
    public void testMember() throws Exception {
        //given
        Member member = new Member();
        member.setId("yaho123456");
        member.setName("userB");
        member.setPassword("1234");

        Long saveUuid = jpaMemberRepository.save(member);
        Member findMember = jpaMemberRepository.findByUuid(saveUuid);
        //when

        Assertions.assertThat(member).isEqualTo(findMember);
        //then
    }

    @Test
    public void findOneTest() {
        Member member = jpaMemberRepository.findByUuid(2L);
        log.info("member = {}", member);
    }

    @Test
    void findAllTest() {
        List<Member> result = jpaMemberRepository.findAll();

        for (Member member : result) {
            log.info("member = {}", member);
        }
    }

    @Test
    void months() {
        List resultList = em.createQuery("select m from Member m where months_between(current_date, m.signoutDate) >= 6")
                            .getResultList();
        System.out.println("resultList = " + resultList);
    }
}