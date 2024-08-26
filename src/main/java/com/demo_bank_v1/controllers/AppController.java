package com.demo_bank_v1.controllers;

import com.demo_bank_v1.models.*;
import com.demo_bank_v1.repository.AccountRepository;
import com.demo_bank_v1.repository.PaymentHistoryRepository;
import com.demo_bank_v1.repository.TransactHistoryRepository;
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
    User user;

    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    private TransactHistoryRepository transactHistoryRepository;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session) {
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        // Obtener los detalles del usuario logueado
        user = (User) session.getAttribute("user");

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

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session){
        //Set View:
        ModelAndView getPaymentHistoryPage= new ModelAndView("paymentHistory");

        //Get Logged In User:

        user=(User) session.getAttribute("user");

        //Get Payment History/ Records:

        List<PaymentHistory> userPaymentHistory= paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());
        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);

        return getPaymentHistoryPage;

    }


    @GetMapping("/transact_history")
    public ModelAndView getTransactHistory(HttpSession session){
        //Set View:
        ModelAndView getTransactHistory= new ModelAndView("transactHistory");

        //Get Logged In User:

        user=(User) session.getAttribute("user");

        //Get Payment History/ Records:

        List<TransactionHistory> userTransactHistory= transactHistoryRepository.getTransactionRecordsById(user.getUser_id());
        getTransactHistory.addObject("transact_history", userTransactHistory);

        return getTransactHistory;

    }

}
