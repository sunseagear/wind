package com.sunseagear.wind.modules.sys.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.sys.entity.User;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: IUserService.java
 * @package com.sunseagear.wind.modules.sys.service
 * @description: 用户 * @date: 2017年7月11日 下午9:21:07
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public interface IUserService extends ICommonService<User> {
    /**
     * 修改密码
     *
     * @param userId
     * @param newPassword
     */
    void changePassword(String userId, String newPassword);

    /**
     * 根据用户名查找用户
     *
     * @param username
     * @return
     */
    public User findByUsername(String username);

    /**
     * 根据Email查找用户
     *
     * @param email
     * @return
     */
    User findByEmail(String email);

    /**
     * 根据Email查找用户
     *
     * @param phone
     * @return
     */
    User findByPhone(String phone);

    /**
     * 检查密码
     *
     * @param userId
     * @param password
     * @return
     */
    Boolean checkPassword(String userId, String password);

}
