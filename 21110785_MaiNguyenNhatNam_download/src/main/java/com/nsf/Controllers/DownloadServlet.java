package com.nsf.Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nsf.Business.Product;
import com.nsf.Business.User;
import com.nsf.Data.ProductIO;
import com.nsf.Data.UserIO;
import com.nsf.Utils.CookieUtil;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		String userEmail = CookieUtil.getValue(cookies, "userEmail");
		if (action == null) {
			action = "viewAlbums";
		}
		//
		String url = "/index.jsp";
		//
		if (action.equals("viewAlbums")) {
			url = "/index.jsp";
		} else if (action.equals("checkUser")) {
			//
			final String productCode = req.getParameter("productCode");
			String path = getServletContext().getRealPath("/WEB-INF/products.txt");
			Product p = ProductIO.getProduct(productCode, path);
			session.setAttribute("product", p);
			//
			final boolean authentedUser = checkUser(req, res);
			if (authentedUser) {
				url = "/components/productCode/" + productCode + ".jsp";
			} else {
				url = "/components/" + "register.jsp";
			}
		} else if (action.equals("viewCookies")) {
			url = "/components/" + "viewCookies.jsp";
		} else if (action.equals("deleteCookies")) {
			deleteCookies(req, res);
			url = "/components/" + "deleteCookies.jsp";
		}
		getServletContext().getRequestDispatcher(url).forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		String url = "/index.html";
		if (action.equals("registerUser")) {
			final boolean status = registerUser(req, res);
			if (status) {
				// Removing parameters
				Enumeration<String> attrs = req.getAttributeNames();
				while (attrs.hasMoreElements()) {
					req.removeAttribute(attrs.nextElement());
				}
				//

				final Product p = (Product) req.getSession().getAttribute("product");
				url = "/components/productCode/" + p.getCode() + ".jsp";
			}
		}
		getServletContext().getRequestDispatcher(url).forward(req, res);
	}

	protected boolean checkUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			Cookie[] cookies = req.getCookies();
			String userEmail = CookieUtil.getValue(cookies, "userEmail");
			if (userEmail == null || userEmail.isBlank()) {
				return false;
			} else {
				String usersPath = getServletContext().getRealPath("/WEB-INF/EmailList.txt");
				user = UserIO.getUser(userEmail, usersPath);
				session.setAttribute("user", user);
				return true;
			}
		}
		return true;
	}

	protected boolean registerUser(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String email = req.getParameter("email").trim();
		String firstName = req.getParameter("firstName").trim();
		String lastName = req.getParameter("lastName").trim();
		//
		User user = new User(email, firstName, lastName);
		//
		String usersPath = getServletContext().getRealPath("/WEB-INF/EmailList.txt");
		boolean status = UserIO.add(user, usersPath);
		//
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		//
		Cookie emailCookie = new Cookie("userEmail", email);
		emailCookie.setMaxAge(60 * 60 * 24 * 365 * 3);
		emailCookie.setPath("/");
		res.addCookie(emailCookie);
		//
		String encodedFirstName = java.net.URLEncoder.encode(firstName, "utf-8");
		Cookie firstNameCookie = new Cookie("firstName", encodedFirstName);
		firstNameCookie.setMaxAge(60 * 60 * 24 * 365 * 3);
		firstNameCookie.setPath("/");
		res.addCookie(firstNameCookie);
		//
		return true;

	}

	protected void deleteCookies(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		final Cookie[] cookies = req.getCookies();
		for (Cookie c : cookies) {
			c.setMaxAge(0);
			c.setPath("/");
			res.addCookie(c);
		}
		req.getSession().invalidate();
	}
}
