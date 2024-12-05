<%@page import="Model.CartItem"%>
<%@page import="Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category" %>
<%@page import="Model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <style>
            /* General styles */
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 900px;
                margin: 30px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #f26522;
                font-size: 32px;
                margin-bottom: 20px;
            }

            /* Alert Message */
            .alert {
                margin-top: 20px;
                padding: 15px;
                border-radius: 5px;
                background-color: #f44336;
                color: white;
                font-size: 16px;
                text-align: center;
            }

            .alert-danger {
                background-color: #f44336;
            }

            /* Giỏ hàng */
            table {
                width: 100%;
                margin-top: 30px;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 12px 15px;
                text-align: center;
                border: 1px solid #ddd;
                font-size: 16px;
            }

            th {
                background-color: #f26522;
                color: white;
                font-weight: bold;
            }

            td {
                background-color: #fafafa;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            a {
                text-decoration: none;
                color: #f26522;
            }

            a:hover {
                color: #d4530b;
            }

            button {
                background-color: #f26522;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #d4530b;
            }

            /* Tổng tiền */
            h3 {
                color: #f26522;
                font-size: 24px;
                margin-top: 20px;
                text-align: right;
            }

            a.checkout {
                background-color: #f26522;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                display: inline-block;
                text-align: center;
                margin-top: 10px;
                text-decoration: none;
                font-size: 18px;
            }

            a.checkout:hover {
                background-color: #d4530b;
            }

            /* Footer */
            .footer_section {
                background-color: #333;
                color: white;
                padding: 40px 0;
                text-align: center;
            }

            .footer_section a {
                color: #f26522;
                text-decoration: none;
            }

            .footer_section a:hover {
                color: #d4530b;
            }

            .footer_menu ul {
                list-style: none;
                padding: 0;
                text-align: center;
            }

            .footer_menu ul li {
                display: inline;
                margin: 10px;
            }

            .footer_menu ul li a {
                color: #ffffff;
                text-decoration: none;
            }

            .footer_menu ul li a:hover {
                color: #f26522;
            }

            /* Thanh tìm kiếm */
            .input-group {
                width: 80%;
                margin: 20px auto;
                padding: 10px;
                border-radius: 5px;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .input-group-append button {
                background-color: #f26522;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            .input-group-append button:hover {
                background-color: #d4530b;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <%-- Hiển thị thông báo lỗi nếu có --%>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>

            <h1>Giỏ hàng của bạn</h1>
            <table>
                <tr>
                    <th>STT</th>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Tổng</th>
                    <th>Hành động</th>
                </tr>
                <%
                    // Lấy danh sách sản phẩm trong giỏ hàng
                    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
                    int index = 1;
                    double total = 0;
                    for (CartItem item : cartItems) {
                        double itemTotal = item.getPrice() * item.getQuantity();
                        total += itemTotal;
                %>
                <tr>
                    <td><%= index++%></td>
                    <td><%= item.getProduct().getName()%></td>
                    <td><%= item.getQuantity()%></td>
                    <td><%= item.getPrice()%> VND</td>
                    <td><%= item.getQuantity() * item.getPrice()%> VND</td>
                    <td>
                        <a href="deleteCartItem?id=<%= item.getId()%>">Xóa</a>
                    </td>
                </tr>
                <% }%>
            </table>

            <h3>Tổng tiền: <%= total%> VND</h3>
            <a href="CheckoutServlet" class="checkout">Thanh toán</a>
            <a href="/tradingjdbc_demo/listhome" class="back-home">Quay lại trang chủ</a>
        </div>
    </body>


</html>