<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js" defer></script>
    <script src="https://kit.fontawesome.com/4220aaf6e4.js" crossorigin="anonymous" defer></script>

    <style>
        /* Estilos específicos adaptados para JSP */
        * {
            box-sizing: border-box;
            font-family: 'Courier New', Courier, monospace;
        }

        body {
            background-color: rgb(255, 174, 24);

            height: 100vh;
            background-size: cover;
        }

        .container {
            margin-top: 30px;
        }

        .main-page-header {
            background-color: rgb(35, 175, 185);
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 1px 3px 6px blue;
        }

        .main-page-header .company-name {
            font-weight: 300;
            white-space: nowrap;
        }

        .navigation {
            margin-left: 20px;
            white-space: nowrap;
        }

        .navigation li {
            display: inline-block;
            list-style-type: none;
            margin: 0px 15px;
            white-space: nowrap;
        }

        .navigation li a {
            color: white;
            text-decoration: none;
            white-space: nowrap;
        }

        .navigation li a:hover {
            text-decoration: underline;
            white-space: nowrap;
        }

        .display-name {
            color: white;
            font-weight: 600;
            display: flex;
            align-items: center;
            white-space: nowrap;
        }

        .circle {
            color: white;
            margin-right: 5px;
        }

        .display-name span {
            white-space: nowrap;
            margin-right: 20px;
        }

        .btn {
            margin-right: 20px;
        }

        .transact-btn {
            background-color: #ffb114;
            border: 1px solid #543800;
            color: white;
            margin-top: 50px;
            padding: 15px 30px;
            border-radius: 5px;
            width: 200px;
            color: white;
            box-shadow: 0px 3px 6px blue;
            text-transform: uppercase;
            transition: background-color 0.3s, color 0.3s;
        }

        .transact-btn:hover {
            background-color: transparent;
            color: #ffb114;
        }

        .account-btn {
            background-color: #ff4e00;
            border: 1px solid #543800;
            color: white;
            margin-top: 50px;
            padding: 15px 30px;
            border-radius: 5px;
            width: 200px;
            color: white;
            box-shadow: 0px 3px 6px blue;
            text-transform: uppercase;
            transition: background-color 0.3s, color 0.3s;
        }

        .account-btn:hover {
            background-color: transparent;
            color: #ff4e00;
        }

        .offcanvas {
            background-image: url("<%= request.getContextPath() %>/images/offcanvas2.jpg");
            height: 100vh;
            background-size: cover;
        }

        .pay-btn {
            background-color: #ffb114;
            border: 1px solid #543800;
            color: white;
            margin-top: 10px;
            padding: 15px 30px;
            border-radius: 5px;
            width: 92px;
            color: white;
            box-shadow: 0px 3px 6px blue;
            text-transform: uppercase;
            transition: background-color 0.3s, color 0.3s;
        }

        .pay-btn:hover {
            background-color: transparent;
            color: #ff4e00;
        }

        .payment-card, .transfer-card, .deposit-card, .withdraw-card {
            display: none;
        }

        .btn-md {
            padding: 15px 15px;
            font-size: 15px;
            width: 100%;
            max-width: 120px;
            margin-left: 5px;
        }

        .btn-pay {
            padding: 15px 15px;
            font-size: 15px;
            width: 100%;
            max-width: 120px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <!-- Sort Options -->
                <div>
                    <a href="${pageContext.request.contextPath}/transact/transactions?order=asc">Sort Ascending</a> |
                    <a href="${pageContext.request.contextPath}/transact/transactions?order=desc">Sort Descending</a>
                </div>

                <!-- Filter Options -->
                <form action="${pageContext.request.contextPath}/transact/filteredTransactions" method="get">
                    <label for="type">Transaction Type:</label>
                    <select name="type" id="type">
                        <option value="">All</option>
                        <option value="deposit">Deposit</option>
                        <option value="withdrawal">Withdrawal</option>
                        <option value="transfer">Transfer</option>
                        <option value="payment">Payment</option>
                    </select>
                    <label for="start_date">Start Date:</label>
                    <input type="date" name="start_date" id="start_date">
                    <label for="end_date">End Date:</label>
                    <input type="date" name="end_date" id="end_date">
                    <button type="submit">Filter</button>
                </form>

                <!-- Transaction Table -->
                <c:if test="${not empty transact_history}">
                    <table class="table text-center table-striped" style="background-color: #f0f8ff;">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Transaction Type</th>
                                <th>Amount</th>
                                <th>Source</th>
                                <th>Status</th>
                                <th>Reason Code</th>
                                <th>Created at</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="transactHistory" items="${transact_history}">
                                <tr>
                                    <td>${transactHistory.transaction_id}</td>
                                    <td>${transactHistory.transaction_type}</td>
                                    <td>${transactHistory.amount}</td>
                                    <td>${transactHistory.source}</td>
                                    <td>${transactHistory.status}</td>
                                    <td>${transactHistory.reason_code}</td>
                                    <td>${transactHistory.created_at}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty transact_history}">
                    <p>No transactions found.</p>
                </c:if>

                <!-- Pagination Links -->
                <c:if test="${totalPages > 1}">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/transact/paginatedTransactions?page=${i-1}&size=10">${i}</a></li>
                            </c:forEach>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
