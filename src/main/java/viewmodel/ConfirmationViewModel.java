package viewmodel;

import business.ApplicationContext;
import business.order.LineItem;
import business.order.OrderDao;
import business.order.OrderDetails;

import javax.servlet.http.HttpServletRequest;

public class ConfirmationViewModel extends BaseViewModel {

    private Long orderId;
    private OrderDetails orderDetails;
    private LineItem lineItem;
    protected OrderDao orderDao = ApplicationContext.INSTANCE.getOrderDao();

    public ConfirmationViewModel(HttpServletRequest request) {
        super(request);

        this.orderId = (Long) session.getAttribute("customerOrderId");
        this.orderDetails = (OrderDetails) session.getAttribute("orderDetails");
        this.lineItem = (LineItem) session.getAttribute("lineItem");
    }

    public String astericks(String s) {
        String ccNum = s.substring(s.length() - 4);
        StringBuilder sb = new StringBuilder(s.length());
        for (int i = 0; i < s.length() - 4; i++) {
            sb.append('*');
        }
        return sb.toString() + ccNum;
    }

    public Long getOrderId() {
        return orderId;
    }

    public OrderDetails getOrderDetails() {
        return orderDetails;
    }

    public LineItem getLineItem() {
        return lineItem;
    }
}
