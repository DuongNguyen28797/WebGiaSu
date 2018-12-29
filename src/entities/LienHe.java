package entities;

public class LienHe {
      private int id_lienhe;
      private String fullname;
      private String picture;
      private String phone;
      private int trangthai;
      private String noidung;
      private String time;
      private String email;
      private int id_nguoigoi;
	public int getId_lienhe() {
		return id_lienhe;
	}
	public void setId_lienhe(int id_lienhe) {
		this.id_lienhe = id_lienhe;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId_nguoigoi() {
		return id_nguoigoi;
	}
	public void setId_nguoigoi(int id_nguoigoi) {
		this.id_nguoigoi = id_nguoigoi;
	}
	public LienHe(int id_lienhe, String fullname, String picture, String phone, int trangthai, String noidung,
			String time, String email, int id_nguoigoi) {
		super();
		this.id_lienhe = id_lienhe;
		this.fullname = fullname;
		this.picture = picture;
		this.phone = phone;
		this.trangthai = trangthai;
		this.noidung = noidung;
		this.time = time;
		this.email = email;
		this.id_nguoigoi = id_nguoigoi;
	}
	public LienHe() {
		super();
		// TODO Auto-generated constructor stub
	}
      
      
      
}
