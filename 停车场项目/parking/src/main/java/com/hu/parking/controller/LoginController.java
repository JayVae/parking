package com.hu.parking.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hu.parking.service.system.impl.ValidateCode;


@Controller
public class LoginController {
	
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String dologin(@RequestParam("username") String username,
			@RequestParam("password") String password, 
			@RequestParam("validateCode") String validateCode, String rememberme,
			Model model,HttpSession session, HttpServletRequest request) {
		Subject user = SecurityUtils.getSubject();
		  String code = (String) session.getAttribute("captcha");
		  if(StringUtils.isNotBlank(code)){
			  code=code.toLowerCase().toString();
		  }
		  if(StringUtils.isNotBlank(validateCode)){
			  validateCode=validateCode.toLowerCase().toString();
		  }
		if (StringUtils.isBlank(validateCode) ||StringUtils.isBlank(code)||!code.equals(validateCode)) {
			model.addAttribute("message", "验证码错误!");
			return "/login";
      }
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);
		if(StringUtils.isNotBlank(rememberme)){
			token.setRememberMe(true);
		}else{
			token.setRememberMe(false);
		}
		
		try {
			//会调用 shiroDbRealm 的认证方法 ...service.system.ShiroDbRealm.doGetAuthenticationInfo(AuthenticationToken)
			user.login(token);
		} catch (UnknownAccountException uae) {
			model.addAttribute("message", "账号或密码错误!");
			return "/login";
		} catch (IncorrectCredentialsException ice) {
			model.addAttribute("message", "账号或密码错误!");
			return "/login";
		} catch (LockedAccountException lae) {
			model.addAttribute("message", "账号被锁定!");
			return "/login";
		} catch (Exception e) {
			model.addAttribute("message", "系统错误,请联系管理员.");
			return "/login";
		}
		
		return "redirect:/home";
	}
	
	@RequestMapping(value="/VerifyCode")
	public void validateCode(HttpServletResponse response, HttpSession session){
		 try {
		// 设置响应的类型格式为图片格式  
        response.setContentType("image/jpeg");  
        //禁止图像缓存。  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);                       
        ValidateCode vCode = new ValidateCode(120,40,4,10);  
        session.setAttribute("captcha", vCode.getCode());        
		vCode.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	@RequestMapping(value="/unauth")
	public String unauth(){
		if(SecurityUtils.getSubject().isAuthenticated()==false){
			return "redirect:/login";
		}
			return "/unauth";
	}
	
	/**
	 * 退出
	 * @param request
	 */
	@RequestMapping(value="/logout")
    public void logout(HttpServletRequest request){
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {           
            subject.logout();
        }
        //request.getSession().invalidate();
    }
}
