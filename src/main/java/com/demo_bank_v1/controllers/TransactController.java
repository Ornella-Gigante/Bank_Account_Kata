package com.demo_bank_v1.controllers;

import com.demo_bank_v1.models.TransactionHistory;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.AccountRepository;
import com.demo_bank_v1.repository.PaymentRepository;
import com.demo_bank_v1.repository.TransactHistoryRepository;
import com.demo_bank_v1.repository.TransactRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/transact")
public class TransactController {

    LocalDateTime currentDateTime = LocalDateTime.now();

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private TransactRepository transactRepository;

    @Autowired
    private TransactHistoryRepository transactHistoryRepository;

    User user;
    double currentBalance;
    double newBalance;

    // Handle Sorting (Asc and Desc)
    @GetMapping("/transactions")
    public String getTransactions(@RequestParam("order") String order, HttpSession session, Model model) {
        user = (User) session.getAttribute("user");
        List<TransactionHistory> transactions;

        if ("asc".equals(order)) {
            transactions = transactHistoryRepository.getTransactionRecordsByIdAsc(user.getUser_id());
        } else {
            transactions = transactHistoryRepository.getTransactionRecordsByIdDesc(user.getUser_id());
        }

        model.addAttribute("transact_history", transactions);
        return "transactionsPage";
    }

    // Handle Filtering by Type or Date Range
    @GetMapping("/filteredTransactions")
    public String filterTransactions(@RequestParam(value = "type", required = false) String type,
                                     @RequestParam(value = "start_date", required = false) String startDate,
                                     @RequestParam(value = "end_date", required = false) String endDate,
                                     HttpSession session,
                                     Model model) {
        user = (User) session.getAttribute("user");
        List<TransactionHistory> transactions;

        if (type != null && !type.isEmpty()) {
            transactions = transactHistoryRepository.getTransactionsByType(user.getUser_id(), type);
        } else if (startDate != null && endDate != null) {
            transactions = transactHistoryRepository.getTransactionsByDateRange(user.getUser_id(), startDate, endDate);
        } else {
            transactions = transactHistoryRepository.getTransactionRecordsByIdDesc(user.getUser_id());
        }

        model.addAttribute("transact_history", transactions);
        return "transactionsPage";
    }

    // Handle Pagination
    @GetMapping("/paginatedTransactions")
    public String getPaginatedTransactions(@RequestParam("page") int page,
                                           @RequestParam("size") int size,
                                           HttpSession session,
                                           Model model) {
        user = (User) session.getAttribute("user");
        Pageable pageable = PageRequest.of(page, size);
        Page<TransactionHistory> pagedResult = transactHistoryRepository.findByUserId(user.getUser_id(), pageable);

        model.addAttribute("pagedTransactions", pagedResult.getContent());
        model.addAttribute("totalPages", pagedResult.getTotalPages());
        return "transactionsPage";
    }
    @PostMapping("/deposit")
    public String deposit(@RequestParam("deposit_amount") String depositAmount,
                          @RequestParam("account_id") String accountId,
                          HttpSession session,
                          RedirectAttributes redirectAttributes) {


        // TODO: CHECK FOR EMPTY STRINGS:

        if (depositAmount.isEmpty() || accountId.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Deposit Amount or Account Depositing Cannot be Empty!");
            return "redirect:/app/dashboard";
        }

        // TODO: GET LOGGED IN USER:


         user = (User) session.getAttribute("user");

        // TODO: GET CURRENT ACCOUNT BALANCE:


        int acc_id = Integer.parseInt(accountId);

        double depositAmountValue = Double.parseDouble(depositAmount);

        // TODO: CHECK IF DEPOSIT AMOUNT IS 0 (ZERO:

        if (depositAmountValue == 0) {
            redirectAttributes.addFlashAttribute("error", "Deposit Amount Cannot be 0!");
            return "redirect:/app/dashboard";
        }


        // TODO: UPDATE BALANCE:

        currentBalance = accountRepository.getAccountBalance(user.getUser_id(), acc_id);

        newBalance = currentBalance + depositAmountValue;


        // Update Account:
        accountRepository.changeAccountBalanceById(newBalance, acc_id);

        // Log Successful Transaction
        transactRepository.logTransaction(acc_id, "deposit", depositAmountValue, "online", "success", "Deposit Transaction Successful", currentDateTime);
        redirectAttributes.addFlashAttribute("success", "Amount Deposited Successfully");

        return "redirect:/app/dashboard";


    }


