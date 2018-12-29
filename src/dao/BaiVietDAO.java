package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.BaiViet;

@Repository
public class BaiVietDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;

	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<BaiViet> getListBaiViet(){
			String query= "SELECT * FROM baiviet ORDER BY id_baiviet DESC LIMIT 9";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(BaiViet.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<BaiViet> getListBV(){
			String query= "SELECT * FROM baiviet ORDER BY id_baiviet DESC";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(BaiViet.class) );
		}
	 public int editTrangthai(int id_sp, int atrangthai){
			String query="UPDATE baiviet SET trangthai=? WHERE id_baiviet=?";
			return jdbcTemplate.update(query, new Object[]{atrangthai, id_sp} );			
		} 
	 public int addItem(BaiViet objItem) {
			String query = "INSERT INTO baiviet(name_baiviet,mota,chitiet,picture) VALUES (?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_baiviet(), objItem.getMota(), objItem.getChitiet(), objItem.getPicture()});
		}
	 
	 public BaiViet getItem(int id) {
			String query = "SELECT * FROM baiviet WHERE id_baiviet=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<BaiViet>(BaiViet.class));
		}
	 public int editItem(BaiViet objItem) {
			String query = "UPDATE baiviet SET name_baiviet=?,mota=?,chitiet=?,picture=?  WHERE id_baiviet=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_baiviet(), objItem.getMota(), objItem.getChitiet(), objItem.getPicture(), objItem.getId_baiviet()});
		}
	 public int delItem(int id) {
			String query = "DELETE FROM baiviet WHERE id_baiviet=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
}
