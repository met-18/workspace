package com.springboot.demo3.mapper;


import com.springboot.demo3.domain.SysPermission;
import com.springboot.demo3.domain.SysRole;
import com.springboot.demo3.domain.SysUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @description
 * @author: hxx
 * @create: 2021-05-18 11:37
 **/
@Mapper
public interface UserMapper {
    public SysUser queryUserById(Integer id);
    public SysUser queryUserByLoginName(String loginName);
    public List<SysUser> queryUserList(SysUser user);
    public List<String> queryRoleListByUserId(Long userId);
    public List<String> queryPermissionListByUserId(Long userId);
    public int insertUser(SysUser user);
    public int updateUser(SysUser user);
    public int deleteUserById(Integer id);
    public int queryPageCount();
}
