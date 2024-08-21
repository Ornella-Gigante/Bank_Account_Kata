package com.demo_bank_v1.controllers;

import com.demo_bank_v1.models.Account;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.AccountRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session) {
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        // Obtener los detalles del usuario logueado
        User user = (User) session.getAttribute("user");

        if (user != null) {
            // Obtener las cuentas del usuario logueado
            List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

            // Obtener el balance total
            BigDecimal totalAccountBalance = accountRepository.getTotalBalance(user.getUser_id());

            // Configurar los objetos en el ModelAndView
            getDashboardPage.addObject("userAccounts", getUserAccounts);
            getDashboardPage.addObject("totalBalance", totalAccountBalance);
        } else {
            // Manejar el caso donde el usuario no esté logueado
            getDashboardPage.addObject("error", "User not logged in");
        }

        return getDashboardPage;
    }
}
