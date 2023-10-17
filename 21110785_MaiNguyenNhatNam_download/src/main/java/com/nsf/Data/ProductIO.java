package com.nsf.Data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import com.nsf.Business.Product;

public class ProductIO {
	public static Product getProduct(String code, String productPath) throws FileNotFoundException {
		try {
			if (code == null || code.isBlank() || productPath == null) {
				return null;
			}
			File file = new File(productPath);
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line = in.readLine();
			while (line != null) {
				StringTokenizer stk = new StringTokenizer(line, "|");
				String productCode = stk.nextToken();
				if (code.equals(productCode)) {
					String description = stk.nextToken();
					double price = Double.parseDouble(stk.nextToken());
					Product p = new Product(productCode, description, price);
					in.close();
					return p;
				}
				line = in.readLine();
			}
			in.close();
			return null;
		} catch (Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}

	public static ArrayList<Product> getProducts(String productPath) throws FileNotFoundException {
		try {
			if (productPath == null) {
				return null;
			}
			ArrayList<Product> productArr = new ArrayList<Product>();
			File file = new File(productPath);
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line = in.readLine();
			while (line != null) {
				StringTokenizer stk = new StringTokenizer(line, "|");
				String productCode = stk.nextToken();
				String description = stk.nextToken();
				double price = Double.parseDouble(stk.nextToken());
				Product p = new Product(productCode, description, price);
				productArr.add(p);
				line = in.readLine();
			}
			in.close();
			return productArr;
		} catch (Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}
}