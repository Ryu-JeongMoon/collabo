package com.zipbop.member.web.controller;

import com.zipbop.member.domain.member.Available;
import com.zipbop.member.domain.member.Member;
import com.zipbop.member.domain.repository.MemberRepository;
import com.zipbop.member.domain.service.MemberService;
import com.zipbop.member.web.controller.form.MemberSaveForm;
import com.zipbop.member.web.controller.form.MemberUpdateForm;
import com.zipbop.member.web.login.LoginForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    private final MemberRepository memberRepository;
    private final MemberService memberService;

    @GetMapping("/add")
    public String addForm(@ModelAttribute("member") Member member) {
        return "members/addMemberForm";
    }

    @PostMapping("/add")
    public String add(@Validated @ModelAttribute MemberSaveForm form, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "members/addMemberForm";
        }

        Member member = new Member();

        member.setId(form.getId());
        member.setPassword(form.getPassword());
        member.setName(form.getName());
        member.setAge(form.getAge());
        member.setPhone(form.getPhone());
        member.setAddress(form.getAddress());
        member.setEmail(form.getEmail());
        member.setLicense(form.getLicense());

        Long uuid = memberService.join(member);

        if (uuid == 0L) {
            return "members/addMemberForm";
        }

        return "redirect:/";
    }

    @RequestMapping("/mypage")
    public String myPage(@RequestParam Long uuid, Model model) {

        Member member = memberRepository.findByUuid(uuid);
        model.addAttribute("member", member);
        return "members/myPageForm";
    }

    @GetMapping("/{uuid}/edit")
    public String editForm(@PathVariable Long uuid, Model model) {
        Member member = memberRepository.findByUuid(uuid);

        MemberUpdateForm form = new MemberUpdateForm(
                member.getId(), member.getPassword(), member.getName(), member.getAge(),
                member.getPhone(), member.getAddress(), member.getEmail(), member.getLicense());

        model.addAttribute("form", form);

        return "members/updateMemberForm";
    }

    @PostMapping("/{uuid}/edit")
    public String edit(@PathVariable Long uuid, @Validated @ModelAttribute("form") MemberUpdateForm form, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "members/updateMemberForm";
        }

        Member member = new Member();

        member.setPassword(form.getPassword());
        member.setName(form.getName());
        member.setAge(form.getAge());
        member.setPhone(form.getPhone());
        member.setAddress(form.getAddress());
        member.setEmail(form.getEmail());
        member.setLicense(form.getLicense());

        Member updatedMember = memberService.update(uuid, member);
        model.addAttribute("uuid", uuid);

        return "redirect:http://localhost:8080/members/mypage?uuid=" + uuid;
    }

    @GetMapping("/{uuid}/leave")
    public String leaveForm(@PathVariable Long uuid, Model model) {

        Member member = memberRepository.findByUuid(uuid);

        LoginForm loginForm = new LoginForm();
        loginForm.setId(member.getId());
        loginForm.setPassword(member.getPassword());

        model.addAttribute("loginForm", loginForm);

        return "members/leaveMemberForm";
    }

    @PostMapping("/{uuid}/leave")
    public String leave(@PathVariable Long uuid, @ModelAttribute LoginForm loginForm, BindingResult bindingResult, HttpServletRequest request, Model model) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("loginForm", loginForm);
            return "members/leaveMemberForm";
        }

        Member findMember = memberRepository.findByUuid(uuid);
        if (!findMember.getPassword().equals(loginForm.getPassword())) {
            bindingResult.reject("loginFail", "비밀번호를 잘못 입력하셨습니다.");
            return "members/leaveMemberForm";
        }

        memberService.leave(uuid, request);
        return "redirect:/";
    }
}
