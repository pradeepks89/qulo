package com.qulo.model;



public class CompatibilityQuestion {
	private String question;
	private String questionID;
	private String selection;
	private String options;
	private int userID;
	
	public CompatibilityQuestion(){
		
	}
	
	public CompatibilityQuestion( String question, String questionID, String selection){
		this.setQuestion(question);
		this.setQuestionID(questionID);
		this.setSelection(selection);
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getQuestionID() {
		return questionID;
	}

	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}

	public String getSelection() {
		return selection;
	}

	public void setSelection(String selection) {
		this.selection = selection;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
}
