package viewmodel;

import business.book.Book;
import business.category.Category;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class CategoryViewModel extends BaseViewModel {

    private Category selectedCategory;
    private List<Book> selectedCategoryBooks;

    public CategoryViewModel(HttpServletRequest request) {
        super(request);
        String categoryName = request.getParameter("category");
        selectedCategory = (isValidName(categoryName)) ?
                categoryDao.findByName(categoryName) :
                categoryDao.findByCategoryId(1001);
        request.getSession().setAttribute("selectedCategory", selectedCategory);
        selectedCategoryBooks = bookDao.findByCategoryId(selectedCategory.getCategoryId());
    }

    private boolean isValidName(String name) {
        if (name == null) {
            return false;
        } else if (categoryDao.findByName(name) == null) {
            return false;
        }

        return true;
    }

    public Category getSelectedCategory() {
        return selectedCategory;
    }

    public List<Book> getSelectedCategoryBooks() {
        return selectedCategoryBooks;
    }

}
