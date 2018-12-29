package entities;

public class KetNoi {
     private int id_ketnoi;
     private int id_giasu;
     private int id_phuhuynh;
	public int getId_ketnoi() {
		return id_ketnoi;
	}
	public void setId_ketnoi(int id_ketnoi) {
		this.id_ketnoi = id_ketnoi;
	}
	public int getId_giasu() {
		return id_giasu;
	}
	public void setId_giasu(int id_giasu) {
		this.id_giasu = id_giasu;
	}
	public int getId_phuhuynh() {
		return id_phuhuynh;
	}
	public void setId_phuhuynh(int id_phuhuynh) {
		this.id_phuhuynh = id_phuhuynh;
	}
	public KetNoi(int id_ketnoi, int id_giasu, int id_phuhuynh) {
		super();
		this.id_ketnoi = id_ketnoi;
		this.id_giasu = id_giasu;
		this.id_phuhuynh = id_phuhuynh;
	}
	public KetNoi() {
		super();
		// TODO Auto-generated constructor stub
	}
	
     
     
}
