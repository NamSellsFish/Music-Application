<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<main class="md:container mx-auto my-4">
		<a href="./"
			class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
			<img class="w-12 h-12 mr-2" src="./public/logo/weblogo.png"
			alt="logo"> Dark Boy
		</a>
		<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
			<table
				class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
				<thead
					class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
					<tr>
						<th scope="col" class="px-6 py-3">Cookie Name</th>
						<th scope="col" class="px-6 py-3">Value</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${cookie}">



						<tr
							class="bg-white  dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
							<th scope="row"
								class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
								<c:out value="${c.value.name}" />
							</th>
							<td class="px-6 py-4"><c:choose>
									<c:when test="${c.value.name == 'firstName' }">
										<%@ page import="com.nsf.Utils.CookieUtil"%>
										<%
										String encodedFirstName = CookieUtil.getValue(request.getCookies(), "firstName");
										String firstName = java.net.URLDecoder.decode(encodedFirstName, "UTF-8");
										%>
										<c:out value="<%=firstName%>" />
									</c:when>
									<c:otherwise>
										<c:out value="${c.value.value}" />
									</c:otherwise>

								</c:choose></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>
		</div>

		<div class="flex justify-between">

			<c:import url="/components/ReturnButton.html" />
			<c:import url="/components/DeleteCookiesButton.html" />
		</div>
	</main>

</body>

</html>