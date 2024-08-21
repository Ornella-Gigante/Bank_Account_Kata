
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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