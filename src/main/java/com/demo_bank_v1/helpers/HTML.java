package com.demo_bank_v1.helpers;

public class HTML {

    public static String htmlEmailTemplate(String token, String code) {
        String url = "http://localhost:8080/verify?token=" + token + "&code=" + code;

        return "<!DOCTYPE html>\n" +
                "<html lang='en'>\n" +
                "<head>\n" +
                "    <meta charset='UTF-8'>\n" +
                "    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\n" +
                "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>\n" +
                "    <title>Bank Account Demo - Email Verification</title>\n" +
                "    <style>\n" +
                "        * {\n" +
                "            box-sizing: border-box;\n" +
                "            font-family: 'Courier New', Courier, monospace;\n" +
                "        }\n" +
                "        body {\n" +
                "            height: 100vh;\n" +
                "            background-color: rgb(227, 236, 236);\n" +
                "            display: flex;\n" +
                "            align-items: center;\n" +
                "            justify-content: center;\n" +
                "        }\n" +
                "        .wrapper {\n" +
                "            width: 550px;\n" +
                "            padding: 15px;\n" +
                "            background-color: white;\n" +
                "            border-radius: 7px;\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "        .email-msg-header {\n" +
                "            font-size: 24px;\n" +
                "            color: rgb(0, 162, 255);\n" +
                "            margin-bottom: 20px;\n" +
                "        }\n" +
                "        .company-name {\n" +
                "            font-size: 40px;\n" +
                "            color: grey;\n" +
                "            margin-bottom: 20px;\n" +
                "        }\n" +
                "        .welcome-text {\n" +
                "            font-size: 16px;\n" +
                "            margin-bottom: 20px;\n" +
                "        }\n" +
                "        .verify-account-btn {\n" +
                "            padding: 15px 30px;\n" +
                "            background-color: rgb(0, 162, 255);\n" +
                "            color: white;\n" +
                "            text-decoration: none;\n" +
                "            border-radius: 5px;\n" +
                "            display: inline-block;\n" +
                "            margin-top: 20px;\n" +
                "        }\n" +
                "        .copy-right {\n" +
                "            font-size: 14px;\n" +
                "            color: grey;\n" +
                "            margin-top: 20px;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class='wrapper'>\n" +
                "        <div class='email-msg-header'>Welcome and Thank You for Choosing</div>\n" +
                "        <div class='company-name'>Bank Account Demo</div>\n" +
                "        <hr>\n" +
                "        <div class='welcome-text'>Your account has been successfully registered, please click below to verify your account.</div>\n" +
                "        <a href='" + url + "' class='verify-account-btn' role='button'>Verify Account</a>\n" +
                "        <div class='copy-right'>&copy; Copy Right 2024. All Rights Reserved.</div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>";
    }
}
