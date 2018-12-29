package controller;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import constant.Defines;
import dao.BaiVietDAO;
import dao.PhuHuynhDAO;
import dao.ThongBaoDAO;
import entities.BaiViet;
import entities.User;
import utils.SlugUtils;
import utils.Split;


@Controller
@RequestMapping(value="admin/phuhuynh")
public class AdminPhuHuynhController {
	@Autowired
	private Defines defines;	
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private Split split;
	@Autowired
	private BaiVietDAO baivietDAO;
	@Autowired
	private PhuHuynhDAO phuhuynhDAO;
	@Autowired
	private ThongBaoDAO thongbaoDAO;
	
	
	
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("split", split);
		modelMap.addAttribute("phuhuynh", "active");
	}
	
	@RequestMapping(value="" , method=RequestMethod.GET)
    public String indexBaiviet(ModelMap modelMap){
		modelMap.addAttribute("listphuhuynh", phuhuynhDAO.getListPhuHuynh());
    	return "admin.index.phuhuynh";
    }
	
	@RequestMapping(value="/tangxu/{id}" , method=RequestMethod.GET)
    public String webxu(@PathVariable("id") int id,ModelMap modelMap){
			modelMap.addAttribute("PhuHuynh", phuhuynhDAO.getItem(id));
    	return "admin.suawebxu.phuhuynh";
    }
	
	@RequestMapping(value="/tangxu/{id}" , method=RequestMethod.POST)
    public String suawebxu(@PathVariable("id") int id, HttpServletRequest request){
		int webxu = Integer.parseInt(request.getParameter("webxu"));
		int webxucu = Integer.parseInt(request.getParameter("webxucu"));
		int webxunapvao = webxu - webxucu;
		   if(phuhuynhDAO.editWebXu(id, webxu)>0){
			   thongbaoDAO.ThongBaoWebXu(id, webxu, webxunapvao);
			   return "redirect:/admin/phuhuynh?msg=edit";
		   }
		   return "redirect:/admin/phuhuynh/tangxu?msg=noedit";
    }

	
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id , ModelMap modelMap){
		modelMap.addAttribute("objItem", baivietDAO.getItem(id));
		return "admin.baiviet.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objItem") BaiViet objItem,
			@RequestParam("file") CommonsMultipartFile multipartFile, HttpServletRequest request) {
		objItem.setId_baiviet(id);
		// xử lý ảnh
		BaiViet obj = baivietDAO.getItem(id);
		String fileName = multipartFile.getOriginalFilename();
          
		if (!fileName.isEmpty()) {
			String dirPath = request.getServletContext().getRealPath("files");
			String filePath = dirPath + File.separator + fileName;
			File file = new File(filePath);
			try {
				multipartFile.transferTo(file);
				System.out.println("up file thành công ");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			objItem.setPicture(fileName);
			//xóa hình cũ
			
			if (!obj.getPicture().equals("")) {
				String fileOld = dirPath + File.separator + obj.getPicture();
				File old = new File(fileOld);
				if (!old.exists())
				old.delete();
			}
		} else {
			objItem.setPicture(obj.getPicture());
		}
	
		if (baivietDAO.editItem(objItem) > 0){
			return "redirect:/admin/baiviet?msg=edit";
		}else{
			return "redirect:/admin/baiviet/edit?msg=nonedit";
	}
	}	
	@RequestMapping(value = "del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id, HttpServletRequest request) {
		User obj = phuhuynhDAO.getItem(id);
		if (phuhuynhDAO.delItem(id) > 0) {
			
			if (!obj.getPicture().equals("")) {
				String dirPath = request.getServletContext().getRealPath("files");
				String filePath = dirPath + File.separator + obj.getPicture();
				File file = new File(filePath);
				if (!file.exists())
				file.delete();
				
			}
			return "redirect:/admin/phuhuynh?msg=del&soluongdel="+1;
		}
		return "redirect:/admin/phuhuynh?msg=nondel";
	}
	@RequestMapping(value = "/dels", method = RequestMethod.GET)
	public String dels(HttpServletRequest request) {	
		String id_PhuHuynh[]=request.getParameterValues("iddel[]");
		int soluong = id_PhuHuynh.length;
		for(int i=0; i< id_PhuHuynh.length ; i++){
			int id_phuhuynh = Integer.parseInt(id_PhuHuynh[i]);
			if(phuhuynhDAO.delItem(id_phuhuynh)<0){
				return "redirect:/admin/phuhuynh?msg=nondel";
			}
		
		}				
		    return "redirect:/admin/phuhuynh?msg=del&soluongdel="+soluong;
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/kichhoat", method=RequestMethod.POST)
	public void kichhoat(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		PrintWriter out = response.getWriter();
		int trangthai= Integer.parseInt(request.getParameter("trangthai"));
		int atrangthai;
		if(trangthai==1){
		    atrangthai = 0;
		}else{
			atrangthai =1;
		}
		int id_sp = Integer.parseInt(request.getParameter("id_sp"));
		phuhuynhDAO.editTrangthai(id_sp, atrangthai);		
		if(trangthai== 0){
			out.print(
					"<a href=\"javascrip:void(0)\"  title=\"ngừng kích hoạt\" class=\"noactive\"> "+
							"<img src=\""+request.getContextPath()+"/templates/admin/assets/img/active.gif \">"+
						"</a>"
		);
		}else{
			out.print(
					"<a href=\"javascrip:void(0)\"  title=\"kích hoạt\" > "+
							"<img src=\""+request.getContextPath()+"/templates/admin/assets/img/noactive.gif\">"+
						"</a>"
				);
		}
	}
	
	@RequestMapping(value="/chitiet-phuhuynh/{id}" , method=RequestMethod.GET)
    public String chitiet(@PathVariable("id") int id,ModelMap modelMap){
		modelMap.addAttribute("PhuHuynh", phuhuynhDAO.getItem(id));
    	return "admin.phuhuynh.chitiet";
    }
	
	
}
