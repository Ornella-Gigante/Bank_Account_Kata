<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap.bundle.js" defer></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="https://kit.fontawesome.com/4220aaf6e4.js" crossorigin="anonymous" defer></script>
    <script src="<%= request.getContextPath() %>/static/main.js" defer></script>
    <style>
        /* Estilos específicos adaptados para JSP */
        * {
            box-sizing: border-box;
            font-family: 'Courier New', Courier, monospace;
        }

        body {
            background-color: rgb(255, 174, 24);
            background-image: url("<%= request.getContextPath() %>/static/components/images/bank2.jpg");
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

        .payment-card {
            display: none;
        }

        .transfer-card {
            display: none;
        }

        .deposit-card {
            display: none;
        }

        .withdraw-card {
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

 <!-- Main Page Header -->
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
                <i class="fas fa-circle circle"></i> Welcome: <span>John Doe</span>
            </div>

            <a href="#" class="btn btn-sm text-white">
                <i class="fas fa-sign-out me-2"></i>Sign out
            </a>
        </div>
    </header>

    <!-- Start of Transact Canvas Body -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title text-white" id="offcanvasExampleLabel" style="color: white; font-weight: bold">Transaction</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">
            <small class="card-text mb-3 text-white" style="color: white; font-weight: bold">Please, choose an option below</small>
            <select name="transact-type" class="form-control my-3" id="transact-type">
                <option value="">-- Select Transaction Type</option>
                <option value="payment">Payment</option>
                <option value="transfer">Transfer</option>
                <option value="deposit">Deposit</option>
                <option value="withdraw">Withdraw</option>
            </select>

            <!-- Card: Payment Card -->
            <div class="card payment-card" style="display: none;">
                <div class="card-body">
                    <div class="form-group mb-2">
                        <label for="">Beneficiary</label>
                        <input type="text" name="beneficiary" class="form-control" placeholder="Account Beneficiary name">
                    </div>

                    <div class="form-group mb-2">
                        <label for="">Beneficiary Account Number</label>
                        <input type="text" name="account_number" class="form-control" placeholder="Enter Beneficiary Account No">
                    </div>

                    <div class="form-group">
                        <label for="">Select Account</label>
                        <select name="account-id" class="form-control">
                            <option value="">-- Select Account--</option>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="">Reference</label>
                        <input type="text" name="reference" class="form-control" placeholder="Enter Reference">
                    </div>

                    <div class="form-group mb-2">
                        <label for="">Enter Payment Amount</label>
                        <input type="text" name="payment_amount" class="form-control" placeholder="Enter Payment Amount">
                    </div>

                    <div class="form-group mb-2">
                        <button class="pay-btn btn-md">Pay</button>
                    </div>
                </div>
            </div>

            <!-- Card: Transfer Card -->
            <div class="card transfer-card" style="display: none;">
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <select name="account-id" class="form-control">
                            <option value="">-- Select Account--</option>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="">Enter Transfer Amount</label>
                        <input type="text" name="transfer_amount" class="form-control" placeholder="Enter Transfer Amount">
                    </div>

                    <div class="form-group mb-2">
                        <button class="pay-btn btn-md">Transfer</button>
                    </div>
                </div>
            </div>

            <!-- Card: Deposit Card -->
            <div class="card deposit-card" style="display: none;">
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <select name="account-id" class="form-control">
                            <option value="">-- Select Account--</option>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="">Enter Deposit Amount</label>
                        <input type="text" name="deposit_amount" class="form-control" placeholder="Enter Deposit Amount">
                    </div>

                    <div class="form-group mb-2">
                        <button class="pay-btn btn-md">Deposit</button>
                    </div>
                </div>
            </div>

            <!-- Card: Withdraw Card -->
            <div class="card withdraw-card" style="display: none;">
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Select Account</label>
                        <select name="account-id" class="form-control">
                            <option value="">-- Select Account--</option>
                        </select>
                    </div>

                    <div class="form-group mb-2">
                        <label for="">Enter Withdrawal Amount</label>
                        <input type="text" name="withdraw_amount" class="form-control" placeholder="Enter Withdrawal Amount">
                    </div>

                    <div class="form-group mb-2">
                        <button class="pay-btn btn-md">Withdraw</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Transact Canvas Body -->

    <!-- Right Side of Canvas -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
            <h5 id="offcanvasRightLabel" class="offcanvas-title text-white" style="color: white; font-weight: bold">Create an Account</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">

            <!--Card: Accounts Form Card-->

            <div class="card">

                <div class="card body">
                <!--Card Body-->
                    <form action="" class="add-account-form">
                    <!--Form Group-->
                        <div class="form-group mb-3">
                            <label for="">Enter the account name</label>
                            <input type="text" name="account_name" class="form-control" placeholder="Enter Account Name...">
                        </div>
                    <!--End of Form Group-->
                    <!--Form Group-->
                    <div class="form-group mb-3">
                        <select name="account_type" class="form-control" id="">
                            <option value="">-- Select Account Type --</option>
                            <option value="check">Check</option>
                            <option value="savings">Savings</option>
                            <option value="business">Business</option>
                        </select>
                    </div>
                <!--End of Form Group-->

                <!--Form Group-->
                    <div class="form-group mb-3">
                        <input type="text" name="account_name" class="form-control" placeholder="Enter Account Name...">
                    </div>
                <!--End of Form Group-->

                <!--Button-->

                    <div class="form-group mb-2">
                        <button class="pay-btn btn-pay">Add</button>
                    </div>

                <!--End of Button-->


                    </form>

                </div>
                <!--End of card Body-->

                <!--Card: Accounts Form Card-->
            </div>

        </div>
    </div>
    <!-- End Of Right Side of Canvas -->

    <div class="container d-flex">
        <button class="account-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
            <i class="fa fa-credit-card"></i> New Account
        </button>

        <button class="transact-btn ms-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
            <i class="fa fa-wallet"></i> Transact
        </button>
    </div>

    <div class="container d-flex py-3">
        <h2 class="me-auto">Total Accounts Balance:</h2>
        <h2 style="margin-left: auto;">0.00</h2>
    </div>

    <div class="container">
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Accordion Item #1
                    </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        Accordion Item #2
                    </button>
                </h2>
                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                        Accordion Item #3
                    </button>
                </h2>
                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
                </div>
            </div>
        </div>
    </div>

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

</body>

</html>
