package com.example.product.controller;

import com.example.product.dao.ProductDAO;
import com.example.product.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products", "/"})
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("product-form.jsp").forward(req, resp);
                break;
            case "edit":
                int editId = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("product", productDAO.selectById(editId));
                req.getRequestDispatcher("product-form.jsp").forward(req, resp);
                break;
            case "delete":
                int delId = Integer.parseInt(req.getParameter("id"));
                productDAO.delete(delId);
                resp.sendRedirect("products");
                break;
            default:
                req.setAttribute("productList", productDAO.selectAll());
                req.getRequestDispatcher("product-list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String idParam = req.getParameter("id");
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        if (idParam == null || idParam.trim().isEmpty()) {
            productDAO.insert(new Product(name, price, quantity));
        } else {
            int id = Integer.parseInt(idParam);
            productDAO.update(new Product(id, name, price, quantity));
        }
        resp.sendRedirect("products");
    }
}
