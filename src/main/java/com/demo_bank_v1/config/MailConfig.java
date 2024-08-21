package com.demo_bank_v1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import java.util.Properties;

public class MailConfig {


    @Bean
    public static JavaMailSenderImpl getMailConfig(){

        JavaMailSenderImpl emailConfig = new JavaMailSenderImpl();

        // Obtener y configurar la contraseña desde la variable de entorno
        String password = System.getenv("entorno");
        System.out.println("Password obtenida: " + password);
        emailConfig.setPassword(password);

        // Set Properties
        Properties props = emailConfig.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");


        // Set Mail Credentials
        emailConfig.setHost("sandbox.smtp.mailtrap.io");
        emailConfig.setPort(2525);
        emailConfig.setUsername("a92865441674e0");
        emailConfig.setPassword("35b81394f6254d");

        return emailConfig;


    }
}