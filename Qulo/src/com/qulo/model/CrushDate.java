package com.qulo.model;

public class CrushDate {
	private int user1;
	private int user2;
	private String meetDate;
	private String meetLocation;
	private String meetNote;
	
	public CrushDate(){
		
	}
	public CrushDate(int user1, int user2, String meetDate, String meetLocation, String meetNote){
		this.setUser1(user1);
		this.setUser2(user2);
		this.setMeetDate(meetDate);
		this.setMeetLocation(meetLocation);
		this.setMeetNote(meetNote);
	}
	
	public int getUser1() {
		return user1;
	}
	public void setUser1(int user1) {
		this.user1 = user1;
	}
	public int getUser2() {
		return user2;
	}
	public void setUser2(int user2) {
		this.user2 = user2;
	}
	public String getMeetDate() {
		return meetDate;
	}
	public void setMeetDate(String meetDate) {
		this.meetDate = meetDate;
	}
	public String getMeetLocation() {
		return meetLocation;
	}
	public void setMeetLocation(String meetLocation) {
		this.meetLocation = meetLocation;
	}
	public String getMeetNote() {
		return meetNote;
	}
	public void setMeetNote(String meetNote) {
		this.meetNote = meetNote;
	}
}
