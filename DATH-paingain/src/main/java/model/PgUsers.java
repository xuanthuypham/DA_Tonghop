package model;
// Generated Jun 26, 2018 11:38:35 AM by Hibernate Tools 4.3.5.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * PgUsers generated by hbm2java
 */
@Entity
@Table(name = "pg_users", catalog = "dath", uniqueConstraints = @UniqueConstraint(columnNames = "USER_ID"))
public class PgUsers implements java.io.Serializable {

	private Integer recordId;
	private PgRoles pgRoles;
	private String userId;
	private String firstName;
	private String lastName;
	private String address;
	private String phoneNumber;
	private String cardId;
	private String email;
	private Boolean sex;
	private String userPassword;
	private Date createTime;
	private Date modifiedTime;
	private int userStatus;
	private Set<PgOrders> pgOrderses = new HashSet<PgOrders>(0);
	private Set<PgLog> pgLogs = new HashSet<PgLog>(0);

	public PgUsers() {
	}
	public PgUsers(String id) {
		this.userId = id;
	}

	public PgUsers(Integer recordId, String userId, String firstName, String lastName, String address,
			String phoneNumber, String cardId, String email, Boolean sex, String userPassword, Date createTime,
			Date modifiedTime, int userStatus,PgRoles pgRoles) {
		this.recordId = recordId;
		this.pgRoles = pgRoles;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cardId = cardId;
		this.email = email;
		this.sex = sex;
		this.userPassword = userPassword;
		this.createTime = createTime;
		this.modifiedTime = modifiedTime;
		this.userStatus = userStatus;
	}
	public PgUsers(PgRoles pgRoles, String userId, String firstName, String lastName, String phoneNumber,
			String userPassword, int userStatus) {
		this.pgRoles = pgRoles;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.userPassword = userPassword;
		this.userStatus = userStatus;
	}

	public PgUsers( String userId, String firstName, String lastName, String address,
			String phoneNumber, String cardId, String email, Boolean sex, String userPassword, Date createTime,
			Date modifiedTime, int userStatus,PgRoles pgRoles) {
		this.pgRoles = pgRoles;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cardId = cardId;
		this.email = email;
		this.sex = sex;
		this.userPassword = userPassword;
		this.createTime = createTime;
		this.modifiedTime = modifiedTime;
		this.userStatus = userStatus;
	}
	
	public PgUsers(PgRoles pgRoles, String userId, String firstName, String lastName, String address,
			String phoneNumber, String cardId, String email, Boolean sex, String userPassword, Date createTime,
			Date modifiedTime, int userStatus, Set<PgOrders> pgOrderses, Set<PgLog> pgLogs) {
		this.pgRoles = pgRoles;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cardId = cardId;
		this.email = email;
		this.sex = sex;
		this.userPassword = userPassword;
		this.createTime = createTime;
		this.modifiedTime = modifiedTime;
		this.userStatus = userStatus;
		this.pgOrderses = pgOrderses;
		this.pgLogs = pgLogs;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "RECORD_ID", unique = true, nullable = false)
	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ROLE_ID", nullable = false)
	public PgRoles getPgRoles() {
		return this.pgRoles;
	}

	public void setPgRoles(PgRoles pgRoles) {
		this.pgRoles = pgRoles;
	}

	@Column(name = "USER_ID", unique = true, nullable = false, length = 50)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "FIRST_NAME", nullable = false, length = 50)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "LAST_NAME", nullable = false, length = 50)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "ADDRESS", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "PHONE_NUMBER", nullable = false, length = 20)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "CARD_ID", length = 20)
	public String getCardId() {
		return this.cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	@Column(name = "EMAIL", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "SEX")
	public Boolean getSex() {
		return this.sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	@Column(name = "USER_PASSWORD", nullable = false, length = 50)
	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 26)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "MODIFIED_TIME", length = 26)
	public Date getModifiedTime() {
		return this.modifiedTime;
	}

	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	@Column(name = "USER_STATUS", nullable = false)
	public int getUserStatus() {
		return this.userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pgUsers")
	public Set<PgOrders> getPgOrderses() {
		return this.pgOrderses;
	}

	public void setPgOrderses(Set<PgOrders> pgOrderses) {
		this.pgOrderses = pgOrderses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pgUsers")
	public Set<PgLog> getPgLogs() {
		return this.pgLogs;
	}

	public void setPgLogs(Set<PgLog> pgLogs) {
		this.pgLogs = pgLogs;
	}

}
