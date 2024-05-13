package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.Inquiry;

public class inquiryadminDAO {
	
private Connection conn;

	

	public inquiryadminDAO(Connection conn) {
		super();
		this.conn = conn;

}
	//show details to admin
	public List<Inquiry> getData(){
		List<Inquiry> list = new ArrayList<Inquiry>();
		 Inquiry in = null;
		
		try {
			String qu = "select * from inquiry ";
			PreparedStatement ps  = conn.prepareStatement(qu);
			
			ResultSet rs = ps.executeQuery();
		
			
			while (rs.next()) {
				in = new Inquiry();
	           
	            in.setId(rs.getInt(1));
	            in.setFull_name(rs.getString(2));
	            in.setEmail_address(rs.getString(3));
	            in.setCategory(rs.getString(4));
	            
	            in.setSummary(rs.getString(5));
	            in.setDescription(rs.getString(6));
	            in.setUid(rs.getInt(7));
	            
	            
	            

	            list.add(in);
	        }
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	    } 
		return list;
	


}
	//solution get data
	
	public Inquiry getData1(){
		
		 Inquiry in = null;
		
		try {
			String qu = "select * from inquiry ";
			PreparedStatement ps  = conn.prepareStatement(qu);
			
			ResultSet rs = ps.executeQuery();
		
			
			while (rs.next()) {
				in = new Inquiry();
	           
	            in.setId(rs.getInt(1));
	            in.setFull_name(rs.getString(2));
	            in.setEmail_address(rs.getString(3));
	            in.setCategory(rs.getString(4));
	           
	            in.setSummary(rs.getString(5));
	            in.setDescription(rs.getString(6));
	            in.setUid(rs.getInt(7));
	            
	            
	            

	            
	        }
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	    } 
		return in;
	


}
	

	
	
	


}
