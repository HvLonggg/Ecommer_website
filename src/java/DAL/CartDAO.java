package DAL;

import Model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDAO extends DBContext {

    public Cart getCartByUserId(int userId) {
        String sql = "SELECT * FROM Cart WHERE user_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setUserId(rs.getInt("user_id"));
                cart.setCreatedAt(rs.getTimestamp("created_at"));
                return cart;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createCart(int userId) {
        String sql = "INSERT INTO Cart (user_id, created_at) VALUES (?, GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi tạo giỏ hàng cho người dùng ID " + userId + ": " + e.getMessage());
        }
    }

    public void DeleteCart(int id) {
        String sql = "delete from Cart where id=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

}
