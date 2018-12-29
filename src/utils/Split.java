package utils;


public class Split {
	
	public static StringBuffer money(int tien) {
		String thanhTienS = String.valueOf(tien);
	
		StringBuffer s = new StringBuffer(thanhTienS);
		StringBuffer tmp = new StringBuffer();
		String tam=null;

		int point =s.length();
		while(point-3>0){
			 tam = "."+ s.substring(point-3, point);
			 point= point -3;
			 tmp.insert(0,tam);
		};
		tam="";
		for (int i = 0; i <point; i++) {
			tam = tam+ s.charAt(i);
		} 
		tmp.insert(0, tam);
		return tmp;
	}
	
}
