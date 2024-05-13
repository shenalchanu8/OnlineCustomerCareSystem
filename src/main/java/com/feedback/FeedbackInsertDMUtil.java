package com.feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Db.DBconnect;


public class FeedbackInsertDMUtil {
private Connection conn;

public FeedbackInsertDMUtil(Connection conn) {
	super();
	this.conn = conn;
}
public boolean Addinquiry(String name,String email,String feedback,int uid) {
	  
	boolean f = false;
	try {
		String sql = "insert into feedback(name,email,feedback,uid) values (?,?,?,?)";
				conn = DBconnect.getConn();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2,email);
		ps.setString(3,feedback );
		ps.setInt(4, uid);
		
		
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
public List<Feedback> getData(int fid){
	List<Feedback> list = new ArrayList<Feedback>();
	 Feedback in = null;
	
	try {
		String qu = "select * from feedback where uid = ?";
		PreparedStatement ps  = conn.prepareStatement(qu);
		ps.setInt(1, fid);
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


	
	
	
	
//edit inquiry

public List<Feedback> getData2(int feedbackId){
	List<Feedback> list = new ArrayList<Feedback>();
	 Feedback in = null;
	
	try {
		String qu = "select * from feedback where fid = ?";
		PreparedStatement ps  = conn.prepareStatement(qu);
		ps.setInt(1, feedbackId);
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

public boolean feedbackUpdate(int Fid,String name,String email,String feedback) {
	boolean f = false;
	try {
		String qu = "update feedback set name = ?,email= ?,feedback= ? where fid = ?";
		PreparedStatement ps  = conn.prepareStatement(qu);
		ps.setString(1, name);
		ps.setString(2,email);
		ps.setString(3,feedback );
		
		int i = ps.executeUpdate();
		
		if(i == 1) {
			f = true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	
	
	
	
	
	
	
	return f;

}


public static void updateFeedback(Feedback feedback1) {
	// TODO Auto-generated method stub
	
}
//delete feedback

public boolean DeleteFeedback(int fid) {
	boolean f = false;
	try {
		String qu = "delete from feedback where fid = ?";
		PreparedStatement ps  = conn.prepareStatement(qu);
		
		ps.setInt(1, fid);
	
		int i = ps.executeUpdate();
		
		if(i == 1) {
			f = true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	
	
	
	
	return f;

}
public static void Feedback(Feedback feedback1) {
	// TODO Auto-generated method stub
	
}
public static List<com.feedback.Feedback> getAllFeedback() {
	// TODO Auto-generated method stub
	return null;
}



}