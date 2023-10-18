<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Delete Cookies</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<main class="md:container mx-auto my-4">
		<c:import url="/components/breadcrumb.html" />
		<a href="./"
			class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
			<img class="w-12 h-12 mr-2" src="./public/logo/weblogo.png"
			alt="logo"> Dark Boy
		</a>
		<h2>All persistent cookies have been removed from this browser.</h2>
		<div class="flex justify-between">

			<c:import url="/components/ReturnButton.html" />
			<c:import url="/components/ViewCookieButton.html" />
		</div>
	</main>

</body>

</html>