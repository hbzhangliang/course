<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_sys.jsp" %>
</head>
<body>
<div class="warp clearfix">
  <div class="warp_in clearfix">
    <!--top start-->
    <c:import url="../commons/top.jsp"/>
    <!--top start-->
    <div class="main">
      <c:import url="../commons/menu.jsp"/>
      <div class="right clearfix">
        <div class="right_ineer clearfix">
          <!--tit start-->
          <div class="tit_1">
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="sys.title.aclMng"/> </span>
            </b>
          </div>
          <!--tit end-->
          <div class="acl_main">
            <div class="acl_left l">
              <div class="acl_block">
                <span>权限信息</span>

                <div class="oa h270">
                  <ul id="aclTree"></ul>
                </div>
              </div>
              <div class="acl_block mt_5">
                <span>角色信息</span>

                <div class="oa h270">
                  <ul id="roleTree"></ul>
                </div>
              </div>
            </div>
            <div style="padding: 10px;">
              <div class="acl_right acl_block l h100">
                权限添加<br/>
                <label for="aclName">*name:</label><input type="text" id="aclName"/>
                <label for="aclKey">*key:</label><input type="text" id="aclKey"/>
                <button type="button" onclick="addAcl();">添加</button>
                <br/><br/>
                角色添加<br/>
                <label for="type">type:</label><select id="type">
                <option value="group">添加角色分组</option>
                <option value="role">添加角色</option>
              </select>
                <label for="name">*name:</label><input type="text" id="name"/>
                <label for="code">*code:</label><input type="text" id="code"/>
                <label for="seq">seq:</label><input type="text" id="seq"/>
                <button type="button" onclick="addRoleObject();">添加</button>
                <br/>
              </div>
              <div class="mt_10 acl_right acl_block l h463">
                <div class="acl_tab_label">
                  <span class="acl_active">配置角色</span><span>分配权限</span>
                </div>
                <div class="acl_tab acl_block ">
                  <div class="acl_cfg acl_block">
                    <label>选择角色</label>

                    <div class="oa h385 mt_5">
                      <ul id="roleTreeWithChk"></ul>
                    </div>
                  </div>
                  <div class="acl_cfg acl_block">
                    <label>权限信息</label>

                    <div class="oa h385 mt_5">
                      <ul id="aclTreeWithChk"></ul>
                    </div>
                  </div>
                  <div class="acl_cfg acl_block">
                    <label>人员列表</label>

                    <div class="oa h385 mt_5">
                      <ul id="userTreeWithChk"></ul>
                    </div>
                  </div>
                </div>
                <div class="acl_tab acl_block r h440 mt_5" style="display: none;">
                  456
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <c:import url="../commons/footer.jsp"/>
    </div>
  </div>
