package entities;

public class BinhLuanBaiViet {
     private int id_binhluanbv;
     private int id_baiviet;
     private String name;
     private String email;
     private String comment;
     private String time;
	public int getId_binhluanbv() {
		return id_binhluanbv;
	}
	public void setId_binhluanbv(int id_binhluanbv) {
		this.id_binhluanbv = id_binhluanbv;
	}
	public int getId_baiviet() {
		return id_baiviet;
	}
	public void setId_baiviet(int id_baiviet) {
		this.id_baiviet = id_baiviet;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public BinhLuanBaiViet(int id_binhluanbv, int id_baiviet, String name, String email, String comment, String time) {
		super();
		this.id_binhluanbv = id_binhluanbv;
		this.id_baiviet = id_baiviet;
		this.name = name;
		this.email = email;
		this.comment = comment;
		this.time = time;
	}
	public BinhLuanBaiViet() {
		super();
		// TODO Auto-generated constructor stub
	}
     
	
}
