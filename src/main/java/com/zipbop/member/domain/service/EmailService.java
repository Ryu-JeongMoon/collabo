package com.zipbop.member.domain.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Slf4j
@RequiredArgsConstructor
@Service
public class EmailService {

    private final JavaMailSender emailSender;
    private final SpringTemplateEngine templateEngine;

    public void sendEmailMessage(String email, String emailCheckCode) throws Exception {
        String code = emailCheckCode; // 인증코드 생성
        MimeMessage message = emailSender.createMimeMessage();

        message.addRecipients(MimeMessage.RecipientType.TO, email); // 보낼 이메일 설정
        message.setSubject("[인증 코드] " + code); // 이메일 제목
        message.setText(setContext(code), "utf-8", "html"); // 내용 설정(Template Process)

        // 보낼 때 이름 설정하고 싶은 경우
        message.setFrom(new InternetAddress("woomool.market@google.com", "WooMooL Market"));

        emailSender.send(message); // 이메일 전송
    }

    private String setContext(String code) { // 타임리프 설정하는 코드
        Context context = new Context();
        context.setVariable("code", code); // Template에 전달할 데이터 설정
        return templateEngine.process("mail", context); // mail.html
    }

    public String createCode() {
        StringBuilder code = new StringBuilder();
        Random rnd = new Random();
        for (int i = 0; i < 7; i++) {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
                case 0:
                    code.append((char) (rnd.nextInt(26) + 97));
                    break;
                case 1:
                    code.append((char) (rnd.nextInt(26) + 65));
                    break;
                case 2:
                    code.append((rnd.nextInt(10)));
                    break;
            }
        }
        return code.toString();
    }
}
