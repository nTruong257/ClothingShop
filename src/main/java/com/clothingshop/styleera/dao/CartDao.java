package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.CartItem;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CartDao {
    public List<CartItem> getCartItems(int userId){
        Jdbi jdbi = JDBIConnector.getJdbi();
        String sql = "SELECT \n" +
                "                    ci.cart_item_id,\n" +
                "                    p.product_id,\n" +
                "                    v.variant_id,\n" +
                "                    p.product_name,\n" +
                "                    p.price,\n" +
                "                    ci.quantity,\n" +
                "                    (p.price * ci.quantity) AS total_price,\n" +
                "                    img.path AS image_path\n" +
                "                FROM CartItem ci\n" +
                "                JOIN Variants v ON ci.variant_id = v.variant_id\n" +
                "                JOIN Products p ON v.product_id = p.product_id\n" +
                "                LEFT JOIN Images img \n" +
                "                       ON img.product_id = p.product_id AND img.is_thumbnail = 1\n" +
                "                WHERE ci.user_id = ?\n" +
                "                ORDER BY ci.updated_at DESC\n";

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind(0, userId)
                        .mapToBean(CartItem.class)
                        .list()
        );
    }


}
