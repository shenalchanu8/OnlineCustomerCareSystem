package com.Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.customer.Customer;
import com.customer.DBConnect1;

public class AdminDBUtil {
	
	private static  boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
/////////////////////////////////////////////Admin login part//////////////////////////////////////////////
	
public static List<Admin>validate(String userName,String password){
		
		ArrayList<Admin> cus = new ArrayList<>();
		
		String  url = "jdbc:mysql://localhost:3306/online_customercare";
		String user="root";
		String pass="dev123";
		
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			
			String sql = "select * from admin where userName='"+userName+"' and password='"+password+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String adminU = rs.getString(5);
				String passU = rs.getString(6);
				
				
				 Admin a = new Admin(id,name,email,phone,adminU,passU);
				
				cus.add(a);
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return cus;
	}

///////////////////////////////////// Register part////////////////////////////////////////////////////


public static boolean insertadmin(String name, String email, String phone, String username,String password) {
	boolean isSuccess = false;
	
	
	// create the DB connection
	String url = "jdbc:mysql://localhost:3306/online_customercare";
	String user ="root";
	String Password ="dev123";
	
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, Password);
		Statement stmt = con.createStatement();
		String sql = "insert into  admin values(0,'"+name+"','"+email+"','"+phone+"','"+username+"','"+password+"')";
		int rs = stmt.executeUpdate(sql);                   
		
		if(rs >0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return isSuccess;
	
}


			
///////////////////////////////////////////// admin update part//////////////////////////////////////////
					

	public static boolean updateadmin(String id, String name, String email, String phone,String username, String password) {
		
		try {
			
			con = DBConnect1.getConnection();
			stmt = con.createStatement();
			String sql ="update admin set name='"+name+"',email='"+email+"',phone='"+phone+"',username='"+username+"',password='"+password+"'"+"where id='"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			
			if (rs >0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Admin> getAdminDetails(String Id){
		
		int concertedID = Integer.parseInt(Id);
		
		ArrayList<Admin> admin = new ArrayList<>();
		
		try {
			
			con = DBConnect1.getConnection();
			stmt = con.createStatement();
			String sql = "select * from admin where id = '"+concertedID+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String username = rs.getString(5);
				String password = rs.getString(6);
				
				Admin c = new Admin(id, name, email, phone, username, password);
				admin.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return admin;
	}
	
	
	
	
///////////////////////////////////Admin details Delete part////////////////////////////////////////////////
	
	
	public static boolean deleteAdmin(String id) {
		
		int convId = Integer.parseInt(id);
		
		try {
			con = DBConnect1.getConnection();
			stmt = con.createStatement();
			String sql ="delete from admin where id='"+convId+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs >0) {
				isSuccess = true;
				
			}else {
				isSuccess = false;
				
				
				
			}
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return isSuccess;
	}

}



