package org.learn.dataTable.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages = { "org.learn.dataTable" })
@EnableTransactionManagement
public class HibernateConfig {

	/*
	 * private static final String
	 * DB_URL="jdbc:postgresql://localhost:5432/springdb"; private static final
	 * String DB_DIALECT="org.hibernate.dialect.PostgreSQLDialect"; private static
	 * final String DB_DRIVER="org.postgresql.Driver"; private static final String
	 * DB_USERNAME="postgres"; private static final String DB_PASSWORD="password";
	 */

	@Value("${postgre.db.url}")
	private String db_url;
	@Value("${postgre.db.dialect}")
	private String db_dialect;
	@Value("${postgre.db.driver}")
	private String db_driver;
	@Value("${postgre.db.username}")
	private String db_username;
	@Value("${postgre.db.password}")
	private String db_password;

	@Bean
	public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setUrl(db_url);
		dataSource.setUsername(db_username);
		dataSource.setPassword(db_password);
		dataSource.setDriverClassName(db_driver);
		return dataSource;
	}

	public Properties getProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", db_dialect);
		properties.put("hibernate.show_sql", true);
		properties.put("hibernate.format_sql", true);
		properties.put("hibernate.use_sql_comments", true);
		return properties;
	}

	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionFactoryBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionFactoryBuilder.addProperties(getProperties());
		sessionFactoryBuilder.scanPackages("org.learn.dataTable.dto");
		return sessionFactoryBuilder.buildSessionFactory();
	}

	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		return new HibernateTransactionManager(sessionFactory);
	}
}
