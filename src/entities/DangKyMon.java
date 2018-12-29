package entities;

public class DangKyMon {
      private int id_dangky;
      private int id_mon;
      private int id_lop;
      private int id_quanhuyen;
      private int id_user;
      private int luachon;
	public int getId_dangky() {
		return id_dangky;
	}
	public void setId_dangky(int id_dangky) {
		this.id_dangky = id_dangky;
	}
	public int getId_mon() {
		return id_mon;
	}
	public void setId_mon(int id_mon) {
		this.id_mon = id_mon;
	}
	public int getId_lop() {
		return id_lop;
	}
	public void setId_lop(int id_lop) {
		this.id_lop = id_lop;
	}
	public int getId_quanhuyen() {
		return id_quanhuyen;
	}
	public void setId_quanhuyen(int id_quanhuyen) {
		this.id_quanhuyen = id_quanhuyen;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getLuachon() {
		return luachon;
	}
	public void setLuachon(int luachon) {
		this.luachon = luachon;
	}
	public DangKyMon(int id_dangky, int id_mon, int id_lop, int id_quanhuyen, int id_user, int luachon) {
		super();
		this.id_dangky = id_dangky;
		this.id_mon = id_mon;
		this.id_lop = id_lop;
		this.id_quanhuyen = id_quanhuyen;
		this.id_user = id_user;
		this.luachon = luachon;
	}
	public DangKyMon() {
		super();
		// TODO Auto-generated constructor stub
	}
      
	
}
