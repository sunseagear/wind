package com.sunseagear.wind.config;

import com.sunseagear.wind.config.autoconfigure.ShiroConfigProperties;
import com.sunseagear.wind.security.shiro.factory.StatelessSubjectFactory;
import com.sunseagear.wind.security.shiro.filter.authc.Oauth2Filter;
import com.sunseagear.wind.security.shiro.realm.Oauth2Realm;
import com.sunseagear.wind.security.shiro.realm.UserRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.mgt.DefaultSubjectDAO;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.mgt.DefaultSessionManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.mgt.DefaultWebSubjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;

import javax.servlet.Filter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.spring.config
 * @title:
 * @description: shiro配置类 * @date: 2018/3/6 14:28
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Configuration
@EnableConfigurationProperties({ShiroConfigProperties.class})
public class ShiroConfig {

    @Autowired
    private ShiroConfigProperties shiroConfigProperties;

    @Bean
    public HashedCredentialsMatcher credentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName(shiroConfigProperties.getCredentialsHashAlgorithmName());
        hashedCredentialsMatcher.setHashIterations(shiroConfigProperties.getCredentialsHashIterations());
        hashedCredentialsMatcher.setStoredCredentialsHexEncoded(shiroConfigProperties.getCredentialsStoredCredentialsHexEncoded());
        return hashedCredentialsMatcher;
    }

    @Bean
    public UserRealm userRealm(HashedCredentialsMatcher credentialsMatcher) {
        UserRealm userRealm = new UserRealm();
        userRealm.setCredentialsMatcher(credentialsMatcher);
        userRealm.setAuthenticationCachingEnabled(Boolean.FALSE);
        userRealm.setAuthorizationCachingEnabled(Boolean.FALSE);
        return userRealm;
    }

    @Bean
    public Oauth2Realm oauth2Realm() {
        Oauth2Realm oauth2Realm = new Oauth2Realm();
        oauth2Realm.setAuthenticationCachingEnabled(Boolean.FALSE);
        oauth2Realm.setAuthorizationCachingEnabled(Boolean.FALSE);
        oauth2Realm.setCachingEnabled(Boolean.FALSE);
        return oauth2Realm;
    }

    @Bean
    public DefaultSessionManager sessionManager() {
        DefaultSessionManager sessionManager = new DefaultSessionManager();
        sessionManager.setSessionValidationSchedulerEnabled(Boolean.FALSE);
        return sessionManager;
    }


    @Bean
    public DefaultWebSubjectFactory subjectFactory() {
        DefaultWebSubjectFactory subjectFactory = new StatelessSubjectFactory();
        return subjectFactory;
    }

    @Bean
    public DefaultWebSecurityManager securityManager(DefaultSessionManager sessionManager, DefaultWebSubjectFactory subjectFactory,
                                                     Oauth2Realm oauth2Realm, UserRealm userRealm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setSessionManager(sessionManager);
        securityManager.setSubjectFactory(subjectFactory);
        /*
         * 禁用使用Sessions 作为存储策略的实现，但它没有完全地禁用Sessions
         * 所以需要配合context.setSessionCreationEnabled(false);
         */
        //Add.2.3
        ((DefaultSessionStorageEvaluator) ((DefaultSubjectDAO) securityManager.getSubjectDAO()).getSessionStorageEvaluator()).setSessionStorageEnabled(false);

        List<Realm> realms = new ArrayList<Realm>();
        realms.add(oauth2Realm);
        realms.add(userRealm);
        securityManager.setRealms(realms);
        return securityManager;
    }

    /**
     * 验证过滤器
     *
     * @return
     */
    private Oauth2Filter oauth2Filter() {
        Oauth2Filter oauth2Filter = new Oauth2Filter();
        oauth2Filter.setJwtTokenSecret(shiroConfigProperties.getJwtTokenSecret());
        return oauth2Filter;
    }


    @Bean
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        Map<String, Filter> filters = shiroFilterFactoryBean.getFilters();
        filters.put("authc", oauth2Filter());
        String[] chainDefinitionsArray = shiroConfigProperties.getFilterChainDefinitions().split(";");
        for (String filter : chainDefinitionsArray) {
            filter = filter.trim();
            String[] o = filter.split("=");
            shiroFilterFactoryBean.getFilterChainDefinitionMap().put(o[0].trim(), o[1].trim());
        }
        return shiroFilterFactoryBean;
    }

    /**
     * 开启shiro aop注解支持.
     * 使用代理方式;所以需要开启代码支持;
     *
     * @param securityManager
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    @Bean
    public FilterRegistrationBean delegatingFilterProxy() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        DelegatingFilterProxy proxy = new DelegatingFilterProxy();
        filterRegistrationBean.addUrlPatterns("/*");
        proxy.setTargetFilterLifecycle(true);
        proxy.setTargetBeanName("shiroFilter");
        filterRegistrationBean.setFilter(proxy);
        return filterRegistrationBean;
    }
}
