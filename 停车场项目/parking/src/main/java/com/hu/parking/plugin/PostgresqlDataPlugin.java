package com.hu.parking.plugin;

import java.util.List;
import java.sql.Types;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.ShellRunner;
import org.mybatis.generator.api.dom.java.TopLevelClass;
import org.mybatis.generator.api.dom.xml.Attribute;
import org.mybatis.generator.api.dom.xml.Document;
import org.mybatis.generator.api.dom.xml.TextElement;
import org.mybatis.generator.api.dom.xml.XmlElement;
import org.mybatis.generator.codegen.mybatis3.MyBatis3FormattingUtilities;


public class PostgresqlDataPlugin extends PluginAdapter  {
	 @Override  
	    public boolean modelExampleClassGenerated(TopLevelClass topLevelClass,  
	            IntrospectedTable introspectedTable) {      
	        return super.modelExampleClassGenerated(topLevelClass,  
	                introspectedTable);  
	    }  
	  
	    @Override  
	    public boolean sqlMapDocumentGenerated(Document document,  
	            IntrospectedTable introspectedTable) {  
	        XmlElement parentElement = document.getRootElement();
	        //生成查询所有记录语句
	        selectAllElementGenerator(introspectedTable, parentElement);
	        // 生成分页语句
	        findByParamsElementGenerator(introspectedTable,parentElement);
	        // 生成分页记录总数语句
	        findByParamsCountElementGenerator(introspectedTable,parentElement);
	        //生成按key查询语句
	        findByKeyElementGenerator(introspectedTable,parentElement);
	        //生成按key查询记录数语句
	        findByKeyCountElementGenerator(introspectedTable,parentElement);
	        return super.sqlMapDocumentGenerated(document, introspectedTable);  
	    }  
	    
	    // 生成分页语句  
	    public void findByParamsElementGenerator(IntrospectedTable introspectedTable, XmlElement parentElement){
	        XmlElement answer = new XmlElement("select");
	        answer.addAttribute(new Attribute("id",  
	                "findByParams"));          
	        answer.addAttribute(new Attribute("resultMap", //$NON-NLS-1$
	                    introspectedTable.getBaseResultMapId()));
	        answer.addAttribute(new Attribute("parameterType", "map")); //$NON-NLS-1$

	        answer.addElement(new TextElement("select"));
	        
	        XmlElement includeBaseColumnElement = new XmlElement("include");
	        includeBaseColumnElement.addAttribute(new Attribute("refid",  
	                "Base_Column_List"));
	        answer.addElement(includeBaseColumnElement);
	        StringBuilder sb = new StringBuilder();
	        sb.append("from ");
	        sb.append(introspectedTable
	                .getAliasedFullyQualifiedTableNameAtRuntime());
	        answer.addElement(new TextElement(sb.toString()));
	        
	        XmlElement orderColumnElement = new XmlElement("if");  
	        orderColumnElement.addAttribute(new Attribute("test", "sortName != null"));
	        orderColumnElement.addElement(new TextElement("order by ${sortName}"));
	        
	        XmlElement orderSortElement = new XmlElement("if");  
	        orderSortElement.addAttribute(new Attribute("test", "sortOrder != null"));
	        orderSortElement.addElement(new TextElement("${sortOrder}"));
	        orderColumnElement.addElement(orderSortElement);
	        answer.addElement(orderColumnElement);
	        
	        
	        XmlElement pageStartElement = new XmlElement("if");  
	        pageStartElement.addAttribute(new Attribute("test", "pageSize != null and startNum != null"));
	        pageStartElement.addElement(new TextElement("limit #{pageSize} offset #{startNum}"));
	        answer.addElement(pageStartElement);
	        parentElement.addElement(answer);    	
	    }
	    
	    // 按列查询
	    public void findByKeyElementGenerator(IntrospectedTable introspectedTable, XmlElement parentElement){
	        XmlElement answer = new XmlElement("select");
	        answer.addAttribute(new Attribute("id",  
	                "findByKey"));          
	        answer.addAttribute(new Attribute("resultMap", //$NON-NLS-1$
	                    introspectedTable.getBaseResultMapId()));
	        answer.addAttribute(new Attribute("parameterType", "map")); //$NON-NLS-1$

	        answer.addElement(new TextElement("select"));
	        
	        XmlElement includeBaseColumnElement = new XmlElement("include");
	        includeBaseColumnElement.addAttribute(new Attribute("refid",  
	                "Base_Column_List"));
	        answer.addElement(includeBaseColumnElement);
	        StringBuilder sb = new StringBuilder();
	        sb.append("from ");
	        sb.append(introspectedTable
	                .getAliasedFullyQualifiedTableNameAtRuntime());
	        answer.addElement(new TextElement(sb.toString()));
	        XmlElement whereElement = new XmlElement("where");
	        XmlElement keyElement = new XmlElement("if");
	        keyElement.addAttribute(new Attribute("test", "ckey != null and cvalue != null"));
	        keyElement.addElement(new TextElement("and ${ckey} = #{cvalue}"));
	        XmlElement pkeyElement = new XmlElement("if");
	        pkeyElement.addAttribute(new Attribute("test", "pkey != null and pvalue != null"));
	        pkeyElement.addElement(new TextElement("and ${pkey} != #{pvalue}"));
	        whereElement.addElement(keyElement);
	        whereElement.addElement(pkeyElement);
	        answer.addElement(whereElement);
	        parentElement.addElement(answer);    	
	    }
	    
