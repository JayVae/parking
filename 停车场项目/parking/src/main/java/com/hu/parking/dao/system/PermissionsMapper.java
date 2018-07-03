package com.hu.parking.dao.system;

import java.util.List;
import java.util.Map;

import com.hu.parking.dao.base.BaseMapper;
import com.hu.parking.dao.base.MyBatisRepository;
import com.hu.parking.entity.Permissions;

@MyBatisRepository
public interface PermissionsMapper extends BaseMapper<Permissions> {
	public List<Permissions> findByRole(Map<String, Object> params);
}