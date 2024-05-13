package com.feedback;

import com.customer.Customer;
import com.feedback.Feedback;

public class Feedback {
	private int fid;
	private String name;
	private String email;
	private String feedback;
	private String uid;
	private Customer cusDetails;
    
    

	

	


	public String getUid() {
		return uid;
	}






	public void setUid(String uid) {
		this.uid = uid;
	}






	public Customer getCusDetails() {
		return cusDetails;
	}






	public void setCusDetails(Customer cusDetails) {
		this.cusDetails = cusDetails;
	}






	public Feedback(int fid, String name, String email, String feedback, String uid, Customer cusDetails) {
		super();
		this.fid = fid;
		this.name = name;
		this.email = email;
		this.feedback = feedback;
		this.uid = uid;
		this.cusDetails = cusDetails;
	}






	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}






	public Feedback(int fID2, String name2, String email2, Feedback feedback, int review) {
		// TODO Auto-generated constructor stub
	}






	






	public int getFid() {
		return fid;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

    
	

}
