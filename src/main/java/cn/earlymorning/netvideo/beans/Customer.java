package cn.earlymorning.netvideo.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class Customer implements Serializable {
	private Integer id;
	private String telephone;
	private String name;
	private String realName;
	private String password;
	private String sex;
	private String email;
	private Timestamp createDate;
	private String headUrl;
	private Timestamp birthday;
	private String address;
	private String interesting;
	private Profession profession;
	private String company;
	private Integer errorCount;
	private String ethnic;
	private Role role;

	public Customer(Integer id, String telephone, String name, String realName, String password, String sex, String email, Timestamp createDate, String headUrl, Timestamp birthday, String address, String interesting, Profession profession, String company, Integer errorCount, String ethnic, Role role) {
		this.id = id;
		this.telephone = telephone;
		this.name = name;
		this.realName = realName;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.createDate = createDate;
		this.headUrl = headUrl;
		this.birthday = birthday;
		this.address = address;
		this.interesting = interesting;
		this.profession = profession;
		this.company = company;
		this.errorCount = errorCount;
		this.ethnic = ethnic;
		this.role = role;
	}

	public Customer() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public Timestamp getBirthday() {
		return birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInteresting() {
		return interesting;
	}

	public void setInteresting(String interesting) {
		this.interesting = interesting;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getErrorCount() {
		return errorCount;
	}

	public void setErrorCount(Integer errorCount) {
		this.errorCount = errorCount;
	}

	public String getEthnic() {
		return ethnic;
	}

	public void setEthnic(String ethnic) {
		this.ethnic = ethnic;
	}

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Customer{" +
				"id=" + id +
				", telephone='" + telephone + '\'' +
				", name='" + name + '\'' +
				", realName='" + realName + '\'' +
				", password='" + password + '\'' +
				", sex='" + sex + '\'' +
				", email='" + email + '\'' +
				", createDate=" + createDate +
				", headUrl='" + headUrl + '\'' +
				", birthday=" + birthday +
				", address='" + address + '\'' +
				", interesting='" + interesting + '\'' +
				", profession=" + profession +
				", company='" + company + '\'' +
				", errorCount=" + errorCount +
				", ethnic='" + ethnic + '\'' +
				", role=" + role +
				'}';
	}
}
