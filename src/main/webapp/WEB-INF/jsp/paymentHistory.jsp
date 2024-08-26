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
  <!-- Header -->
     <header class="main-page-header mb-3">
         <div class="container d-flex align-items-center">
             <div class="company-name">
                 <h2>Bank Account Demo</h2>
             </div>

             <nav class="navigation">
                 <ul class="list-unstyled mb-0">
                     <li><a href="#">Dashboard</a></li>
                     <li><a href="#">Payment History</a></li>
                     <li><a href="#">Transaction History</a></li>
                 </ul>
             </nav>

             <div class="display-name ml-auto text-white">
                 <i class="fas fa-circle circle"></i> Welcome: <span>${user.first_name} ${user.last_name}</span>
             </div>

             <a href="/logout" class="btn btn-sm text-white">
                 <i class="fas fa-sign-out me-2"></i>Sign out
             </a>
         </div>
     </header>

     <!--Container-->

     <div>

       <c:if test= "${requestScope.payment_history !=null}">

          <!--Payment History Table-->

          <table class="table text-center table-striped" style="background-color: #f0f8ff;">


               <tr>

                   <th>Record Number</th>
                   <th>Beneficiary</th>
                   <th>Beneficiary Account NUmber</th>
                   <th>Amount</th>
                   <th>Status</th>
                   <th>Reference</th>
                   <th>Reason Code</th>
                   <th>Created at</th>

               </tr>

          <!--Loop Through Payment History Records-->
          <c:forEach items= "${requestScope.payment_history}" var= "payments">

               <tr>

                  <th>${payments.payment_id}</th>
                  <th>${payments.beneficiary}</th>
                  <th>${payments.beneficiary_acc_no}</th>
                  <th>${payments.amount}</th>
                  <th>${payments.status}</th>
                  <th>${payments.reference_no}</th>
                  <th>${payments.reason_code}</th>
                  <th>${payments.created_at}</th>

               </tr>
          </c:forEach>
          <!--End Of Loop Through Payment History Records-->

          </table>
          <!--End of Payment History Table-->
       </c:if>

     </div>

     <!--End of Container-->






</body>

</html>
