package com.blog.util;

import java.security.MessageDigest;

public class Functions {
	
	public static String emailToMd5(String message){
		String temp = "";
		try{
			MessageDigest md5Digest = MessageDigest.getInstance("MD5");
			byte[] encodeMd5Digest = md5Digest.digest(message.getBytes());
			temp = convertByteToHexString(encodeMd5Digest);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	public static String convertByteToHexString(byte[] bytes){
		String result = "";
		for(int i=0;i<bytes.length;i++){
			int temp = bytes[i]&0xff;
			String tempHex = Integer.toHexString(temp);
			if(tempHex.length()<2){
				result +="0"+tempHex;
			}else{
				result +=tempHex;
			}
		}
		return result;
	}
	
	//根据email获取gravatar头像
    public static String getGravatar(String email) {
        String emailMd5 = emailToMd5(email);
        //设置图片大小32px
        String avatar = "https://s.gravatar.com/avatar/"+emailMd5+"?s=32";
        return avatar;
    }
	public static void main(String[] args) {
//		String emailMd5 = emailToMd5("admin@199604.com");
//		System.out.println(emailMd5);//162d8d081d380691c5279df2bbef4152
//		System.out.println(emailMd5.equals("162d8d081d380691c5279df2bbef4152"));//true
		String gravatarImg = getGravatar("admin@199604.com");
		System.out.println(gravatarImg);
		//输出https://s.gravatar.com/avatar/162d8d081d380691c5279df2bbef4152?s=32
	}
}
