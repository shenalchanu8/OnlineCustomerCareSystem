package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Db.DBconnect;
import com.User.Inquiry;
import com.User.Solution;

public class SolutionDAO {
	
	private Connection conn;

	

	public SolutionDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean Addinquiry(String cat,String Sum,String Desc,String sol, int ui, int inqi ) {
		  
		boolean f = false;
		try {
			String sql = "insert into solution(Category,Summary,Description,Solution,uid,inquiryid) values (?,?,?,?,?,?)";
					conn = DBconnect.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1,cat );
			ps.setString(2,Sum);
			ps.setString(3,Desc);
			ps.setString(4,sol);
			ps.setInt(5, ui);
			ps.setInt(6, inqi);
			
			
			int x = ps.executeUpdate();
			if ( x == 1 ) {
				f = true;
			}
		}catch(Exception e ) {
			e.printStackTrace();
			
	
		}
		
		return f;
		
	}
	
	//delete solution
	
	public boolean DeleteSolution(int id) {
		boolean f = false;
		try {
			String qu = "delete from solution where id = ?";
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
	//edit solution
	
	public List<Solution> getData2(int solutionid){
		List<Solution> list = new ArrayList<Solution>();
		 Solution in = null;
		
		try {
			String qu = "select * from solution where id = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			ps.setInt(1, solutionid);
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
	
	public boolean SolutionUpdate(int id,String cat,String Sum,String Desc,String sol) {
		boolean f = false;
		try {
			String qu = "update solution set Category = ?,Summary= ?,Description= ?,Solution= ? where id = ?";
			PreparedStatement ps  = conn.prepareStatement(qu);
			
			ps.setString(1,cat );
			
			ps.setString(2,Sum);
			ps.setString(3,Desc);
			ps.setString(3,sol);
			ps.setInt(5, id);
		
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		
		
		return f;
	
}
	
	public List<Solution> getSolutionsByUserId(int userId) {
	    List<Solution> list = new ArrayList<Solution>();
	    Solution in = null;

	    try {
	        String query = "SELECT * FROM solution WHERE uid = ?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, userId);

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
