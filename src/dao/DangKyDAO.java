package dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.DangKyMon;
import entities.LienHe;
import entities.Lop;
import entities.Mon;
import entities.QuanHuyen;

@Repository
public class DangKyDAO {
	 @Autowired
		private JdbcTemplate jdbcTemplate;
      
	
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<DangKyMon> getListTimKiemGiaSu(int id_lop, int id_quanhuyen, int id_mon){
			String query= "SELECT * FROM dangkymon WHERE id_lop=? && id_mon=? && id_quanhuyen=?";
			return jdbcTemplate.query(query,new Object[] {id_lop, id_mon, id_quanhuyen},new BeanPropertyRowMapper(DangKyMon.class) );
		} 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<DangKyMon> getListDKM(){
			String query= "SELECT * FROM dangkymon";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(DangKyMon.class) );
		} 
	 
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<DangKyMon> getListMonDay(int id_user){
			String query= "SELECT * FROM dangkymon WHERE id_user=?";
			return jdbcTemplate.query(query,new Object[] {id_user},new BeanPropertyRowMapper(DangKyMon.class) );
		} 
	 
	 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<DangKyMon> getListDangKy(int id_user, int luachon){
			String query= "SELECT * FROM dangkymon WHERE id_user=? && luachon=?";
			return jdbcTemplate.query(query,new Object[] {id_user,luachon},new BeanPropertyRowMapper(DangKyMon.class) );
		} 
	 public DangKyMon getDK(int id_user, int luachon) {
			String query = "SELECT * FROM dangkymon WHERE id_user=? && luachon=?";
			try{
			return jdbcTemplate.queryForObject(query, new Object[] {id_user,luachon}, new BeanPropertyRowMapper<DangKyMon>(DangKyMon.class));
			}catch (EmptyResultDataAccessException e) {
				return null;
			}
		}
	 public int addDangKy(int id_mon,int id_lop,int id_quanhuyen,int id_user, int luachon) {
			String query = "INSERT INTO dangkymon(id_mon,id_lop,id_quanhuyen,id_user,luachon) VALUES (?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] {id_mon, id_lop, id_quanhuyen, id_user,luachon});
		}
	 public int editDangKy(int id_mon,int id_lop,int id_user, int luachon) {
			String query = "UPDATE dangkymon SET id_mon=?, id_lop=? WHERE id_user=? && luachon=?";
			return jdbcTemplate.update(query, new Object[] {id_mon, id_lop, id_user, luachon});
		}
	 public LienHe getLienHe(int id) {
			String query = "SELECT * FROM lienhe WHERE id_lienhe=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<LienHe>(LienHe.class));
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<LienHe> getListLienHe(){
			String query= "SELECT * FROM lienhe";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(LienHe.class) );
		} 
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<QuanHuyen> getListQuanHuyen(){
			String query= "SELECT * FROM quanhuyen";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(QuanHuyen.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<Lop> getListLop(){
			String query= "SELECT * FROM lop";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(Lop.class) );
		}
	 @SuppressWarnings({ "unchecked", "rawtypes" })
		public List<Mon> getListMon(){
			String query= "SELECT * FROM mon";
			return jdbcTemplate.query(query,new BeanPropertyRowMapper(Mon.class) );
		}
	
	 
	 
	 public int addQuanHuyen(QuanHuyen objItem) {
			String query = "INSERT INTO quanhuyen(name_quanhuyen) VALUES (?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_quanhuyen()});
		}
	 
	 public int addLop(Lop objItem) {
			String query = "INSERT INTO lop(lop) VALUES (?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getLop()});
		}
	 
	 public int addMon(Mon objItem) {
			String query = "INSERT INTO mon(name_mon, dk_lop) VALUES (?,?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_mon(), objItem.getDk_lop()});
		}
	 
	 public int addLienHe(LienHe objItem) {
			String query = "INSERT INTO lienhe(fullname, phone, email, noidung, picture, id_nguoigoi) VALUES (?,?,?,?,?,?)";
			return jdbcTemplate.update(query, new Object[] { objItem.getFullname(), objItem.getPhone(), objItem.getEmail(), objItem.getNoidung(), objItem.getPicture(), objItem.getId_nguoigoi()});
		}
	 
	 
	 public Lop getLop(int id) {
			String query = "SELECT * FROM lop WHERE id_lop=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<Lop>(Lop.class));
		}
	 public Mon getMon(int id) {
			String query = "SELECT * FROM mon WHERE id_mon=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<Mon>(Mon.class));
		}
	 public QuanHuyen getQuanHuyen(int id) {
			String query = "SELECT * FROM quanhuyen WHERE id_quanhuyen=?";
			return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<QuanHuyen>(QuanHuyen.class));
		}
	 
	 
	 
	 public int editLop(Lop objItem) {
			String query = "UPDATE lop SET lop=? WHERE id_lop=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getLop(), objItem.getId_lop()});
		}
	 public int editMon(Mon objItem) {
			String query = "UPDATE mon SET name_mon=?, dk_lop=? WHERE id_mon=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_mon(),objItem.getDk_lop(),objItem.getId_mon()});
		}
	 public int editQuanHuyen(QuanHuyen objItem) {
			String query = "UPDATE quanhuyen SET name_quanhuyen=? WHERE id_quanhuyen=?";
			return jdbcTemplate.update(query, new Object[] { objItem.getName_quanhuyen(), objItem.getId_quanhuyen()});
		}
	 
	 
	 public int delLop(int id) {
			String query = "DELETE FROM lop WHERE id_lop=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	 public int delMon(int id) {
			String query = "DELETE FROM mon WHERE id_mon=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	 public int delQuanHuyen(int id) {
			String query = "DELETE FROM quanhuyen WHERE id_quanhuyen=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	 public int delLienHe(int id) {
			String query = "DELETE FROM lienhe WHERE id_lienhe=? ";
			return jdbcTemplate.update(query, new Object[] { id });
		}
	
	
}
