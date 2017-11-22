/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CanShop.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeLanguageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String language = req.getParameter("language");
        System.out.println(language);
        Cookie lang = new Cookie("lang", language);
        lang.setPath("/");
        lang.setMaxAge(365*24*60*60);
        HttpSession session = req.getSession();
        session.setAttribute("lang", language);
        resp.addCookie(lang);
        resp.sendRedirect("Home");
        
    }
    
}
