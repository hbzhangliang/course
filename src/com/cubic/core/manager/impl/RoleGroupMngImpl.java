package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.RoleGroup;
import com.cubic.core.manager.RoleGroupMng;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("roleGroupMng")
@Transactional
public class RoleGroupMngImpl extends BaseMngImpl<RoleGroup> implements RoleGroupMng {

  private final static Logger logger = LogManager.getLogger();
}
