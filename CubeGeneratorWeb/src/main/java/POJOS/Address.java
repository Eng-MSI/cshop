package POJOS;

import java.util.HashSet;
import java.util.Set;

public class Address {
	private Integer addressId;
	private String addressCountry;
	private String addressCity;
	private Set<User> users = new HashSet<User>();

	public Address() {
	}

	public Address(String addressCountry, String addressCity, Set<User> users) {
		super();
		this.addressCountry = addressCountry;
		this.addressCity = addressCity;
		this.users = users;
	}

	public Address(String addressCountry, String addressCity) {
		super();
		this.addressCountry = addressCountry;
		this.addressCity = addressCity;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddressCountry() {
		return addressCountry;
	}

	public void setAddressCountry(String addressCountry) {
		this.addressCountry = addressCountry;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
