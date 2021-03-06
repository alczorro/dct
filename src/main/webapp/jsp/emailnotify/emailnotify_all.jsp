<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="templates.default" />
<%
	pageContext.setAttribute("locale", request.getLocale());
%>
<fmt:setBundle basename="templates.default" />
<%
	String isAdmin = (String) request.getAttribute("isAdmin");
	if (isAdmin != null && isAdmin.equals("false")) {
%>
<table class="DCT_wikitable">
	<tr>
		<td>
			<fmt:message key="emailnotifier.priviledgeError" />
		</td>
	</tr>
</table>

<%
	return;
	}
%>
<logic:notEmpty name="errorInfo">
	<font color="red" size="3"> <c:out value='${errorInfo}' /> </font>
</logic:notEmpty>
<form id="esubManage" action="5007?method=show" method="post" name="pageInfoForm">
	<input type="hidden" name="deleteESubId" id="deleteESubid" value="" />
	<h3>
		<fmt:message key="emailnotifier.emailList" />
	</h3>

	<table class="" boder="0">
		<tr>
			<td></td>
			<td>
				<fmt:message key="emailnotifier.email" />
				:
				<br />
				<html:text property="emails" value='${emails}' />
			</td>
			<td>

			</td>
			<td>
				<fmt:message key="emailnotifier.page" />
				:
				<br />
				<html:text property="pageName" value='${pageName}' />
			</td>
			<td align="left">

			</td>
			<td>
				<fmt:message key="emailnotifier.hour" />
				:
				<br />
				<html:text property="hour" value='${hour}' />
			</td>
			<td>
				<br />
				<html:submit>
					<fmt:message key="emailnotifier.search" />
				</html:submit>
			</td>
		</tr>
	</table>
	<table class="DCT_wikitable">
		<tr>

			<th>
				<fmt:message key="emailnotifier.email" />
			</th>
			<th>
				<fmt:message key="emailnotifier.page" />
			</th>

			<th>
				<fmt:message key="emailnotifier.hour" />
			</th>
			<th>
				<fmt:message key="emailnorifier.unsubscriber" />
			</th>
		</tr>

		<c:forEach var="item" items='${requestScope.eMailSubscribers}'
			varStatus="status">
			<tr>

				<td>

					<c:out value='${item.receiver}' />
				</td>
				<td>
					<c:choose>
						<c:when test="${ '*' == item.resourceId }">
							<fmt:message key="emailnotifier.allpages" />
						</c:when>
						<c:otherwise>
							<c:out value='${item.pageTitle}' />
						</c:otherwise>
					</c:choose>

				</td>

				<td>
					<c:out value='${item.rec_time}' />
				</td>
				<td>
					<BUTTON onclick="delsubmit('${item.id}');">
						<img
							src='<%=request.getContextPath()%>/images/common/unsubscribe.png' />
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>

</form>
<script type="text/javascript" type="text/javascript">
<!--
function delsubmit(itemId)
{

	 var delid = document.getElementById("deleteESubid");
	 delid.value=itemId;
	 var form = document.getElementById("esubManage");
	
	 form.submit();
}
//-->
</script>
<div class="clear"></div>