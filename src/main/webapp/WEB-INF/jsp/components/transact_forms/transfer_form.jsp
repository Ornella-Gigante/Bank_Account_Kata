

                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




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