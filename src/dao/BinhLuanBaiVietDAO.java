package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.BinhLuanBaiViet;
import entities.BinhLuanGiaSu;

@Repository
public class BinhLuanBaiVietDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;

	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<BinhLuanBaiViet> getList(){
			String query= "SELECT * FROM binhluanbaiviet";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(BinhLuanBaiViet.class) );
		}
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<BinhLuanGiaSu> getListBLGS(int id_giasu){
			String query= "SELECT * FROM binhluangiasu WHERE id_giasu=?";
			return jdbcTemplate.query(query,new Object[] {id_giasu},new BeanPropertyRowMapper(BinhLuanGiaSu.class) );
		}
	 
	 public int addItem(BinhLuanBaiViet objItem) {
			String query = "INSERT INTO binhluanbaiviet(id_baiviet, name, email, comment, time) VALUES (?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {objItem.getId_baiviet(), objItem.getName(), objItem.getEmail(), objItem.getComment(), objItem.getTime()});
		}
	 
	 public int addItemGS(BinhLuanGiaSu objItem) {
			String query = "INSERT INTO binhluangiasu(id_giasu, name, email, comment, time, picture) VALUES (?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {objItem.getId_giasu(), objItem.getName(), objItem.getEmail(), objItem.getComment(), objItem.getTime(), objItem.getPicture()});
		}
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<BinhLuanBaiViet> getbinhluan(int id){
			String query= "SELECT * FROM binhluanbaiviet WHERE id_baiviet=?";
			return jdbcTemplate.query(query,new Object[] {id},new BeanPropertyRowMapper(BinhLuanBaiViet.class) );
		}
}
