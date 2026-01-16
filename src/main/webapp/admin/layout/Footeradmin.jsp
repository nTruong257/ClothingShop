<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${empty root}">
    <c:set var="root" value="${pageContext.request.contextPath}" scope="request"/>
</c:if>
<footer class="bg-dark text-white py-3">
    <div class="container-fluid text-center">
        <p class="mb-0">&copy; 2025 StyleEra Admin. All rights reserved.</p>
    </div>
</footer>
