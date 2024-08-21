package com.demo_bank_v1.controllers;

import com.demo_bank_v1.helpers.GenAccountNumber;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.AccountRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountRepository accountRepository;
    @PostMapping("/create_account")
    public String createAccount(@RequestParam("account_name")String accountName,
                                @RequestParam("account_type")String accountType,
                                RedirectAttributes redirectAttributes,
                                HttpSession session){

        //Listita siuuu
        // TODO: CHECK FOR EMPTY STRINGS:

        if(accountName.isEmpty() || accountType.isEmpty()){
            redirectAttributes.addFlashAttribute("error", "Account Name and Type Cannot Be Empty!");
            return "redirect:/app/dashboard";

        }

        // TODO: GET LOGGED IN USER:


        User user= (User)session.getAttribute("user");


        // TODO: GET / GENERATE ACCOUNT NUMBER:

        int setAccountNumber = GenAccountNumber.generateAccountNumber();
        String bankAccountNumber = Integer.toString(setAccountNumber);

        // TODO: CREATE ACCOUNT:

        accountRepository.createBankAccount(user.getUser_id(), bankAccountNumber, accountName, accountType);


        // TODO: SET SUCCESS MESSAGE:

        redirectAttributes.addFlashAttribute("success", "Account Created Successfully!");
        return "redirect:/app/dashboard";

    }




}
