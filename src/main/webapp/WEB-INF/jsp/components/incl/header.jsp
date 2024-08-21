<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
