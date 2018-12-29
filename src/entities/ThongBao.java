package entities;

public class ThongBao {
     private int id_thongbao;
     private int loaithongbao;
     private int id_user;
     private int id_phuhuynh;
     private int id_giasu;
     private int webxuhientai;
     private int webxunapvao;
     private String time;
     private String name_giasu;
     private String name_phuhuynh;
     private String chapnhan;
     private String lido;
	public int getId_thongbao() {
		return id_thongbao;
	}
	public void setId_thongbao(int id_thongbao) {
		this.id_thongbao = id_thongbao;
	}
	public int getLoaithongbao() {
		return loaithongbao;
	}
	public void setLoaithongbao(int loaithongbao) {
		this.loaithongbao = loaithongbao;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getId_phuhuynh() {
		return id_phuhuynh;
	}
	public void setId_phuhuynh(int id_phuhuynh) {
		this.id_phuhuynh = id_phuhuynh;
	}
	public int getId_giasu() {
		return id_giasu;
	}
	public void setId_giasu(int id_giasu) {
		this.id_giasu = id_giasu;
	}
	public int getWebxuhientai() {
		return webxuhientai;
	}
	public void setWebxuhientai(int webxuhientai) {
		this.webxuhientai = webxuhientai;
	}
	public int getWebxunapvao() {
		return webxunapvao;
	}
	public void setWebxunapvao(int webxunapvao) {
		this.webxunapvao = webxunapvao;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getName_giasu() {
		return name_giasu;
	}
	public void setName_giasu(String name_giasu) {
		this.name_giasu = name_giasu;
	}
	public String getName_phuhuynh() {
		return name_phuhuynh;
	}
	public void setName_phuhuynh(String name_phuhuynh) {
		this.name_phuhuynh = name_phuhuynh;
	}
	public String getChapnhan() {
		return chapnhan;
	}
	public void setChapnhan(String chapnhan) {
		this.chapnhan = chapnhan;
	}
	public String getLido() {
		return lido;
	}
	public void setLido(String lido) {
		this.lido = lido;
	}
	public ThongBao(int id_thongbao, int loaithongbao, int id_user, int id_phuhuynh, int id_giasu, int webxuhientai,
			int webxunapvao, String time, String name_giasu, String name_phuhuynh, String chapnhan, String lido) {
		super();
		this.id_thongbao = id_thongbao;
		this.loaithongbao = loaithongbao;
		this.id_user = id_user;
		this.id_phuhuynh = id_phuhuynh;
		this.id_giasu = id_giasu;
		this.webxuhientai = webxuhientai;
		this.webxunapvao = webxunapvao;
		this.time = time;
		this.name_giasu = name_giasu;
		this.name_phuhuynh = name_phuhuynh;
		this.chapnhan = chapnhan;
		this.lido = lido;
	}
	public ThongBao() {
		super();
		// TODO Auto-generated constructor stub
	}
}
