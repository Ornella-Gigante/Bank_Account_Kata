
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




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