</div>
<script>
  /**
   * 自动绑定切换tab
   */
  $('.acl_right span').bind('click', function () {
    if ($('.h463').find('span').index($(this)) == 0) {
      $('.acl_right').find('span').removeClass('acl_active');
      $(this).addClass('acl_active');
      $('.acl_tab:first').show();
      $('.acl_tab:last').hide();
    } else if ($('.h463').find('span').index($(this)) == 1) {
      $('.acl_right').find('span').removeClass('acl_active');
      $(this).addClass('acl_active');
      $('.acl_tab:first').hide();
      $('.acl_tab:last').show();
    }
  });

  /**
   * 加载权限树
   */
  loadAclTree = function () {
    $('#aclTree').tree({
      url: 'loadAclTree.htm',
      checkbox: false,
      onBeforeExpand: function () {
        $('#aclTree').tree('options').url = "getAclChildren.htm";
      }
    });
    $('#aclTreeWithChk').tree({
      url: 'loadAclTree.htm',
      checkbox: true,
      cascadeCheck: false,
      onClick: function (node) {
        $(this).tree('toggle', node.target);
      },
      onBeforeExpand: function () {
        $('#aclTreeWithChk').tree('options').url = "getAclChildren.htm";
      }
    });
  }

  /**
   * 加载角色树
   */
  loadRoleTree = function () {
    $('#roleTree').tree({
      url: 'loadRoleTree.htm',
      checkbox: false,
      onBeforeExpand: function () {
        $('#roleTree').tree('options').url = "getRoleChildren.htm";
      }
    });
    $('#roleTreeWithChk').tree({
      url: 'loadRoleTree.htm',
      checkbox: false,
      onClick: function (roleNode) {
        if (!roleNode.isGroup) {
          $('#aclTreeWithChk').tree({
            url: 'loadAclTree.htm?roleId=' + roleNode.id,
            onClick: function (rNode) {
              $(this).tree('toggle', rNode.target);
            },
            onCheck: function (rNode) {
              if (!rNode.checked)
                saveRoleAcl(rNode.id, 'a');
              else
                saveRoleAcl(rNode.id, 'r');
            },
            onBeforeExpand: function () {
              $('#aclTreeWithChk').tree('options').url = "getAclChildren.htm?roleId=" + roleNode.id;
            }
          });
          $('#userTreeWithChk').tree({
            url: base + '/sys/user/loadUserTree.htm',
            onClick: function (uNode) {
              $(this).tree('toggle', uNode.target);
            },
            onCheck: function (uNode) {
              if (uNode.isDepart)
                msg('<fmt:message key="sys.msg.chooseUserToGrantRole"/>');
              else {
                if (!uNode.checked)
                  saveRoleUser(uNode.id, 'a');
                else
                  saveRoleUser(uNode.id, 'r');
              }
            },
            onBeforeExpand: function () {
              $('#userTreeWithChk').tree('options').url = base + "/sys/user/getUserChildren.htm?roleId=" + roleNode.id;
            }
          });
        }
      },
      onBeforeExpand: function () {
        $('#roleTreeWithChk').tree('options').url = "getRoleChildren.htm";
      }
    });
  }

  /**
   * 加载用户树
   */
  loadUserTree = function () {
    $('#userTreeWithChk').tree({
      url: base + '/sys/user/loadUserTree.htm',
      checkbox: true,
      onlyLeafCheck: true,
      onBeforeExpand: function () {
        $('#userTreeWithChk').tree('options').url = base + "/sys/user/getUserChildren.htm";
      }
    });
  }

  loadAclTree();
  loadRoleTree();
  loadUserTree();

  /**
   * 新增权限
   */
  addAcl = function () {
    if ($('#aclKey').val() != null && $('#aclKey').val() != '' && $('#aclName').val() != null && $('#aclName').val() != '')
      $.post('addAcl.htm', {
        key: $('#aclKey').val(),
        name: $('#aclName').val()
      }, function (data) {
        if (data.success)
          loadAclTree();
        else
          msg(data.message);
      }, 'json');
    else
      msg('<fmt:message key="sys.msg.inputRequiredField"/> ');
  }

  /**
   * 新增角色对象
   */
  addRoleObject = function () {
    if ($('#code').val() != null && $('#code').val() != '' && $('#name').val() != null && $('#name').val() != '')
      if ($('#type').val() == 'role') {
        if ($('#roleTree').tree('getSelected') == null)
          msg('<fmt:message key="sys.msg.chooseOneRoleGroup"/>');
        else
          $.post('addRoleObject.htm', {
            type: $('#type').val(),
            code: $('#code').val(),
            name: $('#name').val(),
            seq: $('#seq').val(),
            groupId: $('#roleTree').tree('getSelected').id
          }, function (data) {
            if (data.success)
              loadRoleTree();
            else
              msg(data.message);
          }, 'json');
      }
      else
        $.post('addRoleObject.htm', {
          type: $('#type').val(),
          code: $('#code').val(),
          name: $('#name').val(),
          seq: $('#seq').val()
        }, function (data) {
          if (data.success)
            loadRoleTree();
          else
            msg(data.message);
        }, 'json');
    else
      msg('<fmt:message key="sys.msg.inputRequiredField"/> ');
  }

  /**
   * 动态保存角色-权限
   * @param aclKey 权限KEY
   * @param op 操作（a:加入；r:移除）
   */
  saveRoleAcl = function (aclKey, op) {
    if ($('#roleTreeWithChk').tree('getSelected') == null)
      msg('<fmt:message key="sys.msg.chooseOneRole"/>');
    else {
      $.post('saveRoleAcl.htm', {
        roleId: $('#roleTreeWithChk').tree('getSelected').id,
        aclKey: aclKey,
        op: op
      }, function (data) {
        if (data.success) {
          msg('<fmt:message key="sys.msg.saved"/> ');
        }
        else
          msg(data.message);
      }, 'json');
    }
  }


  /**
   * 动态保存用户-角色
   * @param userId 用户ID
   * @param op 操作（a:加入；r:移除）
   */
  saveRoleUser = function (userId, op) {
    if ($('#roleTreeWithChk').tree('getSelected') == null)
      msg('<fmt:message key="sys.msg.chooseOneRole"/>');
    else {
      $.post('saveRoleUser.htm', {
        roleId: $('#roleTreeWithChk').tree('getSelected').id,
        userId: userId,
        op: op
      }, function (data) {
        if (data.success) {
          msg('<fmt:message key="sys.msg.saved"/> ');
        }
        else
          msg(data.message);
      }, 'json');
    }
  }
</script>
</body>
</html>
