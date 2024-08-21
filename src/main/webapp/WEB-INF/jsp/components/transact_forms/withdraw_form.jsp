

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>






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