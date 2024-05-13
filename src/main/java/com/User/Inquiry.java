package com.User;

import com.customer.Customer;

public class Inquiry {
	private int id;
	private String Full_name;
	private String Email_address;
	private String Category;
	private String Priority;
	private String Summary;
	private String Description;
	private Customer cusDetails;
	private int uid;
	
	

	public Inquiry(int id,String Full_name, String Email_address, String Category, String Priority, String Summary,
			String Description, Customer cusDetails,int uid) {
		super();
		this.id = id;
		this.Full_name = Full_name;
		this.Email_address = Email_address;
		this.Category = Category;
		this.Priority = Priority;
		this.Summary = Summary;
		this.Description = Description;
		this.cusDetails = cusDetails ;
		this.uid = uid;
	}



	public Inquiry() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFull_name() {
		return Full_name;
	}

	public void setFull_name(String Full_name) {
		this.Full_name = Full_name;
	}

	public String getEmail_address() {
		return Email_address;
	}

	public void setEmail_address(String Email_address) {
		this.Email_address = Email_address;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String Category) {
		this.Category = Category;
	}

	public String getPriority() {
		return Priority;
	}

	public void setPriority(String Priority) {
		this.Priority = Priority;
	}

	public String getSummary() {
		return Summary;
	}

	public void setSummary(String Summary) {
		this.Summary = Summary;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String Description) {
		this.Description = Description;
	}
	
	public Customer getCustomer() {
		return cusDetails ;
	}

	public void setCustomer(Customer cusDetails ) {
		this.cusDetails  = cusDetails ;
	}



	public int getUid() {
		return uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}




	
	
	
	

}
