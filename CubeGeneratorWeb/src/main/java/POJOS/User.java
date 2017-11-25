package POJOS;

public class User {
	private Integer userId;
	private String userName;
	private Address address;

	public User() {
	}

	public User(String userName, Address address) {
		this.userName = userName;
		this.address = address;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
