<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ attribute name="stringArg" rtexprvalue="true" required="true" type="java.lang.String" description="date to string" %>
<c:set var="year" value="${fn:substring(stringArg, 0, 4)}" />
<c:set var="month" value="${fn:substring(stringArg, 5, 7)}" />
${year}-${month}
