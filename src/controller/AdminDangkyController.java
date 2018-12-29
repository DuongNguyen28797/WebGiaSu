package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import constant.Defines;
import dao.DangKyDAO;
import entities.LienHe;
import entities.Lop;
import entities.Mon;
import entities.QuanHuyen;
import utils.SlugUtils;


@Controller
@RequestMapping(value="admin/dangky")
public class AdminDangkyController {
	@Autowired
	private Defines defines;	
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private  DangKyDAO dangkyDAO;
	  
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("dangky", "active");
	}
	
	
	@RequestMapping(value = "/choose", method = RequestMethod.POST)
	public String choose(HttpServletRequest request) {
		String name_mon = new String(request.getParameter("name_mon"));
		String id_lop[]=request.getParameterValues("idchoose[]");
		String chuoi = "";
		for(int i=0; i< id_lop.length ; i++){
			String id = id_lop[i];
			chuoi = chuoi + id + ",";
		}	
		Mon objItem = new Mon(0, name_mon, chuoi);
		if (dangkyDAO.addMon(objItem)> 0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=add";
		}		
		
		return "redirect:admin/dangky/them-dang-ky?msg=nonadd";
	}
	
	
	@RequestMapping(value = "/edit-mon/{id_mon}", method = RequestMethod.POST)
	public String edit(HttpServletRequest request,@PathVariable("id_mon") int id_mon , ModelMap modelMap) {
		String name_mon = new String(request.getParameter("name_mon"));
		String id_lop[]=request.getParameterValues("idchoose[]");
		String chuoi = "";
		for(int i=0; i< id_lop.length ; i++){
			String id = id_lop[i];
			chuoi = chuoi + id + ",";
		}
		System.out.println(chuoi);
		Mon objItem = new Mon(id_mon, name_mon, chuoi);
		if (dangkyDAO.editMon(objItem)>0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=add";
		}		
		return "redirect:admin/dangky/them-dang-ky?msg=nonadd";
	}
	
	@RequestMapping(value="/edit-mon/{id}", method=RequestMethod.GET)
	public String editMon(@PathVariable("id") int id , ModelMap modelMap){
		Mon objMon = dangkyDAO.getMon(id);
		String dk_lop = objMon.getDk_lop();
		String[] listid_Lop=dk_lop.split(",");
		
		ArrayList<Lop> listdklop =  new ArrayList<Lop>();
		ArrayList<Lop> listLop =   (ArrayList<Lop>) dangkyDAO.getListLop();
		for(Lop lop: listLop){
			int iddk = lop.getId_lop();
			int n=listid_Lop.length-1;
			for(int i=0; i<n+1; i++){
				int id_lop = Integer.parseInt(listid_Lop[i]);
				if(iddk==id_lop){
					Lop objLop = new Lop(id_lop, lop.getLop(), 1);
					listdklop.add(objLop);
					break;
			}else{
				if(i==n){
					Lop objLop = new Lop(iddk, lop.getLop(), 0);
					listdklop.add(objLop);
				}
			}
			}
		}
		
	
		modelMap.addAttribute("objMon",objMon);
		modelMap.addAttribute("listdklop", listdklop);
		return "admin.edit.mon";
	}
	
	
	
	
	@RequestMapping(value="/lop-mon-quanhuyen" , method=RequestMethod.GET)
    public String indexBaiviet(ModelMap modelMap){
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
		modelMap.addAttribute("listQuanHuyen", dangkyDAO.getListQuanHuyen());
		modelMap.addAttribute("listMon", dangkyDAO.getListMon());
    	return "admin.index.dangky";
    }
	
	@RequestMapping(value="/them-dang-ky" , method=RequestMethod.GET)
    public String addBaiViet(ModelMap modelMap){
		modelMap.addAttribute("listLop", dangkyDAO.getListLop());
    	return "admin.index.them";
    }
	
	@RequestMapping(value = "/add-quanhuyen", method = RequestMethod.POST)
	public String addQuanHuyen(@ModelAttribute("objItem") QuanHuyen objItem,HttpServletRequest request) {
		if (!objItem.getName_quanhuyen().trim().equals("")){
			objItem.setName_quanhuyen(objItem.getName_quanhuyen().trim());
		if (dangkyDAO.addQuanHuyen(objItem)> 0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=add";
		}		
		}
		return "redirect:admin/dangky/them-dang-ky?msg=nonadd";
		
	}
	@RequestMapping(value = "/add-lop", method = RequestMethod.POST)
	public String addLop(@ModelAttribute("objItem") Lop objItem,HttpServletRequest request) {
		if (!objItem.getLop().trim().equals("")){
			objItem.setLop(objItem.getLop().trim());
		if (dangkyDAO.addLop(objItem)> 0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=add";
		}		
		}
		return "redirect:admin/dangky/them-dang-ky?msg=nonadd";
		
	}
	
	@RequestMapping(value="/edit-lop/{id}", method=RequestMethod.GET)
	public String editLop(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("objLop", dangkyDAO.getLop(id));
		return "admin.edit.lop";
	}

	@RequestMapping(value = "/edit-lop/{id}", method = RequestMethod.POST)
	public String editLop(@PathVariable("id") int id, @ModelAttribute("objItem") Lop objItem, HttpServletRequest request) {
		objItem.setId_lop(id);
		if (dangkyDAO.editLop(objItem) > 0){
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=edit";
		}else{
			return "redirect:admin/dangky/edit-lop?msg=nonedit";
	}
	}	 
	
	

	

	@RequestMapping(value="/edit-quanhuyen/{id}", method=RequestMethod.GET)
	public String editQuanHuyen(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("objQuanHuyen", dangkyDAO.getQuanHuyen(id));
		return "admin.edit.quanhuyen";
	}

	@RequestMapping(value = "/edit-quanhuyen/{id}", method = RequestMethod.POST)
	public String editMon(@PathVariable("id") int id, @ModelAttribute("objItem") QuanHuyen objItem, HttpServletRequest request) {
		objItem.setId_quanhuyen(id);
		if (dangkyDAO.editQuanHuyen(objItem) > 0){
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=edit";
		}else{
			return "redirect:admin/dangky/edit-lop?msg=nonedit";
	}
	}	
	@RequestMapping(value = "/del-lop/{id}", method = RequestMethod.GET)
	public String delLop(@PathVariable("id") int id) {
		if (dangkyDAO.delLop(id)> 0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=del";
		}		
		return "redirect:admin/dangky/them-dang-ky?msg=nondel";
	}
	@RequestMapping(value = "/del-mon/{id}", method = RequestMethod.GET)
	public String delMon(@PathVariable("id") int id) {
		if (dangkyDAO.delMon(id)> 0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=del";
		}		
		return "redirect:admin/dangky/them-dang-ky?msg=nondel";
	}
	@RequestMapping(value = "/del-quanhuyen/{id}", method = RequestMethod.GET)
	public String delQuanHuyen(@PathVariable("id") int id) {
		if (dangkyDAO.delQuanHuyen(id)> 0) {
			return "redirect:/admin/dangky/lop-mon-quanhuyen?msg=del";
		}		
		return "redirect:admin/dangky/them-dang-ky?msg=nondel";
	}
	
	@RequestMapping(value = "/del-lienhe/{id}", method = RequestMethod.GET)
	public String delLienhe(@PathVariable("id") int id) {
		if (dangkyDAO.delLienHe(id)>0) {
			return "redirect:/admin/dangky/lien-he?msg=del&soluongdel="+1;
		}		
		return "redirect:admin/dangky/lien-he?msg=nondel";
	}
	
	@RequestMapping(value="/lien-he" , method=RequestMethod.GET)
    public String lienhe(ModelMap modelMap){
		modelMap.addAttribute("listlienhe", dangkyDAO.getListLienHe());
    	return "admin.lienhe";
    }
	@RequestMapping(value = "/dels-lienhe", method = RequestMethod.GET)
	public String dels(HttpServletRequest request) {	
		String id_LienHe[]=request.getParameterValues("iddel[]");
		int soluong = id_LienHe.length;
		for(int i=0; i< id_LienHe.length ; i++){
			int id = Integer.parseInt(id_LienHe[i]);
			if(dangkyDAO.delLienHe(id)<0){
				return "redirect:/admin/dangky/lien-he?msg=nondel";
			}
		
		}				
		    return "redirect:/admin/dangky/lien-he?msg=del&soluongdel="+soluong;
	}
	
	@RequestMapping(value="/lien-he", method=RequestMethod.POST)	
	public void addLienHe(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		 PrintWriter out = response.getWriter();
		String fullname = new String(request.getParameter("fullname"));
		String phone = new String(request.getParameter("phone"));
		String email = new String(request.getParameter("email"));
		String aid_nguoigoi = new String(request.getParameter("id_nguoigoi"));
		int id_nguoigoi = Integer.parseInt(aid_nguoigoi);
		String picture = new String(request.getParameter("picture"));
		String noidung = new String(request.getParameter("noidung"));
		LienHe objMessage = new LienHe(0, fullname, picture, phone, 1, noidung, "", email, id_nguoigoi);
		if(dangkyDAO.addLienHe(objMessage)<0){
			System.out.println("@@");
		}
		
		out.print("<h4 class=\"dagui\" style=\"margin-left: -15%;font-family: arial\">Đã gửi !</h4>");
	}
	
	@RequestMapping(value="/chitiet-lienhe/{id}" , method=RequestMethod.GET)
    public String chitietLienHe(@PathVariable("id") int id,ModelMap modelMap){
		modelMap.addAttribute("LienHe", dangkyDAO.getLienHe(id));
    	return "admin.lienhe.chitiet";
    }
	
}
