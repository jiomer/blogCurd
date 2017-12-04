package com.blog.test;
 
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
 

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

 
public class TestMybatisGenerator {
 
    public static void main(String[] args) throws Exception {
    	
    	  //mbg执行过程中的警告信息
    		List<String> warnings = new ArrayList<String>();
    	  //当生成的代码重复时，覆盖源代码
    	   boolean overwrite = true;
    	  //读取mbg配置文件
//    	   File configFile = new File("./generator-config.xml");
    	   InputStream configFile= TestMybatisGenerator.class.getClassLoader().getResource("generator-config.xml").openStream();
    	   ConfigurationParser cp = new ConfigurationParser(warnings);
    	   Configuration config = cp.parseConfiguration(configFile);
    	   DefaultShellCallback callback = new DefaultShellCallback(overwrite);
          //创建mbg
    	   MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
          //执行生成代码
    	   myBatisGenerator.generate(null);
    	   System.out.println("生成代码成功，刷新项目，查看文件,然后执行TestMybatis.java");
         
    }
}