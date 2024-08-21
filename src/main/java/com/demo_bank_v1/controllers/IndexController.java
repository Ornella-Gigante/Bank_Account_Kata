package com.demo_bank_v1.controllers;

import com.demo_bank_v1.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class IndexController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/index")
    public ModelAndView getIndex(Model model) {
        ModelAndView getIndexPage = new ModelAndView("index");
        getIndexPage.addObject("PageTitle", "Home");
        System.out.println("In Index Page Controller");
        return getIndexPage;
    }

    @GetMapping("/error")
    public ModelAndView getError() {
        ModelAndView getErrorPage = new ModelAndView("error");
        getErrorPage.addObject("PageTitle", "Errors");
        System.out.println("In Error Page Controller");
        return getErrorPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(@RequestParam("token") String token, @RequestParam("code") String code) {
        ModelAndView getVerifyPage;

        // Get Token in BBDD
        Optional<String> dbToken = userRepository.checkToken(token);

        // Check If Token Is Valid
        if (dbToken.isEmpty()) {
            getVerifyPage = new ModelAndView("error");
            getVerifyPage.addObject("error", "Ups! Seems that this session has expired..");
            return getVerifyPage;
        }

        // Update and Verify Account
        userRepository.verifyAccount(token, code);
        getVerifyPage = new ModelAndView("login");
        getVerifyPage.addObject("success", "Account Verified Successfully, Please Proceed to Log In");
        System.out.println("In Verify Account Controller");
        return getVerifyPage;
    }
}
