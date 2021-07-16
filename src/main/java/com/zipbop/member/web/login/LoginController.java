package com.zipbop.member.web.login;

import com.zipbop.funding.repository.FundingDAOMybatis;
import com.zipbop.member.domain.login.LoginService;
import com.zipbop.member.domain.member.Member;
import com.zipbop.member.web.SessionConst;
import com.zipbop.member.web.session.SessionManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Slf4j
@RequiredArgsConstructor
@Controller
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public String loginForm(@ModelAttribute("loginForm") LoginForm form) {
        return "th/login/loginForm";
    }

    @PostMapping("/login")
    public String loginV4(@Valid @ModelAttribute("loginForm") LoginForm form, BindingResult bindingResult,
                          @RequestParam(defaultValue = "/") String requestURI, HttpServletRequest request) {
        if(bindingResult.hasErrors()) {
            return "th/login/loginForm";
        }

        Member loginMember = loginService.login(form.getId(), form.getPassword());

        if (!loginService.hasLoginId(form.getId())) {
            bindingResult.reject("loginFail", "존재하지 않는 아이디입니다.");
            return "th/login/loginForm";
        }

        if(loginMember == null) {
            bindingResult.reject("loginFail", "비밀번호를 잘못 입력하셨습니다.");
            return "th/login/loginForm";
        }

        // 로그인 성공
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_MEMBER, loginMember);

        return "redirect:" + requestURI;
    }

    @RequestMapping("/logout")
    public String logoutV3(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session != null)
            session.invalidate();

        return "redirect:/";
    }
}
