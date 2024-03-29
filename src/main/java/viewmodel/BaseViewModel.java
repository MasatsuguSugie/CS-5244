package viewmodel;

import business.ApplicationContext;
import business.book.BookDao;
import business.cart.ShoppingCart;
import business.category.Category;
import business.category.CategoryDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class BaseViewModel {

    // We're moving the initialization parameters to the view model
    private static final String SITE_IMAGE_PATH = "images/site/";
    private static final String BOOK_IMAGE_PATH = "images/books/";

    // Every view model knows the request and session
    protected HttpServletRequest request;
    protected HttpSession session;

    protected CategoryDao categoryDao = ApplicationContext.INSTANCE.getCategoryDao();
    protected BookDao bookDao = ApplicationContext.INSTANCE.getBookDao();

    // The header (on all pages) needs to know the categories
    private List<Category> categories;

    // The header (on all pages) needs to know information about the shopping cart
    private ShoppingCart cart;


    public BaseViewModel(HttpServletRequest request) {
        this.request = request;
        this.session = request.getSession(true);
        this.categories = initCategories();
        this.cart = initCart();
    }

    private List<Category> initCategories() {
        // If a category list already exists, we will use it
        List<Category> result = (List<Category>) request.getServletContext().getAttribute("categories");
        if (result == null) {
            result = categoryDao.findAll();
            request.getServletContext().setAttribute("categories", result);
        }
        return result;
    }

    private ShoppingCart initCart() {
        // If a cart already exists, we will use it
        ShoppingCart result = (ShoppingCart) request.getSession().getAttribute("cart");
        if (result == null) {
            result = new ShoppingCart();
            request.getSession().setAttribute("cart", result);
        }
        return result;
    }

    public String getSiteImagePath() {
        return SITE_IMAGE_PATH;
    }

    public String getBookImagePath() {
        return BOOK_IMAGE_PATH;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public ShoppingCart getCart() { return cart; }

}
