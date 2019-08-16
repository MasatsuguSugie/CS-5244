<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ attribute name="stringArg" rtexprvalue="true" required="true" type="java.lang.String" description="Title to image" %>
<c:set var="step1" value="${fn:replace(stringArg, ' ', '-')}"/>
<c:set var="step2" value="${fn:toLowerCase(step1)}"/>
<c:set var="step3" value=".gif"/>
${step2}${step3}