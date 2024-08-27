package com.demo_bank_v1.interceptors;

import com.demo_bank_v1.models.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Component
public class AppInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("In Pre Handle Interceptor Method");

        if (request.getRequestURI().startsWith("/app")) {
            // Obtener la sesión
            HttpSession session = request.getSession();

            // Obtener el token y el usuario almacenados en la sesión
            String token = (String) session.getAttribute("token");
            User user = (User) session.getAttribute("user");

            // Validar que el token y el usuario estén presentes en la sesión
            if (token == null || user == null) {
                response.sendRedirect("/login");  // Redirigir a la página de login si falta algún atributo :)
                return false;
            }
        }

        return true;  // Continuar con la solicitud si todo es válido
    }
}