	    // 生成记录总数语句
	    public void findByParamsCountElementGenerator(IntrospectedTable introspectedTable, XmlElement parentElement){
	        XmlElement answer = new XmlElement("select");
	        answer.addAttribute(new Attribute("id",  
	                "findByParamsCount"));          
	        answer.addAttribute(new Attribute("resultType", "int"));
	        answer.addAttribute(new Attribute("parameterType", "map")); //$NON-NLS-1$  
	        StringBuilder sb = new StringBuilder();
	        sb.append("select count(*) from ");
	        sb.append(introspectedTable
	                .getAliasedFullyQualifiedTableNameAtRuntime());
	        answer.addElement(new TextElement(sb.toString()));  
	        parentElement.addElement(answer);	    	
	    }
	    
	 // 生成按键查询总数语句
	    public void findByKeyCountElementGenerator(IntrospectedTable introspectedTable, XmlElement parentElement){
	        XmlElement answer = new XmlElement("select");
	        answer.addAttribute(new Attribute("id",  
	                "findByKeyCount"));          
	        answer.addAttribute(new Attribute("resultType", "int"));
	        answer.addAttribute(new Attribute("parameterType", "map")); //$NON-NLS-1$  
	        StringBuilder sb = new StringBuilder();
	        sb.append("select count(*) from ");
	        sb.append(introspectedTable
	                .getAliasedFullyQualifiedTableNameAtRuntime());
	        answer.addElement(new TextElement(sb.toString()));
	        XmlElement whereElement = new XmlElement("where");
	        XmlElement keyElement = new XmlElement("if");
	        keyElement.addAttribute(new Attribute("test", "ckey != null and cvalue != null"));
	        keyElement.addElement(new TextElement("and ${ckey} = #{cvalue}"));
	        XmlElement pkeyElement = new XmlElement("if");
	        pkeyElement.addAttribute(new Attribute("test", "pkey != null and pvalue != null"));
	        pkeyElement.addElement(new TextElement("and ${pkey} != #{pvalue}"));
	        whereElement.addElement(keyElement);
	        whereElement.addElement(pkeyElement);
	        answer.addElement(whereElement);
	        parentElement.addElement(answer);	    	
	    }
	    
	 // 生成查询所有语句
	    public void selectAllElementGenerator(IntrospectedTable introspectedTable, XmlElement parentElement){
	    	XmlElement answer = new XmlElement("select");
	        answer.addAttribute(new Attribute("id",  
	                "selectAll"));          
	        answer.addAttribute(new Attribute("resultMap", //$NON-NLS-1$
	                    introspectedTable.getBaseResultMapId()));
	        answer.addAttribute(new Attribute("parameterType", "map")); //$NON-NLS-1$
	        answer.addElement(new TextElement("select"));	        
	        XmlElement includeBaseColumnElement = new XmlElement("include");
	        includeBaseColumnElement.addAttribute(new Attribute("refid",  
	                "Base_Column_List"));
	        answer.addElement(includeBaseColumnElement);
	        StringBuilder sb = new StringBuilder();
	        sb.append("from ");
	        sb.append(introspectedTable
	                .getAliasedFullyQualifiedTableNameAtRuntime());
	        answer.addElement(new TextElement(sb.toString()));
	        
	        XmlElement orderColumnElement = new XmlElement("if");  
	        orderColumnElement.addAttribute(new Attribute("test", "sortName != null"));
	        orderColumnElement.addElement(new TextElement("order by ${sortName}"));
	        
	        XmlElement orderSortElement = new XmlElement("if");  
	        orderSortElement.addAttribute(new Attribute("test", "sortOrder != null"));
	        orderSortElement.addElement(new TextElement("${sortOrder}"));
	        orderColumnElement.addElement(orderSortElement);
	        answer.addElement(orderColumnElement);
	        parentElement.addElement(answer);	    	
	    }
	    
	   
	  
	   
	  
	    /** 
	     * This plugin is always valid - no properties are required 
	     */  
	    public boolean validate(List<String> warnings) {  
	        return true;  
	    }  
	      
	    public static void generate() {  
	        String config = PaginationPlugin.class.getClassLoader().getResource(  
	                "generatorConfig.xml").getFile();  
	        String[] arg = { "-configfile", config, "-overwrite" };  
	        ShellRunner.main(arg);  
	    }  
	    public static void main(String[] args) {  
	        generate();  
	    }  
}
