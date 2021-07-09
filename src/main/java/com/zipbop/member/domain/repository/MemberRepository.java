package com.zipbop.member.domain.repository;

import com.zipbop.member.domain.member.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    public Long save(Member member);
    public Member findByUuid(Long uuid);
    public Optional<Member> findById(String id);
    public List<Member> findAll();
    public void inactivate(Long uuid);
    public Member update(Long uuid, Member member);
    public void delete();
}
