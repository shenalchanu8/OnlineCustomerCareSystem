package com.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.Inquiry;
import com.feedback.*;

public class FeedbackAdminDAO {
	
	private Connection conn;
	
	public FeedbackAdminDAO (Connection conn) {
		super();
		this.conn = conn;

}
		// TODO Auto-generated constructor stub
	

	//show details to admin
	public List<Feedback> getData(){
		List<Feedback> list = new ArrayList<Feedback>();
		 Feedback in = null;
		
		try {
			String qu = "select * from feedback ";
			PreparedStatement ps  = conn.prepareStatement(qu);
			
			ResultSet rs = ps.executeQuery();
		
			
			while (rs.next()) {
				in = new Feedback();
	           
				 in.setFid(rs.getInt(1));
		            in.setName(rs.getString(2));
		            in.setEmail(rs.getString(3));
		            in.setFeedback(rs.getString(4));
		            
	            
	            
	            

	            list.add(in);
	        }
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	    } 
		return list;
	


}


}
