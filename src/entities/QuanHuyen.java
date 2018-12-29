package entities;

public class QuanHuyen {
      private int id_quanhuyen;
      private String name_quanhuyen;
	public int getId_quanhuyen() {
		return id_quanhuyen;
	}
	public void setId_quanhuyen(int id_quanhuyen) {
		this.id_quanhuyen = id_quanhuyen;
	}
	public String getName_quanhuyen() {
		return name_quanhuyen;
	}
	public void setName_quanhuyen(String name_quanhuyen) {
		this.name_quanhuyen = name_quanhuyen;
	}
	public QuanHuyen(int id_quanhuyen, String name_quanhuyen) {
		super();
		this.id_quanhuyen = id_quanhuyen;
		this.name_quanhuyen = name_quanhuyen;
	}
	public QuanHuyen() {
		super();
		// TODO Auto-generated constructor stub
	}
      
      
}
