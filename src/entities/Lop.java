package entities;

public class Lop {
     private int id_lop;
     private String lop;
     private int trangthai;
	public int getId_lop() {
		return id_lop;
	}
	public void setId_lop(int id_lop) {
		this.id_lop = id_lop;
	}
	public String getLop() {
		return lop;
	}
	public void setLop(String lop) {
		this.lop = lop;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public Lop(int id_lop, String lop, int trangthai) {
		super();
		this.id_lop = id_lop;
		this.lop = lop;
		this.trangthai = trangthai;
	}
	public Lop() {
		super();
		// TODO Auto-generated constructor stub
	}
     
	
}
