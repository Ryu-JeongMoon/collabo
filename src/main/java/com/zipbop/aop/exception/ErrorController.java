package com.zipbop.aop.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/error-ex")
    public void errorEx() {
        throw new RuntimeException();
    }
}
