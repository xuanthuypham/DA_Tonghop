package model;
// Generated Jun 16, 2018 10:24:04 AM by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PgProductPictures generated by hbm2java
 */
@Entity
@Table(name = "pg_product_pictures", catalog = "dath")
public class PgProductPictures implements java.io.Serializable {

	private Integer pictureSetId;
	private PgProducts pgProducts;
	private String path;
	private String pictureType;
	private Integer pictureStatus;
	private int orderIndex;

	public PgProductPictures() {
	}

	public PgProductPictures(PgProducts pgProducts, String path, int orderIndex) {
		this.pgProducts = pgProducts;
		this.path = path;
		this.orderIndex = orderIndex;
	}

	public PgProductPictures(PgProducts pgProducts, String path, String pictureType, Integer pictureStatus,
			int orderIndex) {
		this.pgProducts = pgProducts;
		this.path = path;
		this.pictureType = pictureType;
		this.pictureStatus = pictureStatus;
		this.orderIndex = orderIndex;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "PICTURE_SET_ID", unique = true, nullable = false)
	public Integer getPictureSetId() {
		return this.pictureSetId;
	}

	public void setPictureSetId(Integer pictureSetId) {
		this.pictureSetId = pictureSetId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRODUCT_ID", nullable = false)
	public PgProducts getPgProducts() {
		return this.pgProducts;
	}

	public void setPgProducts(PgProducts pgProducts) {
		this.pgProducts = pgProducts;
	}

	@Column(name = "PATH", nullable = false, length = 300)
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Column(name = "PICTURE_TYPE", length = 20)
	public String getPictureType() {
		return this.pictureType;
	}

	public void setPictureType(String pictureType) {
		this.pictureType = pictureType;
	}

	@Column(name = "PICTURE_STATUS")
	public Integer getPictureStatus() {
		return this.pictureStatus;
	}

	public void setPictureStatus(Integer pictureStatus) {
		this.pictureStatus = pictureStatus;
	}

	@Column(name = "ORDER_INDEX", nullable = false)
	public int getOrderIndex() {
		return this.orderIndex;
	}

	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}

}
