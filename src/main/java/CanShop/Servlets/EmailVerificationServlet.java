package CanShop.Servlets;

import CanShop.DAO.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailVerificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        int userId = Integer.parseInt(req.getParameter("i"));
        String hash = req.getParameter("h");
        if(hash.equals(userDAO.getUserHash(userId))){
            userDAO.activateUser(userId);
            req.getRequestDispatcher("Home").forward(req, resp);
        }
        else{
            req.getRequestDispatcher("/EmailVerError.jsp").forward(req, resp);
        }
    }
    
    
}
