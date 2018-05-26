package alan.zjc.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class JdbcUtils {
	private static final String dbConfig="dbconfig.properties";
	private static Properties properties=new Properties();
	
	static{
		try {
			InputStream inputStream=Thread.currentThread().getContextClassLoader().getResourceAsStream(dbConfig);
			properties.load(inputStream);
			Class.forName(properties.getProperty("driverClassName"));			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static Connection getConnection(){
		try {
			return DriverManager.getConnection(properties.getProperty("url"),properties.getProperty("username"),
					properties.getProperty("password"));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
