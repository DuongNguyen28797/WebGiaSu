package entities;

public class LichLamViec {
     private int id_tkb;
     private int id_thu;
     private int id_giasu;
     private int id_phuhuynh;
     private int giodau;
     private int giocuoi;
     private int phutdau;
     private int phutcuoi;
     private String noidung;
	 private String diadiem;
	public int getId_tkb() {
		return id_tkb;
	}
	public void setId_tkb(int id_tkb) {
		this.id_tkb = id_tkb;
	}
	public int getId_thu() {
		return id_thu;
	}
	public void setId_thu(int id_thu) {
		this.id_thu = id_thu;
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
	public int getGiodau() {
		return giodau;
	}
	public void setGiodau(int giodau) {
		this.giodau = giodau;
	}
	public int getGiocuoi() {
		return giocuoi;
	}
	public void setGiocuoi(int giocuoi) {
		this.giocuoi = giocuoi;
	}
	public int getPhutdau() {
		return phutdau;
	}
	public void setPhutdau(int phutdau) {
		this.phutdau = phutdau;
	}
	public int getPhutcuoi() {
		return phutcuoi;
	}
	public void setPhutcuoi(int phutcuoi) {
		this.phutcuoi = phutcuoi;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getDiadiem() {
		return diadiem;
	}
	public void setDiadiem(String diadiem) {
		this.diadiem = diadiem;
	}
	public LichLamViec() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LichLamViec(int id_tkb, int id_thu, int id_giasu, int id_phuhuynh, int giodau, int giocuoi, int phutdau,
			int phutcuoi, String noidung, String diadiem) {
		super();
		this.id_tkb = id_tkb;
		this.id_thu = id_thu;
		this.id_giasu = id_giasu;
		this.id_phuhuynh = id_phuhuynh;
		this.giodau = giodau;
		this.giocuoi = giocuoi;
		this.phutdau = phutdau;
		this.phutcuoi = phutcuoi;
		this.noidung = noidung;
		this.diadiem = diadiem;
	}
	 
	 
     
     
}
