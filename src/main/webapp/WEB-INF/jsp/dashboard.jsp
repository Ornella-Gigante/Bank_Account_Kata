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

     <!-- Transaction Offcanvas -->
     <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
         <div class="offcanvas-header">
             <h5 class="offcanvas-title text-white" id="offcanvasExampleLabel" style="color: white; font-weight: bold">Transaction</h5>
             <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
         </div>

         <div class="offcanvas-body">
             <small class="card-text mb-3 text-white" style="color: white; font-weight: bold">Please, choose an option below</small>
             <select name="transact-type" class="form-control my-3" id="transact-type">
                 <option value="">-- Select Transaction Type--</option>
                 <option value="payment">Payment</option>
                 <option value="transfer">Transfer</option>
                 <option value="deposit">Deposit</option>
                 <option value="withdraw">Withdraw</option>

             </select>

            <!-- Payments Form Card -->

            <div class="card payment-card" style="display: none;">
                <div class="card-body">

                <!--Payment Form-->

                <form action= "/transact/payment" method="POST">

                    <div class="form-group mb-2">
                        <label for="beneficiary">Beneficiary</label>
                        <input type="text" name="beneficiary"  class="form-control" placeholder="Account Beneficiary name">
                    </div>
                    <div class="form-group mb-2">
                        <label for="account_number">Beneficiary Account Number</label>
                        <input type="text" name="account_number" id="account_number" class="form-control" placeholder="Enter Beneficiary Account No">
                    </div>

                    <div class="form-group">
                        <label for="select_account">Select Account</label>
                        <select name="account_id" id="select_account" class="form-control">
                            <option value="">-- Select Account--</option>
                            <c:forEach items="${userAccounts}" var="selectAccount">
                                <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="reference">Reference</label>
                        <input type="text" name="reference" id="reference" class="form-control" placeholder="Enter Reference">
                    </div>
                    <div class="form-group mb-2">
                        <label for="payment_amount">Enter Payment Amount</label>
                        <input type="text" name="payment_amount" id="payment_amount" class="form-control" placeholder="Enter Payment Amount">
                    </div>
                    <div class="form-group mb-2">
                        <button class="pay-btn btn-md">Pay</button>
                    </div>

                 </form>

                 <--End of Payment Form-->

                </div>

                <!--End of Payment Form-->
            </div>

            <!--End of Payment Form card-->

          <!-- Transfer Form Card -->
          <div class="card transfer-card" style="display: none;">
              <div class="card-body">

                  <!-- Select the account that will make the transfer -->
                  <form action="/transact/transfer" method="POST">
                      <div class="form-group">
                          <label for="select_account_transfer_from">Select Account</label>
                          <select name="transfer_from" id="select_account_transfer_from" class="form-control">
                              <option value="">-- Select Account--</option>
                              <c:forEach items="${userAccounts}" var="selectAccount">
                                  <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                              </c:forEach>
                          </select>
                      </div>

                      <!-- Select the account that will receive the transfer -->
                      <div class="form-group">
                          <label for="select_account_transfer_to">Select Account</label>
                          <select name="transfer_to" id="select_account_transfer_to" class="form-control">
                              <option value="">-- Select Account--</option>
                              <c:forEach items="${userAccounts}" var="selectAccount">
                                  <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                              </c:forEach>
                          </select>
                      </div>

                      <div class="form-group mb-2">
                           <label for="">Enter Transfer Amount</label>
                           <input type="text" name="transfer_amount"  class="form-control" placeholder="Enter Transfer Amount">
                      </div>

                      <!-- Button Transfer -->
                      <div class="form-group mb-2">
                          <button type="submit" id="transfer_button" class="btn btn-md transact-btn">Transfer</button>
                      </div>
                  </form>

              </div>
          </div>





           <!-- Deposit Form Card -->
           <div class="card deposit-card" style="display: none;">
               <div class="card-body">
                   <form action="/transact/deposit" method="POST">
                       <div class="form-group">
                           <label for="select_account_deposit">Select Account</label>
                           <select name="account_id" id="select_account_deposit" class="form-control">
                               <option value="">-- Select Account--</option>
                               <c:forEach items="${userAccounts}" var="selectAccount">
                                   <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                               </c:forEach>
                           </select>
                       </div>
                       <div class="form-group mb-2">
                           <label for="deposit_amount">Enter Deposit Amount</label>
                           <input type="text" name="deposit_amount" id="deposit_amount" class="form-control" placeholder="Enter Deposit Amount">
                       </div>
                       <div class="form-group mb-2">
                           <button type="submit" class="pay-btn btn-md">Deposit</button>
                       </div>
                   </form>
               </div>
           </div>

            <!-- Withdraw Form Card -->
            <div class="card withdraw-card" style="display: none;">
                <div class="card-body">

                <!---ACCOUNT--->
                <form action="/transact/withdraw" method="POST" class="deposit-form">
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <select name="account_id" id="" class="form-control">
                            <option value="">-- Select Account--</option>
                            <c:forEach items="${userAccounts}" var="selectAccount">
                                <option value="${selectAccount.account_id}">${selectAccount.account_name}</option>
                            </c:forEach>
                        </select>
                    </div>

                <!--END ACCOUNT-->


                <!--AMOUNT-->

                    <div class="form-group mb-2">
                        <label for="">Enter Withdrawal Amount</label>
                        <input type="text" name="withdrawal_amount" class="form-control" placeholder="Enter Withdrawal Amount">
                    </div>
                    <div class="form-group mb-2">
                        <button class="pay-btn btn-md">Withdraw</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

                <!--END AMOUNT-->

    <!-- Add Accounts Offcanvas: pulls from the right -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasRightLabel" class="offcanvas-title text-white" style="color: white; font-weight: bold">Create an Account</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <!-- Card: Accounts Form Card -->
            <div class="card">
                <div class="card-body">
                    <!-- Card Body -->
                    <form action="/account/create_account" method="POST" class="add-account-form">
                        <!-- Form Group -->
                        <div class="form-group mb-3">
                            <label for="account_name">Enter the account name</label>
                            <input type="text" name="account_name" id="account_name" class="form-control" placeholder="Enter Account Name...">
                        </div>
                        <!-- End of Form Group -->

                        <!-- Form Group -->
                        <div class="form-group mb-3">
                            <label for="account_type">Select Account Type</label>
                            <select name="account_type" id="account_type" class="form-control">
                                <option value="">-- Select Account Type --</option>
                                <option value="check">Check</option>
                                <option value="savings">Savings</option>
                                <option value="business">Business</option>
                            </select>
                        </div>
                        <!-- End of Form Group -->

                        <!-- Button -->
                        <div class="form-group mb-2">
                            <button class="pay-btn btn-pay">Add</button>
                        </div>
                        <!-- End of Button -->
                    </form>
                </div>
                <!-- End of card Body -->
            </div>
            <!-- End of Card: Accounts Form Card -->
        </div>
    </div>
    <!-- End Of Right Side of Canvas -->

    <!-- Container -->
    <div class="container">
        <!-- Success Form -->
        <c:if test="${success != null}">
            <div class="alert alert-info text-center border border-info">
                <b>${success}</b>
            </div>
        </c:if>
        <!-- Success Logout Form -->
        <c:if test="${error != null}">
            <div class="alert alert-danger text-center border border-danger">
                <b>${error}</b>
            </div>
        </c:if>
    </div>
    <!-- End of container -->

     <!-- Include Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.min.js"></script>

        <!-- JavaScript for showing/hiding transaction cards -->
        <!--This works once the doc is already uploaded-->
        <script>
            $(document).ready(function() {
                $('#transact-type').on('change', function() {
                    var selectedType = $(this).val();
                    <!--Hide all the tarjetas when they are not selected-->
                    $('.payment-card, .transfer-card, .deposit-card, .withdraw-card').hide();
                    <!--Shows each tarjeta when its selected-->
                    if (selectedType === 'payment') {
                        $('.payment-card').show();
                    } else if (selectedType === 'transfer') {
                        $('.transfer-card').show();
                    } else if (selectedType === 'deposit') {
                        $('.deposit-card').show();
                    } else if (selectedType === 'withdraw') {
                        $('.withdraw-card').show();
                    }
                });
            });
        </script>

    <c:choose>
        <c:when test="${fn:length(userAccounts) > 0}">
            <div class="container d-flex">
                <button class="account-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                    <i class="fa fa-credit-card"></i> Add New Account
                </button>
                <button class="transact-btn ms-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                    <i class="fa fa-wallet"></i> Transact
                </button>
            </div>
            <div class="container d-flex py-3">
                <h2 class="me-auto">Total Accounts Balance:</h2>
                <h2 style="margin-left: auto;">
                    <c:if test="${totalBalance != null}">
                        <c:out value="${totalBalance}"/>
                    </c:if>
                </h2>
            </div>
            <div class="container">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <c:forEach var="account" items="${userAccounts}">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-heading${account.account_number}">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${account.account_number}" aria-expanded="false" aria-controls="flush-collapse${account.account_number}">
                                    ${account.account_name} - ${account.account_type}
                                </button>
                            </h2>
                            <div id="flush-collapse${account.account_number}" class="accordion-collapse collapse" aria-labelledby="flush-heading${account.account_number}" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <p><strong>Account Number:</strong> ${account.account_number}</p>
                                    <p><strong>Account Name:</strong> ${account.account_name}</p>
                                    <p><strong>Account Type:</strong> ${account.account_type}</p>
                                    <p><strong>Created at:</strong> ${account.created_at}</p>
                                    <p><strong>Balance:</strong> ${account.balance}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- No Display Accounts -->
            <div class="container">
                <div class="card no-accounts-card">
                    <div class="card-body">
                        <h1 class="card-title">
                            <i class="fas fa-ban text-danger"></i> NO Registered Accounts
                        </h1>
                        <div class="card-text">
                            Ooops! Seems like you don't have any registered accounts yet! <br>
                            Please click below to register/add a new account.
                        </div>
                        <br>
                        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                            <i class="fa fa-credit-card"></i> New Account
                        </button>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>
