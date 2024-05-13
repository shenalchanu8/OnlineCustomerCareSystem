
package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect1 {
	private static String url ="jdbc:mysql://localhost:3306/online_customercare";
	private static String user ="root";
	private static String pass ="dev123";
	
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			
		}catch(Exception e) {
			System.out.println("Data base connection is not success!!!");
		}
		
		return con;
		
	}
}
