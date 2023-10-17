package com.nsf.Data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import com.nsf.Business.User;

public class UserIO {
	public static boolean add(User user, String path) {
		try {
			if (path == null || path.isBlank() || user == null) {
				return false;
			}
			File file = new File(path);
			PrintWriter out = new PrintWriter(new FileWriter(file, true));
			out.println(user.getEmail() + "|" + user.getFirstName() + "|" + user.getLastName());
			System.out.println(path);
			out.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static User getUser(String userEmail, String path) {
		try {
			if (path == null || path.isBlank() || userEmail == null || userEmail.isBlank()) {
				return null;
			}
			File file = new File(path);
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line = in.readLine();
			while (line != null) {
				StringTokenizer stk = new StringTokenizer(line, "|");
				if (stk.countTokens() < 3) {
					continue;
				}
				String emailToken = stk.nextToken();
				if (emailToken.equalsIgnoreCase(userEmail)) {
					String firstName = stk.nextToken();
					String lastName = stk.nextToken();
					in.close();
					return new User(emailToken, firstName, lastName);
				}
				line = in.readLine();
			}
			in.close();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static ArrayList<User> getUsers(String userEmail, String path) {
		try {
			if (path == null || path.isBlank() || userEmail == null || userEmail.isBlank()) {
				return null;
			}
			File file = new File(path);
			ArrayList<User> userArr = new ArrayList<User>();
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line = in.readLine();
			while (line != null) {
				StringTokenizer stk = new StringTokenizer(line, "|");
				if (stk.countTokens() < 3) {
					continue;
				}
				String email = stk.nextToken();
				String firstName = stk.nextToken();
				String lastName = stk.nextToken();
				userArr.add(new User(email, firstName, lastName));
				line = in.readLine();
			}
			in.close();
			return userArr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}