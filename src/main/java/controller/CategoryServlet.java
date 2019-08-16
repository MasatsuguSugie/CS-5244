package controller;

import viewmodel.CategoryViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Category", urlPatterns = {"/category"})
public class CategoryServlet extends BookstoreServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("p", new CategoryViewModel(request));
        forwardToJsp(request, response, "/category");
    }
}
