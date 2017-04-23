package com.qulo.model;

public class User {
	private int id;
    private String displayName;
    private String password;
    private String role = "USER";
    private String firstName;
    private String lastName;
    private String city;
    private String state;
    private String country;
    private String email;
    private String gender;
    private String lookingFor;
    private String aboutMe;
    private String dob;
    private String age;
    private int compatibilityQuestionsOver;
    private int score;
    private int isCrush;
    private int mutualCrush;
    private String fileName;
	private String fileData;
	
	
    public User() {
    }
 
    public User(String displayName, String password, String firstName,String lastName, String city, String state, String country
    		, String email, String gender, String lookingFor, String aboutMe, String dob, String role, int compatibilityQuestionsOver , 
    		int score, String age, int isCrush, int mutualCrush, String fileName, String fileData) {
        this.setDisplayName(displayName);
        this.setPassword(password);
        this.setRole(role);
        this.setFirstName(firstName);
        this.setLastName(lastName);
        this.setCity(city);
        this.setState(state);
        this.setCountry(country);
        this.setEmail(email);
        this.setGender(gender);
        this.setLookingFor(lookingFor);
        this.setAboutMe(aboutMe);
        this.setDob(dob);
        this.setCompatibilityQuestionsOver(compatibilityQuestionsOver);
        this.setScore(score);
        this.setAge(age);
        this.setIsCrush(isCrush);
        this.setMutualCrush(mutualCrush);
        this.setFileName(fileName);
        this.setFileData(fileData);
        
    }

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLookingFor() {
		return lookingFor;
	}

	public void setLookingFor(String lookingFor) {
		this.lookingFor = lookingFor;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public int getCompatibilityQuestionsOver() {
		return compatibilityQuestionsOver;
	}

	public void setCompatibilityQuestionsOver(int compatibilityQuestionsOver) {
		this.compatibilityQuestionsOver = compatibilityQuestionsOver;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getIsCrush() {
		return isCrush;
	}

	public void setIsCrush(int isCrush) {
		this.isCrush = isCrush;
	}

	public int getMutualCrush() {
		return mutualCrush;
	}

	public void setMutualCrush(int mutualCrush) {
		this.mutualCrush = mutualCrush;
	}
	
	public String getFileData() {
		return fileData;
	}
	
	public void setFileData(String fileData) {
		this.fileData = fileData;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	

}