    // End of Deposits


    @PostMapping("/transfer")
    public String transfer(@RequestParam("transfer_from") String transfer_from,
                           @RequestParam("transfer_to") String transfer_to,
                           @RequestParam("transfer_amount") String transfer_amount,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {

        //TODO: CHECK FOR EMPTY FIELDS!

        if(transfer_from.isEmpty() || transfer_to.isEmpty() || transfer_amount.isEmpty()){

            redirectAttributes.addFlashAttribute("error", "Oops! Neither Accounts Cannot be Empty :(");

            return "redirect:/app/dashboard";


        }
        //TODO: CONVERT VARIABLES:

        int transferFromId= Integer.parseInt(transfer_from);
        int transferToId= Integer.parseInt(transfer_to);
        double transferAmount= Double.parseDouble(transfer_amount);

        // TODO: CHECK IF TRANSFERRING INTO THE SAME ACCOUNT:

        if(transferFromId == transferToId){

            redirectAttributes.addFlashAttribute("error", "Please, choose a different Account");

            return "redirect:/app/dashboard";
        }


        //TODO: CHECK FOR 0 VALUES:

        if(transferAmount == 0){

            redirectAttributes.addFlashAttribute("error", "Transfer amount must be more than 0!");

            return "redirect:/app/dashboard";

        }


        // TODO: TO GET LOGGED IN USER:

        user= (User)session.getAttribute("user");


        // TODO: GET CURRENT BALANCE:

        double currentBalanceOfTransferringFrom= accountRepository.getAccountBalance(user.getUser_id(), transferFromId);

        double currentBalanceOfTransferringTo= accountRepository.getAccountBalance(user.getUser_id(), transferToId);

        //TODO: SET NEW BALANCE:


        double newBalanceOfAccountTransferringFrom= currentBalanceOfTransferringFrom - transferAmount;

        // TODO: CHECK IF PAYMENT AMOUNT IS MORE THAN CURRENT BALANCE:
        if(newBalanceOfAccountTransferringFrom < transferAmount){
            //Log Failed Transaction :(
            transactRepository.logTransaction(transferFromId, "transfer", transferAmount, "online", "failed", "Insufficient Funds", currentDateTime);
            redirectAttributes.addFlashAttribute("error", "Oops! Insufficient Funds to perfom this transfer");
            return "redirect:/app/dashboard";
        }


        double newBalanceOfAccountTransferringTo= currentBalanceOfTransferringTo + transferAmount;


        //Changing the balance of the Account Transferring Form
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringFrom,transferFromId);

        //Changing The Balance of the Account Transferring To:
        accountRepository.changeAccountBalanceById(newBalanceOfAccountTransferringTo, transferToId);

        //Success Message for the transference

        // Log Succesful Trasaction:
        transactRepository.logTransaction(transferFromId, "transfer", transferAmount, "online", "success", "Transfer Transaction Successful", currentDateTime);
        redirectAttributes.addFlashAttribute("success", "Amount Transferred Successfully!");
        return "redirect:/app/dashboard";

    }

    // End of Transfer Method

