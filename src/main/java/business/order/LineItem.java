package business.order;

public class LineItem {

    private long customerOrderId;
    private long bookId;
    private int quantity;

    public LineItem(long customerOrderId, long bookId, int quantity) {
        this.customerOrderId = customerOrderId;
        this.bookId = bookId;
        this.quantity = quantity;
    }

    public long getCustomerOrderId() {
        return customerOrderId;
    }

    public long getBookId() {
        return bookId;
    }


    public int getQuantity() { return quantity; }

    @Override
    public String toString() {
        return "LineItem{" +
                "customerOrderId=" + customerOrderId +
                ", bookId=" + bookId +
                ", quantity=" + quantity +
                '}';
    }
}