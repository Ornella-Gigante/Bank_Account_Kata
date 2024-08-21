
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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