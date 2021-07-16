package com.zipbop.member.web.controller;

import com.zipbop.member.domain.service.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class EmailController {

    private final EmailService emailService;
    private String emailCheckCode;

    @PostMapping("/email/send")
    public void emailSend(String email) throws Exception {
        String code = emailService.createCode();
        emailCheckCode = code;
        emailService.sendEmailMessage(email, emailCheckCode);
    }

    @ResponseBody
    @PostMapping("/email/check")
    public String emailCheck(String emailCheckCode) {

        if (!emailCheckCode.equals(this.emailCheckCode))
            return "fail";

        return "success";
    }
}
