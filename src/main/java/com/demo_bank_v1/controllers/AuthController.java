package com.demo_bank_v1.controllers;

import com.demo_bank_v1.helpers.Token;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String getLogin(Model model) {
        System.out.println("In Login Page Controller");
        // Generar un token de seguridad único
        String token = Token.generateToken();
        // Enviar el token a la vista para que se incluya en el formulario de login
        model.addAttribute("token", token);
        model.addAttribute("PageTitle", "Login");
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("token") String token,  // Token esperado en la solicitud
                        Model model,
                        HttpSession session) {

        System.out.println("Attempting to login with email: " + email);

        try {
            // Validar campos de entrada
            if (email.isEmpty() || password.isEmpty()) {
                model.addAttribute("error", "Email or Password cannot be empty");
                return "login";
            }

            // Verificar si el email existe en la base de datos
            Optional<String> emailInDatabase = userRepository.getUserEmail(email);
            if (emailInDatabase.isEmpty()) {
                model.addAttribute("error", "Email not found");
                return "login";
            }

            // Obtener la contraseña de la base de datos
            Optional<String> passwordInDatabase = userRepository.getUserPassword(emailInDatabase.get());
            if (passwordInDatabase.isEmpty()) {
                model.addAttribute("error", "Internal Error: Password not found");
                return "error";
            }

            // Validar contraseña
            if (!BCrypt.checkpw(password, passwordInDatabase.get())) {
                model.addAttribute("error", "Incorrect Email or Password");
                return "login";
            }

            // Verificar si la cuenta del usuario está verificada
            Optional<Integer> verified = userRepository.isVerified(emailInDatabase.get());
            if (verified.isEmpty() || verified.get() != 1) {
                model.addAttribute("error", "This account is not verified. Please check your email to verify your account.");
                return "login";
            }

            // Obtener los detalles del usuario
            Optional<User> user = userRepository.getUserDetails(emailInDatabase.get());
            if (user.isEmpty()) {
                model.addAttribute("error", "Internal Error: User details not found");
                return "error";
            }

            // Configurar los atributos de sesión
            session.setAttribute("user", user.get());
            session.setAttribute("token", token);  // Guardar el token en la sesión
            session.setAttribute("authenticated", true);

            return "redirect:/app/dashboard";  // Redirigir al dashboard

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Internal Server Error: " + e.getMessage());
            return "error";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();  // Invalidar la sesión
        redirectAttributes.addFlashAttribute("logged_out", "Logged out successfully!");
        return "redirect:/login";  // Redirigir a la página de login
    }
}
