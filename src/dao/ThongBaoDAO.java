package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.ThongBao;


@Repository
public class ThongBaoDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
	
	 public int delItem(int id) {
			String query = "DELETE FROM thongbao WHERE id_thongbao=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<ThongBao> getList(int id){
			String query= "SELECT * FROM thongbao WHERE id_user=? ORDER BY id_thongbao DESC LIMIT 4";
			return jdbcTemplate.query(query,new Object[]{id},new BeanPropertyRowMapper(ThongBao.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<ThongBao> getListThongBao(int id){
			String query= "SELECT * FROM thongbao WHERE id_user=? ORDER BY id_thongbao DESC";
			return jdbcTemplate.query(query,new Object[]{id},new BeanPropertyRowMapper(ThongBao.class) );
		}
	 
	 public int ThongBaoWebXu(int id_user,int webxuhientai, int webxunapvao) {
			String query = "INSERT INTO thongbao(id_user,webxuhientai,webxunapvao,loaithongbao) VALUES (?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {id_user, webxuhientai, webxunapvao,1});
		}
	 
	 public int ThongBaoDongY(int id_user,int id_phuhuynh, String name_giasu,String name_phuhuynh) {
			String query = "INSERT INTO thongbao(id_user,id_giasu, id_phuhuynh, loaithongbao, name_giasu, name_phuhuynh) VALUES (?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {id_user, id_user, id_phuhuynh, 2, name_giasu, name_phuhuynh});
		}
	 public int ThongBaoTuChoi(int id_user,int id_phuhuynh, String name_giasu,String name_phuhuynh, String lido) {
			String query = "INSERT INTO thongbao(id_user,id_giasu, id_phuhuynh, loaithongbao, name_giasu, name_phuhuynh, lido, chapnhan) VALUES (?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {id_user, id_user, id_phuhuynh, 5, name_giasu, name_phuhuynh, lido, 0});
		} 
	 public int ThongBaoNhanDongY(int id_user,int id_giasu,String name_giasu,String name_phuhuynh) {
			String query = "INSERT INTO thongbao(id_user,id_giasu, id_phuhuynh, loaithongbao,name_giasu, name_phuhuynh) VALUES (?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {id_user, id_giasu, id_user, 4,name_giasu, name_phuhuynh});
		}
	 public int KetNoi(int id_giasu, int id_phuhuynh) {
			String query = "INSERT INTO ketnoi(id_giasu, id_phuhuynh) VALUES (?,?)";
			return jdbcTemplate.update(query, new Object[] {id_giasu, id_phuhuynh});
		}
	 
	 public int ThongBaoLoiMoi(int id_giasu, int id_phuhuynh, String name) {
			String query = "INSERT INTO thongbao(id_user,id_giasu, id_phuhuynh, loaithongbao, name_phuhuynh) VALUES (?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {id_giasu, id_giasu, id_phuhuynh, 3, name});
		}
	
	 public int editdAdOC(int id_user) {
			String query = "UPDATE thongbao SET trangthai=?  WHERE trangthai=? && id_user=?";
			return jdbcTemplate.update(query, new Object[] {0, 1, id_user});
		} 
	 public int editChapNhan(int id_thongbao) {
			String query = "UPDATE thongbao SET chapnhan=?  WHERE id_thongbao=?";
			return jdbcTemplate.update(query, new Object[] {0,id_thongbao});
		} 
	 public int delLienHe(int id) {
			String query = "DELETE FROM lienhe WHERE id_lienhe=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	
	 public int count(int id_user){
			String query= "SELECT COUNT(*) AS countChuaDoc FROM thongbao WHERE trangthai=1 && id_user=?";
			return  jdbcTemplate.queryForObject(query, new Object[] {id_user},Integer.class);
		}
	
}
