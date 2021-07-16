package com.zipbop.member.domain.repository;

import com.zipbop.member.domain.member.Available;
import com.zipbop.member.domain.member.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Transactional
@Repository
public class JpaMemberRepository implements MemberRepository {

    @PersistenceContext
    private final EntityManager em;

    public Long save(Member member) {
        em.persist(member);
        return member.getUuid();
    }

    @Transactional(readOnly = true)
    public Member findByUuid(Long uuid) {
        return em.find(Member.class, uuid);
    }

    @Transactional(readOnly = true)
    public Optional<Member> findById(String id) {
        return findAll().stream()
                        .filter(member -> member.getId()
                                                .equals(id))
                        .findAny();
    }

    @Transactional(readOnly = true)
    public List<Member> findAll() {
        return em.createQuery("select m from Member m", Member.class)
                 .getResultList();
    }

    public Member update(Long uuid, Member member) {
        Member toBeUpdateMember = em.find(Member.class, uuid);

        toBeUpdateMember.setPassword(member.getPassword());
        toBeUpdateMember.setName(member.getName());
        toBeUpdateMember.setAge(member.getAge());
        toBeUpdateMember.setPhone(member.getPhone());
        toBeUpdateMember.setAddress(member.getAddress());
        toBeUpdateMember.setEmail(member.getEmail());
        toBeUpdateMember.setLicense(member.getLicense());

        return toBeUpdateMember;
    }

    public void inactivate(Long uuid) {
        Member findMember = em.find(Member.class, uuid);

        findMember.setAvailable(Available.OUT);
        findMember.setSignoutDate(LocalDateTime.now());
    }

    public void delete() {
        List result = em.createQuery("select m from Member m where months_between(current_date, m.signoutDate) >= 6").getResultList();
        result.stream()
              .forEach(toBeDeleteMember -> em.remove(toBeDeleteMember));
    }
}