    @PostMapping("/withdraw")
    public String withdraw(@RequestParam("withdrawal_amount")String withdrawalAmount,
                           @RequestParam("account_id")String accountId,
                           HttpSession session,
                           RedirectAttributes redirectAttributes){


        //TODO: CHECK FOR EMPTY VALUES:

        if (withdrawalAmount.isEmpty()|| accountId.isEmpty()) {

            redirectAttributes.addFlashAttribute("error", "Accounts cannot be empty!");

            return "redirect:/app/dashboard";
        }

        //TODO: COVERT VARIABLES;

        double withdrawal_amount= Double.parseDouble(withdrawalAmount);
        int account_id= Integer.parseInt(accountId);

        //TODO: CHECK FOR 0 VALUES:

        if(withdrawal_amount == 0){

            redirectAttributes.addFlashAttribute("error", "Amount must be more than 0!");

            return "redirect:/app/dashboard";

        }


        //TODO: GET LOGGED IN USER:

        user = (User) session.getAttribute("user");


        //TODO: GET CURRENT BALANCE:

        currentBalance= accountRepository.getAccountBalance(user.getUser_id(),account_id);


        // TODO: CHECK IF TRANSFER AMOUNT IS MORE THAN CURRENT BALANCE:
        if(currentBalance < withdrawal_amount){
            //Log Failed Transaction :(
            transactRepository.logTransaction(account_id, "withdrawal", withdrawal_amount, "online", "failed", "Insufficient Funds", currentDateTime);
            redirectAttributes.addFlashAttribute("error", "Oops! Insufficient Funds to perfom this transfer");
            return "redirect:/app/dashboard";
        }

        //TODO: SET NEW BALANCE:

        newBalance = currentBalance - withdrawal_amount;

        //TODO: UPDATE ACCOUNT BALANCE:

        accountRepository.changeAccountBalanceById(newBalance,account_id);

        // Log Successful Withdrawal:
        transactRepository.logTransaction(account_id, "withdrawal", withdrawal_amount, "online", "success", "Withdrawal Transaction Successful", currentDateTime);
        redirectAttributes.addFlashAttribute("success", "Withdraw made successfully! :) ");

        return "redirect:/app/dashboard";

    }


    // End of withdrawal Method yaay

    @PostMapping("/payment")
    public String payment(@RequestParam("beneficiary")String beneficiary,
                          @RequestParam("account_number")String account_number,
                          @RequestParam("account_id")String account_id,
                          @RequestParam("reference")String reference,
                          @RequestParam("payment_amount")String payment_amount,
                          HttpSession session,
                          RedirectAttributes redirectAttributes
    ){

        // TODO: CHECK FOR EMPTY VALUES:
        if(beneficiary.isEmpty()|| account_number.isEmpty()|| account_id.isEmpty()|| payment_amount.isEmpty()){

            redirectAttributes.addFlashAttribute("error", "There cannot be empty values!");
            return "redirect:/app/dashboard";

        }

        // TODO: CONVERT VARIABLES:
        int accountID = Integer.parseInt(account_id);
        double paymentAmount = Double.parseDouble(payment_amount);


        // TODO: CHECK FOR O (ZERO) VALUES:
        if(paymentAmount == 0){

            redirectAttributes.addFlashAttribute("error", "Values must be greater than 0 (Zero)!");
            return "redirect:/app/dashboard";
        }


        // TODO: GET LOGGED IN USER:
        user= (User) session.getAttribute("user");


        // TODO: GET CURRENT BALANCE:
        currentBalance = accountRepository.getAccountBalance(user.getUser_id(),accountID);


        // TODO: CHECK IF PAYMENT AMOUNT IS MORE THAN CURRENT BALANCE:
        if(currentBalance < paymentAmount){

            //Log Failed Transaction :(
            transactRepository.logTransaction(accountID, "payment", paymentAmount, "online", "failed", "Insufficient Funds", currentDateTime);
            redirectAttributes.addFlashAttribute("error", "Oops! Insufficient Funds to perfom this payment");
            return "redirect:/app/dashboard";
        }

        // TODO: SET NEW BALANCE FOR ACCOUNT PAYING FROM:
        newBalance = currentBalance - paymentAmount;


        // TODO: MAKE PAYMENT:

        paymentRepository.makePayment(accountID, beneficiary,account_number, paymentAmount, reference, "success", "Payment Successful!",currentDateTime);


        // TODO: UPDATE ACCOUNT PAYING FROM:
        accountRepository.changeAccountBalanceById(newBalance, accountID);

        //Log Successful Transaction
        transactRepository.logTransaction(accountID, "payment", paymentAmount, "online", "success", "Payment Transaction Successful", currentDateTime);
        redirectAttributes.addFlashAttribute("success", "Payment Successful!");
        return "redirect:/app/dashboard";


    }

}