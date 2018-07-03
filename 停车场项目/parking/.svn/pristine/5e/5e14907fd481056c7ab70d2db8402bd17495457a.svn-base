package com.hu.parking.service.system.impl;

import org.apache.shiro.authc.AuthenticationInfo;  
import org.apache.shiro.authc.AuthenticationToken;  
import org.apache.shiro.authc.UsernamePasswordToken;  
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;  
import org.springframework.stereotype.Component;

import com.hu.parking.common.Encryption;
  
/** 
 * 自定义 密码验证类 
 *  
 * 
 */  
@Component
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {  
     	@Override  
        public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {  
            UsernamePasswordToken token = (UsernamePasswordToken) authcToken;  
            Encryption encryption = new Encryption();
            String salt = info.getCredentials().toString().substring(0, 16);
            String password = new String((char[])token.getCredentials()); //得到密码
            Object tokenCredentials = encryption.encryptionPwd(password,salt);
            Object accountCredentials = getCredentials(info);  
            //将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false  
            return equals(tokenCredentials, accountCredentials);  
        }        
}