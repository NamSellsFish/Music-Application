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

		<section class="bg-gray-50 dark:bg-gray-900">
			<div
				class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
				<a href="./"
					class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
					<img class="w-12 h-12 mr-2" src="./public/logo/weblogo.png"
					alt="logo"> Dark Boy
				</a>
				<div
					class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
					<div class="p-6 space-y-4 md:space-y-6 sm:p-8">
						<h1
							class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
							Create an account</h1>
						<form class="space-y-4 md:space-y-6" action="download"
							method="post">
							<input type="hidden" name="action" value="registerUser" />
							<div class="relative">
								<input type="email" id="email" name="email"
									class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-900 bg-transparent rounded-lg border-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
									placeholder=" " value="<c:out value="${ user.email }" />" /> <label for="email"
									class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white dark:bg-gray-900 px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1">Email</label>
							</div>
							<div class="relative">
								<input type="text" id="firstname" name="firstName"
									class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-900 bg-transparent rounded-lg border-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
									placeholder=" " value="<c:out value="${ user.firstName }" />" /> <label for="firstname"
									class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white dark:bg-gray-900 px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1">First
									Name</label>
							</div>
							<div class="relative">
								<input type="text" id="lastname" name="lastName"
									class="block px-2.5 pb-2.5 pt-4 w-full text-sm text-gray-900 bg-transparent rounded-lg border-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
									placeholder=" " value="<c:out value="${ user.lastName }" />" /> <label for="lastname"
									class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-4 scale-75 top-2 z-10 origin-[0] bg-white dark:bg-gray-900 px-2 peer-focus:px-2 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:top-1/2 peer-focus:top-2 peer-focus:scale-75 peer-focus:-translate-y-4 left-1">Last
									Name</label>
							</div>
							<div class="flex items-start">
								<div class="flex items-center h-5">
									<input id="terms" aria-describedby="terms" type="checkbox"
										class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800"
										required="">
								</div>
								<div class="ml-3 text-sm">
									<label for="terms"
										class="font-light text-gray-500 dark:text-gray-300">I
										accept the <a
										class="font-medium text-blue-600 hover:underline dark:text-blue-500"
										href="#">Terms and Conditions</a>
									</label>
								</div>
							</div>
							<button type="submit"
								class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Create
								an account</button>

						</form>
					</div>
				</div>
			</div>
		</section>

	</main>
</body>

</html>