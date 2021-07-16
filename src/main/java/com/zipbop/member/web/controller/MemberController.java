package com.zipbop.member.web.controller;

import com.zipbop.member.domain.login.LoginService;
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
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    private final LoginService loginService;
    private final MemberRepository memberRepository;
    private final MemberService memberService;

    @GetMapping("/add")
    public String addForm(@ModelAttribute("form") MemberSaveForm form, Model model) {
        model.addAttribute("isCertified", "false");
        return "th/members/addMemberForm_org";
    }

    @PostMapping("/add")
    public String add(@Validated @ModelAttribute("form") MemberSaveForm form, BindingResult bindingResult, @RequestParam("isCertified") String isCertified, Model model) {

        if(loginService.hasLoginId(form.getId())) {
            bindingResult.reject("duplicateId");
        }

        if(isCertified.equals("false")) {
            bindingResult.reject("isCertified");
            return "th/members/addMemberForm_org";
        }

        if (bindingResult.hasErrors()) {
            log.info("bindingResult = {}", bindingResult);
            return "th/members/addMemberForm_org";
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

        memberService.join(member);
        log.info("member = {}", member);

        return "redirect:/";
    }

    @ResponseBody
    @PostMapping("/check")
    public String validityCheck(String id) {
        boolean result = memberRepository.findById(id).isPresent();

        if (id.length() < 4)
            return "short";

        if (result)
            return "fail";

        return "success";
    }

    @GetMapping("/myPage")
    public String myPage(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        Member member = memberRepository.findByUuid(loginMember.getUuid());

        if(loginMember == null)
            return "redirect:/login";

        model.addAttribute("member", member);
        return "th/members/myPage";
    }

    @GetMapping("/myPageForm")
    public String myPageForm(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        Member member = memberRepository.findByUuid(loginMember.getUuid());

        if(loginMember == null)
            return "redirect:/login";

        model.addAttribute("member", member);
        return "th/members/myPageForm";
    }

    @GetMapping("/edit")
    public String editForm(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        Member member = memberRepository.findByUuid(loginMember.getUuid());

        MemberUpdateForm form = new MemberUpdateForm(
                member.getId(), member.getPassword(), member.getName(), member.getAge(),
                member.getPhone(), member.getAddress(), member.getEmail(), member.getLicense());

        model.addAttribute("form", form);

        return "th/members/updateMemberForm";
    }

    @PostMapping("/edit")
    public String edit(HttpSession session, @Validated @ModelAttribute("form") MemberUpdateForm form, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            log.info("bindingResult = {}", bindingResult);
            return "th/members/updateMemberForm";
        }

        Member loginMember = (Member) session.getAttribute("loginMember");

        Member member = new Member();
        member.setPassword(form.getPassword());
        member.setName(form.getName());
        member.setAge(form.getAge());
        member.setPhone(form.getPhone());
        member.setAddress(form.getAddress());
        member.setEmail(form.getEmail());
        member.setLicense(form.getLicense());

        Member updatedMember = memberService.update(loginMember.getUuid(), member);
        session.setAttribute("loginMember", updatedMember);
        model.addAttribute("uuid", loginMember.getUuid());

        return "redirect:/members/myPage";
    }

    @GetMapping("/leave")
    public String leaveForm(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        Member member = memberRepository.findByUuid(loginMember.getUuid());

        LoginForm loginForm = new LoginForm();
        loginForm.setId(member.getId());
        loginForm.setPassword(member.getPassword());

        model.addAttribute("loginForm", loginForm);

        return "th/members/leaveMemberForm";
    }

    @PostMapping("/leave")
    public String leave(@Validated @ModelAttribute("loginForm") LoginForm loginForm, BindingResult bindingResult, HttpServletRequest request) {

        Member loginMember = (Member) request.getSession().getAttribute("loginMember");
        Member findMember = memberRepository.findByUuid(loginMember.getUuid());

        if (!findMember.getPassword().equals(loginForm.getPassword())) {
            bindingResult.rejectValue("password", "passwordFail", null);
            return "th/members/leaveMemberForm";
        }

        if(bindingResult.hasErrors()) {
            bindingResult.rejectValue("password", "NotEnoughPassword", null);
            return "th/members/leaveMemberForm";
        }

        memberService.leave(loginMember.getUuid(), request);
        return "redirect:/";
    }
}
