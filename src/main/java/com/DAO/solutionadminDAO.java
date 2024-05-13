
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.Solution;

public class solutionadminDAO {
	
private Connection conn;

	

	public solutionadminDAO(Connection conn) {
		super();
		this.conn = conn;

}
	//show details to admin
	public List<Solution> getData(){
		List<Solution> list = new ArrayList<Solution>();
		 Solution in = null;
		
		try {
			String qu = "select * from solution ";
			PreparedStatement ps  = conn.prepareStatement(qu);
			
			ResultSet rs = ps.executeQuery();
		
			
			while (rs.next()) {
				in = new Solution();
	           
	        
	            in.setId(rs.getInt(1));
	            in.setCategory(rs.getString(2));
	            in.setSummary(rs.getString(3));
	            in.setDescription(rs.getString(4));
	            in.setSolution(rs.getString(5));
	            in.setUid(rs.getInt(6));
	            in.setInquiryid(rs.getInt(7));
	           
	            
	            
	            

	            list.add(in);
	        }
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	    } 
		return list;
	
}
}