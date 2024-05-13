package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Db.DBconnect;

import com.User.Inquiry;

public class inquiryDao {
	
	private Connection conn;

	

	public inquiryDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean Addinquiry(String name,String email,String cat,String Sum,String Desc,int ui ) {
		  
		boolean f = false;
		try {
			String sql = "insert into inquiry(Full_name,Email_address,Category,Summary,Description,uid) values (?,?,?,?,?,?)";
					conn = DBconnect.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2,email);
			ps.setString(3,cat );	
			ps.setString(4,Sum);
			ps.setString(5,Desc);
			ps.setInt(6, ui);
			
			
			int x = ps.executeUpdate();
			if ( x == 1 ) {
				f = true;
			}
		}catch(Exception e ) {
			e.printStackTrace();
			
	
		}
		
		return f;
		
	}
	//show details
	public List<Inquiry> getData(int id){
		List<Inquiry> list = new ArrayList<Inquiry>();
		 Inquiry in = null;
		
		try {
			String qu = "select * from inquiry where uid = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			ps.setInt(1, id);
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
	
		
		
		
		
	//edit inquiry
	
	public List<Inquiry> getData2(int inquiryid){
		List<Inquiry> list = new ArrayList<Inquiry>();
		 Inquiry in = null;
		
		try {
			String qu = "select * from inquiry where id = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			ps.setInt(1, inquiryid);
			ResultSet rs = ps.executeQuery();
		
			
			while (rs.next()) {
				in = new Inquiry();
	           
	            in.setId(rs.getInt(1));
	            in.setFull_name(rs.getString(2));
	            in.setEmail_address(rs.getString(3));
	            in.setCategory(rs.getString(4));
	            ;
	            in.setSummary(rs.getString(5));
	            in.setDescription(rs.getString(6));
	            
	            

	            list.add(in);
	        }
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	    } 
		return list;
		

}
	
	public boolean inquiryUpdate(int id,String name,String email,String cat,String Sum,String Desc) {
		boolean f = false;
		try {
			String qu = "update inquiry set Full_name = ?,Email_address= ?,Category= ?,Summary = ?,Description= ? where id = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			ps.setString(1, name);
			ps.setString(2,email);
			ps.setString(3,cat );
			
			ps.setString(4,Sum);
			ps.setString(5,Desc);
			ps.setInt(6, id);
		
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		
		return f;
	
}
	//delete inquiry
	
	public boolean DeleteInquiry(int id) {
		boolean f = false;
		try {
			String qu = "delete from inquiry where id = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			
			ps.setInt(1, id);
		
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		
		return f;
	
}
	
	//showdetails  for the user
	public Inquiry getDatabyid(int inquiryid){
		
		 Inquiry in = null;
		
		try {
			String qu = "select * from inquiry where id = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			ps.setInt(1, inquiryid);
			ResultSet rs = ps.executeQuery();
		
			
			while (rs.next()) {
				in = new Inquiry();
	           
	            in.setId(rs.getInt(1));
	            in.setFull_name(rs.getString(2));
	            in.setEmail_address(rs.getString(3));
	            in.setCategory(rs.getString(4));
	           
	            in.setSummary(rs.getString(5));
	            in.setDescription(rs.getString(6));
	            
	            

	                
	        }
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	    } 
		return in;
		

}
	

	
	
}