

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Download Application</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				keyframes : {
					rotatecustom : {
						"0%" : {
							transform : "scale(0)"
						},
						"100%" : {
							transform : "scale(1)"
						}
					}
				}

			}
		}
	}
</script>
</head>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<main
		class="md:container w-fit mx-auto my-8 flex flex-col place-items-center">
		<!-- Logo -->
		<a href="./"
			class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
			<img class="w-12 h-12 mr-2" src="./public/logo/weblogo.png"
			alt="logo"> Dark Boy
		</a>


		<!-- User Profile -->

		<c:if test="${cookie.userEmail != null}">
			<section class="w-full flex justify-center mb-8">

				<div
					class="w-full max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 animate-[rotatecustom_2s_ease-in-out]">
					<div class="flex flex-col items-center pb-10">
						<img class="w-24 h-24 mb-3 rounded-full shadow-lg"
							src="public/logo/user.png" alt="User logo" />
						<h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">
							User</h5>
						<span class="text-sm text-gray-500 dark:text-gray-400">${cookie.userEmail.getValue()}</span>
					</div>
				</div>

			</section>
		</c:if>

		<!-- Welcome -->
		<c:if test="${cookie.firstName != null }">
			<%@ page import="com.nsf.Utils.CookieUtil"%>
			<%
			String encodedFirstName = CookieUtil.getValue(request.getCookies(), "firstName");
			String firstName = java.net.URLDecoder.decode(encodedFirstName, "UTF-8");
			%>

			<p class="mb-4">
				Welcome back,
				<c:out value="<%=firstName%>" />
			</p>

		</c:if>

		<!-- Albums -->
		<section>
			<h2 class="mb-2 text-lg font-semibold text-cyan-600 dark:text-white">List
				of latest albums (Ex 7.1, 7.2, 9.1)</h2>
			<ul
				class="max-w-md space-y-1 text-gray-500 list-disc list-inside dark:text-gray-400">
				<li><a href="download?action=checkUser&amp;productCode=a1"
					class="">Snooze (Accountic) (feat.Justin Bieber)</a></li>
				<li><a href="download?action=checkUser&amp;productCode=a2"
					class="">Justice</a></li>
				<li><a href="download?action=checkUser&amp;productCode=a3"
					class="">Purpose (Deluxe)</a></li>
				<li><a href="download?action=checkUser&amp;productCode=a4"
					class="">My World 2.0</a></li>
			</ul>
			<!-- <h2 class="mb-2 text-lg font-semibold text-cyan-600 dark:text-white"><span></span> <p></p></h2> -->
			<span class="text-red-500">Old-school guy? </span><span class="text-blue-400"><a href="" class="">Click here! (Ex 7.3, 9.2)</a></span>
		</section>
	</main>

</body>

</html>