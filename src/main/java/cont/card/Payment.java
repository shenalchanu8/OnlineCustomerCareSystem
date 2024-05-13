package cont.card;

import com.customer.Customer;

public class Payment {
	
	private int pay_id;
	private String fullname;
	private int id;
	private String email;
	private String priority;
	private String date;
	private Customer cusDetails;
	public Payment(int pay_id, String fullname, int id, String email, String priority, String date,
			Customer cusDetails) {
		super();
		this.pay_id = pay_id;
		this.fullname = fullname;
		this.id = id;
		this.email = email;
		this.priority = priority;
		this.date = date;
		this.cusDetails = cusDetails;
	}
	public int getPay_id() {
		return pay_id;
	}
	
	public String getFullname() {
		return fullname;
	}
	
	public int getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPriority() {
		return priority;
	}
	
	public String getDate() {
		return date;
	}
	
	public Customer getCusDetails() {
		return cusDetails;
	}
	
	
	

}
