package entities;

public class Mon {
     private int id_mon;
     private String name_mon;
     private String dk_lop;
	public int getId_mon() {
		return id_mon;
	}
	public void setId_mon(int id_mon) {
		this.id_mon = id_mon;
	}
	public String getName_mon() {
		return name_mon;
	}
	public void setName_mon(String name_mon) {
		this.name_mon = name_mon;
	}
	public String getDk_lop() {
		return dk_lop;
	}
	public void setDk_lop(String dk_lop) {
		this.dk_lop = dk_lop;
	}
	public Mon(int id_mon, String name_mon, String dk_lop) {
		super();
		this.id_mon = id_mon;
		this.name_mon = name_mon;
		this.dk_lop = dk_lop;
	}
	public Mon() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
