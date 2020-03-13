package com.qianfeng.utils;

import java.util.UUID;


public class StringUtil {
	
	

	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	


	public boolean strIfNull(String str){
		if (str==null||"".equals(str)) {
			return true;
		}
		return false;
	}
	

	public static String arrayToString(Object[] strs , String split){
		
		StringBuilder sb = new StringBuilder();
		
		if(null != strs){
			
			for(Object s : strs){
				sb.append(s).append(split);
			}
			
		}
		
		return sb.toString().substring(0, sb.length()-1);
	}

	


}