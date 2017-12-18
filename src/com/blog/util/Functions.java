package com.blog.util;

import java.security.MessageDigest;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
    //发送邮件
    public static void sendMail(String email,String code){
		//收信人的email
		String to = email;
		//邮件发送的email
		String from = "post@199604.com";
		//主机名
		String host = "smtp.exmail.qq.com";
		//创建连接对象，连接到邮箱服务器
		Properties properties = System.getProperties();
		//设置邮件服务器主机名
		properties.setProperty("mail.smtp.host", host);
		// 发送邮件协议名称
		properties.setProperty("mail.transport.protocol", "smtp");
		//发送服务器需要身份验证
		properties.put("mail.smtp.auth", "true");
		
		Session session  = Session.getDefaultInstance(properties,new  Authenticator() {
			
			public PasswordAuthentication getPasswordAuthentication()
	        {
				//发件人邮件用户名、密码
				return new PasswordAuthentication("post@199604.com", "xiaojun2014A");
	        }
		});
		
		try {
			//创建邮件对象
			MimeMessage message = new MimeMessage(session);
			//设置自定义发件人昵称  
	        String mailName="";  
	        try {  
	        	mailName=javax.mail.internet.MimeUtility.encodeText("Sunlife的投递员");  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
			//设置发件者
			message.setFrom(new InternetAddress(mailName+"<"+from+">"));
			//设置收件者
			message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));
			//设置邮件主题
			message.setSubject("欢迎您注册SunLife博客!");
			//设置邮件的正文
//			message.setText("This is actual message");
			message.setContent("<h1>请点击<a href='http://127.0.0.1:8080/Blog/activate?code="+code+"'>此链接</a>以激活账号</h1>", "text/html;charset=utf-8");
			//发送邮件
			Transport.send(message);
	        System.out.println("Sent message successfully....");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    //获取uuid
    public static String getCode(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
}
