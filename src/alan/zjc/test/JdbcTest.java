package alan.zjc.test;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import alan.zjc.utils.JdbcUtils;

public class JdbcTest {
	
	@Test
	public void testDBConnection() throws SQLException{
		Connection conn=JdbcUtils.getConnection();
		System.out.println(conn.getCatalog());
	}

}
