package entities;

public class HoaDon {
     private String time;
     private int id_hoadon;
     private int id_user;
     private int webxunapvao;
     private int trangthai;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getId_hoadon() {
		return id_hoadon;
	}
	public void setId_hoadon(int id_hoadon) {
		this.id_hoadon = id_hoadon;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getWebxunapvao() {
		return webxunapvao;
	}
	public void setWebxunapvao(int webxunapvao) {
		this.webxunapvao = webxunapvao;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public HoaDon(String time, int id_hoadon, int id_user, int webxunapvao, int trangthai) {
		super();
		this.time = time;
		this.id_hoadon = id_hoadon;
		this.id_user = id_user;
		this.webxunapvao = webxunapvao;
		this.trangthai = trangthai;
	}
	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
