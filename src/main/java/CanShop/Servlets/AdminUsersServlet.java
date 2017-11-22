package CanShop.Servlets;

import CanShop.DAO.UserDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO  userDAO = new UserDAO();
        List usersList = userDAO.getAllUsers();
        req.setAttribute("usersList", usersList);
        req.getRequestDispatcher("/admin/admin_users.jsp").forward(req, resp);
    }

}
