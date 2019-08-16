package controller;

import business.ApplicationContext;
import business.book.Book;
import business.cart.ShoppingCart;
import business.category.Category;
import viewmodel.CartViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Cart", urlPatterns = {"/cart"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class CartServlet extends BookstoreServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        if ("add".equals(action)) {
            String bookIdText = request.getParameter("bookId");
            long bookId = Long.parseLong(bookIdText);
            Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
            cart.addItem(book);
            boolean isAjaxRequest =
                    "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
            if (isAjaxRequest) {
                String jsonString = "{\"cartCount\": " + cart.getNumberOfItems() + "}";
                response.setContentType("application/json");
                response.getWriter().write(jsonString);
                response.flushBuffer();
            } else
                // using post-redirect-get pattern
                response.sendRedirect(request.getContextPath() + "/category?category=" + request.getParameter("category"));
        } else if ("increment".equals(action)) {
            String bookIdText = request.getParameter("bookId");
            long bookId = Long.parseLong(bookIdText);
            Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
            cart.increment(book);
            response.sendRedirect(request.getContextPath() + "/cart");
        } else if ("decrement".equals(action)) {
            String bookIdText = request.getParameter("bookId");
            long bookId = Long.parseLong(bookIdText);
            Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
            cart.decrement(book);
            response.sendRedirect(request.getContextPath() + "/cart");
        } else if ("return".equals(action)) {
            Category object = (Category) request.getSession().getAttribute("selectedCategory");
            String category = object.getName();
            if (category == null) {
                object = ApplicationContext.INSTANCE.getCategoryDao().findByCategoryId(1001);
                String categoryPlus = object.getName();
                response.sendRedirect(request.getContextPath() + "/category?category=" + categoryPlus);
            }
            response.sendRedirect(request.getContextPath() + "/category?category=" + category);
        } else if ("clear".equals(action)) {
            cart.clear();
            response.sendRedirect(request.getContextPath() + "/cart");
        } else {
            // ...
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("p", new CartViewModel(request));
        forwardToJsp(request, response, "/cart");
    }
}
