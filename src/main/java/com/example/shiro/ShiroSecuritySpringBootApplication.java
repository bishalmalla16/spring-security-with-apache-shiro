package com.example.shiro;

import com.example.shiro.filter.MultipleRolesAuthorizationFilter;
import org.apache.shiro.authc.credential.DefaultPasswordService;
import org.apache.shiro.authc.credential.PasswordMatcher;
import org.apache.shiro.authc.credential.Sha256CredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.HashMap;
import java.util.Map;


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

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}

		DataSource dataSource = new DataSource() {
			@Override
			public Connection getConnection() throws SQLException {
				return DriverManager.getConnection("jdbc:mysql://localhost:3306/shiro?useTimezone=true&serverTimezone=UTC", "root", "");
			}

			@Override
			public Connection getConnection(String username, String password) throws SQLException {
				return null;
			}

			@Override
			public <T> T unwrap(Class<T> iface) throws SQLException {
				return null;
			}

			@Override
			public boolean isWrapperFor(Class<?> iface) throws SQLException {
				return false;
			}

			@Override
			public PrintWriter getLogWriter() throws SQLException {
				return null;
			}

			@Override
			public void setLogWriter(PrintWriter out) throws SQLException {

			}

			@Override
			public void setLoginTimeout(int seconds) throws SQLException {

			}

			@Override
			public int getLoginTimeout() throws SQLException {
				return 0;
			}

			@Override
			public java.util.logging.Logger getParentLogger() throws SQLFeatureNotSupportedException {
				return null;
			}
		};

//		CustomBoneCPDataSource dataSource = new CustomBoneCPDataSource();

		realm.setDataSource(dataSource);
		return realm;
	}

	@Bean
	public CacheManager getCacheManager(){
		return new MemoryConstrainedCacheManager();
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

		Map<String, String> pathDefinitions = new HashMap<>();
		pathDefinitions.put("/update", "authc, roles[Administration]");
		pathDefinitions.put("/delete", "authc, roles[Administration]");
		pathDefinitions.put("/users", "authc, roles[Administration]");
		chainDefinition.addPathDefinitions(pathDefinitions);

		return chainDefinition;
	}

}
