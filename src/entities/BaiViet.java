package entities;



public class BaiViet {
     private String name_baiviet;
     private int id_baiviet;
     private String mota;
     private String chitiet;
     private String ngaydang;
     private String picture;
     private int trangthai;
	public int getId_baiviet() {
		return id_baiviet;
	}
	public void setId_baiviet(int id_baiviet) {
		this.id_baiviet = id_baiviet;
	}
	public String getName_baiviet() {
		return name_baiviet;
	}
	public void setName_baiviet(String name_baiviet) {
		this.name_baiviet = name_baiviet;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public String getChitiet() {
		return chitiet;
	}
	public void setChitiet(String chitiet) {
		this.chitiet = chitiet;
	}
	public String getNgaydang() {
		return ngaydang;
	}
	public void setNgaydang(String ngaydang) {
		this.ngaydang = ngaydang;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public BaiViet(int id_baiviet, String name_baiviet, String mota, String chitiet, String ngaydang, String picture,
			int trangthai) {
		super();
		this.id_baiviet = id_baiviet;
		this.name_baiviet = name_baiviet;
		this.mota = mota;
		this.chitiet = chitiet;
		this.ngaydang = ngaydang;
		this.picture = picture;
		this.trangthai = trangthai;
	}
	public BaiViet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
