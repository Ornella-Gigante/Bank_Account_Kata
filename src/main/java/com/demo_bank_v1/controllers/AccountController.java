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
    public String createAccount(@RequestParam("account_name") String accountName,
                                @RequestParam("account_type") String accountType,
                                RedirectAttributes redirectAttributes,
                                HttpSession session) {

        // Verifica si el nombre de la cuenta y el tipo están vacíos
        if (accountName == null || accountName.trim().isEmpty() || accountType == null || accountType.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Account Name and Type Cannot Be Empty!");
            return "redirect:/app/dashboard";
        }

        // Obtén el usuario logueado de la sesión
        User user = (User) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "User not logged in!");
            return "redirect:/app/dashboard";
        }

        // Genera el número de cuenta
        int setAccountNumber = GenAccountNumber.generateAccountNumber();
        String bankAccountNumber = Integer.toString(setAccountNumber);

        // Crea la cuenta en la base de datos
        accountRepository.createBankAccount(user.getUser_id(), bankAccountNumber, accountName, accountType);

        // Agrega el mensaje de éxito
        redirectAttributes.addFlashAttribute("success", "Account Created Successfully!");
        return "redirect:/app/dashboard";
    }
}
