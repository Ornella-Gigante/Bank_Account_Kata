<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Container: No Accounts-->
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

<!--End of Container: No Accounts-->