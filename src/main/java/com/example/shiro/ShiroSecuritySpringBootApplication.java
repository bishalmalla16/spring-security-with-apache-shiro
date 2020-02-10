package com.example.shiro;

import com.example.shiro.filter.MultipleRolesAuthorizationFilter;
import org.apache.shiro.authc.credential.DefaultPasswordService;
import org.apache.shiro.authc.credential.PasswordMatcher;
import org.apache.shiro.authc.credential.Sha256CredentialsMatcher;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
@SpringBootApplication
public class ShiroSecuritySpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShiroSecuritySpringBootApplication.class, args);
	}

	@Bean
	public Realm getRealm(){
		JdbcRealm realm = new JdbcRealm();
		realm.setAuthenticationQuery("select password from user where username=?");
		realm.setUserRolesQuery("select role_name from role where id IN (select roles_id from user_roles where users_id = (select id from user where username = ?))");
		realm.setPermissionsQuery("select permission from role_permission where role_id = (select id from role where role_name = ?)");
		realm.setPermissionsLookupEnabled(true);

		Sha256CredentialsMatcher credentialsMatcher = new Sha256CredentialsMatcher();
		realm.setCredentialsMatcher(credentialsMatcher);

		DefaultPasswordService passwordService = new DefaultPasswordService();
		PasswordMatcher passwordMatcher = new PasswordMatcher();
		passwordMatcher.setPasswordService(passwordService);

		CustomBoneCPDataSource dataSource = new CustomBoneCPDataSource();
		realm.setDataSource(dataSource);
		return realm;
	}

	@Bean(name = "multipleRoles")
	public MultipleRolesAuthorizationFilter getFilter(){
		return new MultipleRolesAuthorizationFilter();
	}

	@Bean
	public ShiroFilterChainDefinition shiroFilterChainDefinition(){
		DefaultShiroFilterChainDefinition chainDefinition = new DefaultShiroFilterChainDefinition();
		chainDefinition.addPathDefinition("/login", "authc");
		chainDefinition.addPathDefinition("/logout", "logout");
		chainDefinition.addPathDefinition("/account-info", "authc, multipleRoles[Administration, User]");
		chainDefinition.addPathDefinition("/update", "authc, roles[Administration]");
		return chainDefinition;
	}

}
