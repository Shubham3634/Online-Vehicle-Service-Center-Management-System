package com.vehicle.pojo;

public class Customer {
	 private String name;
	 private String contactno;
	 private String email;
	 private String pwd;
	 private String vehicletype;
	 private String vehicleno;
	 
	public Customer() {
		super();
	}

	public Customer(String name, String contactno, String email, String pwd, String vehicletype, String vehicleno) {
		super();
		this.name = name;
		this.contactno = contactno;
		this.email = email;
		this.pwd = pwd;
		this.vehicletype = vehicletype;
		this.vehicleno = vehicleno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getVehicletype() {
		return vehicletype;
	}

	public void setVehicletype(String vehicletype) {
		this.vehicletype = vehicletype;
	}

	public String getVehicleno() {
		return vehicleno;
	}

	public void setVehicleno(String vehicleno) {
		this.vehicleno = vehicleno;
	}
	 
	@Override
	public String toString() {
		return "Customer [name=" + name + ", contactno=" + contactno + ", email=" + email + ", pwd=" + pwd
				+ ", vehicletype=" + vehicletype + ", vehicleno=" + vehicleno + "]";
	} 

}
