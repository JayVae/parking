package com.hu.parking.dao.base;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.RowId;
import java.sql.RowIdLifetime;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DecimalFormat;
import java.util.UUID;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 *mybatis类型转换 String-->UUID
 * @author leeyuan
 *
 */
public class UUIDTypeHandler implements TypeHandler<String> {
	public String getResult(ResultSet rs, String columnName)
			throws SQLException {
		String columnValue = rs.getString(columnName);
		return columnValue;
	}

	public String getResult(ResultSet rs, int columnIndex)
			throws SQLException {
		String columnValue = rs.getString(columnIndex);
		return columnValue;
	}

	public String getResult(CallableStatement cs, int columnIndex)
			throws SQLException {
		String columnValue = cs.getString(columnIndex);
		return columnValue;
	}

	public void setParameter(PreparedStatement ps, int i, String parameter,
			JdbcType jdbcType) throws SQLException {
		if (parameter == null)
			ps.setNull(i, Types.OTHER);
		else {
			ps.setObject(i, UUID.fromString(parameter));
		}
	}

	
}
