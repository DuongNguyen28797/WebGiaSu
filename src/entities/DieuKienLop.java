package entities;

public class DieuKienLop {
    private int id_lop;
    private int id_mon;
    private int trangthai;
    private int id_dk;
    
    
	public int getId_lop() {
		return id_lop;
	}
	public void setId_lop(int id_lop) {
		this.id_lop = id_lop;
	}
	public int getId_mon() {
		return id_mon;
	}
	public void setId_mon(int id_mon) {
		this.id_mon = id_mon;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public int getId_dk() {
		return id_dk;
	}
	public void setId_dk(int id_dk) {
		this.id_dk = id_dk;
	}
	public DieuKienLop() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DieuKienLop(int id_lop, int id_mon, int trangthai, int id_dk) {
		super();
		this.id_lop = id_lop;
		this.id_mon = id_mon;
		this.trangthai = trangthai;
		this.id_dk = id_dk;
	}
    
    
}
