package entities;

public class LuuGiaSu {
      private int id_luugiasu;
      private int id_giasu;
      private int id_phuhuynh;
	public int getId_luugiasu() {
		return id_luugiasu;
	}
	public void setId_luugiasu(int id_luugiasu) {
		this.id_luugiasu = id_luugiasu;
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
	public LuuGiaSu(int id_luugiasu, int id_giasu, int id_phuhuynh) {
		super();
		this.id_luugiasu = id_luugiasu;
		this.id_giasu = id_giasu;
		this.id_phuhuynh = id_phuhuynh;
	}
	public LuuGiaSu() {
		super();
		// TODO Auto-generated constructor stub
	}
      
      
}
