package controller;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import constant.Defines;
import dao.BaiVietDAO;
import dao.GiaSuDAO;
import dao.PhuHuynhDAO;
import dao.ThongBaoDAO;
import dao.UserDAO;
import entities.HoaDon;
import entities.User;
import utils.SlugUtils;
import utils.Split;


@Controller

public class AdminIndexController {
	@Autowired
	private Defines defines;	
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private BaiVietDAO baivietDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private Split split;
	@Autowired
	private GiaSuDAO giasuDAO;
	@Autowired
	private PhuHuynhDAO phuhuynhDAO;
	@Autowired
	private ThongBaoDAO thongbaoDAO;
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("split", split);
		
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String index(Principal principal, ModelMap modelMap, HttpSession session){
		session.removeAttribute("GiaSuInfo");
		session.removeAttribute("PhuHuynhInfo");
		modelMap.addAttribute("listbaiviet", baivietDAO.getListBaiViet());
		modelMap.addAttribute("baiviet", "active");
    	return "admin.index.baiviet";
	}
	
	@RequestMapping(value="/admin/hoa-don", method=RequestMethod.GET)
	public String index(ModelMap modelMap){
		modelMap.addAttribute("listHoaDon", userDAO.getListHoaDon());
		modelMap.addAttribute("listUser", userDAO.getListUser());
		modelMap.addAttribute("hoadon","active");
    	return "admin.index.hoadon";
	}
	
	@RequestMapping(value="admin/nap-xu/{id}" , method=RequestMethod.POST)
    public String suawebxu(@PathVariable("id") int id, HttpServletRequest request){
		HoaDon objHoaDon = userDAO.getHoaDon(id);
		int webxunapvao = objHoaDon.getWebxunapvao();
		User objUser = userDAO.getItem(objHoaDon.getId_user());
		int webxu = objUser.getWebxu()+webxunapvao;
		if(objUser.getRole().equals("GIASU")){
		   if(giasuDAO.editWebXu(objUser.getId_user(), webxu)>0){
			   userDAO.editHoaDon(id);
			   thongbaoDAO.ThongBaoWebXu(objUser.getId_user(), webxu, webxunapvao);
			   return "redirect:/admin/hoa-don?msg=nap";
		   }
		}else{
			 if(phuhuynhDAO.editWebXu(objUser.getId_user(), webxu)>0){
				   thongbaoDAO.ThongBaoWebXu(objUser.getId_user(), webxu, webxunapvao);
				   userDAO.editHoaDon(id);
				   return "redirect:/admin/hoa-don?msg=nap";
			   }
		}
		return "redirect:/admin/hoa-don?msg=nonnap";
    }
	
	@RequestMapping(value="admin/xoa-hoadon/{id}" , method=RequestMethod.GET)
    public String xoa(@PathVariable("id") int id, HttpServletRequest request){
		userDAO.delHoaDon(id);
		return "redirect:/admin/hoa-don?msg=del";
    }
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "login.template";
	}
	@RequestMapping(value="/login" , method=RequestMethod.POST)
    public String login(Principal principal){
    	return "";
    }
	
	
}
