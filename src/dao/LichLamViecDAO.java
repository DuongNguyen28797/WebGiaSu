package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.LichLamViec;


@Repository
public class LichLamViecDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
	 
	 public LichLamViec getobjSUA(int id_tkb) {
			String query = "SELECT * FROM thoikhoabieu WHERE id_tkb=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id_tkb}, new BeanPropertyRowMapper<LichLamViec>(LichLamViec.class));
		}
	
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<LichLamViec> getList(int id_giasu, int id_thu){
			String query= "SELECT * FROM thoikhoabieu WHERE id_giasu=? && id_thu=? ORDER BY giodau ASC";
			return jdbcTemplate.query(query,new Object[]{id_giasu, id_thu},new BeanPropertyRowMapper(LichLamViec.class) );
		}
	 
	
	 public int editLich(LichLamViec obj) {
			String query = "UPDATE thoikhoabieu SET id_phuhuynh=?, diadiem=?, noidung=?, giodau=?, phutdau=?, giocuoi=?, phutcuoi=? WHERE id_tkb=?";
			return jdbcTemplate.update(query, new Object[] {obj.getId_phuhuynh(), obj.getDiadiem(), obj.getNoidung(), obj.getGiodau(), obj.getPhutdau(), obj.getGiocuoi(), obj.getPhutcuoi(), obj.getId_tkb()});
		} 
	 public int delLienHe(int id) {
			String query = "DELETE FROM lienhe WHERE id_lienhe=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	 public int delTKB(int id) {
			String query = "DELETE FROM thoikhoabieu WHERE id_tkb=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	
	 public int addItem(LichLamViec objItem) {
			String query = "INSERT INTO thoikhoabieu(id_giasu, id_phuhuynh, id_thu, giodau, giocuoi, phutdau, phutcuoi, diadiem, noidung) VALUES (?,?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {objItem.getId_giasu(), objItem.getId_phuhuynh(), objItem.getId_thu(), objItem.getGiodau(), objItem.getGiocuoi(), objItem.getPhutdau(), objItem.getPhutcuoi(), objItem.getDiadiem(),objItem.getNoidung()});
		}
}
