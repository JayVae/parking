package com.hu.parking.dao.system;

import java.util.List;
import java.util.Map;

import com.hu.parking.dao.base.BaseMapper;
import com.hu.parking.dao.base.MyBatisRepository;
import com.hu.parking.entity.Role;

@MyBatisRepository
public interface RoleMapper extends BaseMapper<Role> {
   public List<Role> findByAccount(Map<String, Object> params);
}