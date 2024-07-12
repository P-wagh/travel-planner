package com.travelplanner.helper;

public class Massege {

	private String discription;
	private String type;
	
	public Massege() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Massege(String discription, String type) {
		super();
		this.discription = discription;
		this.type = type;
	}
	
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	@Override
	public String toString() {
		return "Massege [discription=" + discription + ", type=" + type + "]";
	}
	
	
	
	
}
