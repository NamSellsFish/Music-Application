package com.nsf.Utils;

import javax.servlet.http.Cookie;

public abstract class CookieUtil {
	public static String getValue(Cookie[] cookies, String cookieName) {
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
}