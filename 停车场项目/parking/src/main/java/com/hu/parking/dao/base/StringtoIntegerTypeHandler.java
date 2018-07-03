package com.hu.parking.dao.base;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 *mybatis类型转换 String<---->Integer
 * @author leeyuan
 *
 */
public class StringtoIntegerTypeHandler implements TypeHandler<Object> {
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

	public void setParameter(PreparedStatement ps, int i, Object parameter,
			JdbcType jdbcType) throws SQLException {
		if (parameter == null)
			ps.setNull(i, Types.INTEGER);
		else {
			ps.setInt(i, Integer.valueOf(parameter.toString()));
		}
	}

	
}
