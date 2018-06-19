package model;
// Generated Jun 19, 2018 10:38:00 PM by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PgSuppliers generated by hbm2java
 */
@Entity
@Table(name = "pg_suppliers", catalog = "dath")
public class PgSuppliers implements java.io.Serializable {

	private Integer supplierId;
	private String companyName;
	private String contactName;
	private String address;
	private String region;
	private String phone;
	private String email;
	private Integer supplierStatus;
	

	public PgSuppliers() {
	}

	public PgSuppliers(String companyName, String contactName, String phone) {
		this.companyName = companyName;
		this.contactName = contactName;
		this.phone = phone;
	}

	public PgSuppliers(String companyName, String contactName, String address, String region, String phone,
			String email, Integer supplierStatus) {
		this.companyName = companyName;
		this.contactName = contactName;
		this.address = address;
		this.region = region;
		this.phone = phone;
		this.email = email;
		this.supplierStatus = supplierStatus;
		
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "SUPPLIER_ID", unique = true, nullable = false)
	public Integer getSupplierId() {
		return this.supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	@Column(name = "COMPANY_NAME", nullable = false, length = 100)
	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "CONTACT_NAME", nullable = false, length = 100)
	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	@Column(name = "ADDRESS", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "REGION", length = 100)
	public String getRegion() {
		return this.region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	@Column(name = "PHONE", nullable = false, length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "EMAIL", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "SUPPLIER_STATUS")
	public Integer getSupplierStatus() {
		return this.supplierStatus;
	}

	public void setSupplierStatus(Integer supplierStatus) {
		this.supplierStatus = supplierStatus;
	}



}
