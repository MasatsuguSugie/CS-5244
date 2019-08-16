package business.order;

import java.sql.Connection;
import java.util.List;

public interface LineItemDao {

    public void create(Connection connection, long customerOrderId, long bookId, int quantity);

    public List<LineItem> findByCustomerOrderId(long customerOrderId);
}
