<%-- 
    Document   : message
    Created on : Aug 5, 2022, 3:30:14 PM
    Author     : BENJAMIN RUKUNDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String message = (String) session.getAttribute("message");
  if(message != null) {
    

%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%=message%></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%  session.removeAttribute("message");
    }  
%>