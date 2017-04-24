package com.cubic.core.config;

/**
 * Created by liang_zhang on 2015/06/01.
 * 定义系统中用到的一些常量
 */
public class Constants {

  // public final static String SSOServerUrl = "sys.config.ssoServerUrl";//sso单点登录url

  public final static String UIMSyncUrlKey = "sys.config.UIMSyncUrl";//uim同步url

  public final static String UIMLatestUpdateTime = "sys.config.UIMLatestUpdateTime";//uim最新同步时间

  public final static String FTPIp = "sys.ftp.ip";//ftp访问ip

  public final static String FTPPort = "sys.ftp.port";//ftp访问端口

  public final static String FTPUser = "sys.ftp.user";//ftp登录用户

  public final static String FTPPwd = "sys.ftp.pwd";//ftp登录密码

  public final static String FTPRootPath = "sys.ftp.rootPath";//ftp根目录

  public final static String FTPUpdateTime = "sys.ftp.fileUploadDate";//ftp同步时间

  public final static String LocalFileUploadTempBase = "sys.upload.tempFolder";//上传文件临时文件路径

  public final static String SYS_WHITE_LIST = "sys.manager.whitelist";//系统管理白名单

  public final static String UIMGetUserRightUrl = "sys.config.getUserRightUrl";//获取用户权限url的数据库key

  public final static String UIMGetUserByCorpAndRightKeyUrl = "sys.config.getUserByCorpAndRightKey";//根据单位ID和权限值获取用户列表

  public final static String UIMGetUserByDeptAndRightKeyUrl = "sys.config.getUserByDeptAndRightKey";//根据部门ID和权限值获取用户列表

  public final static String Bulletin_Bulletin_Audit_RightKey = "Bulletin.jbgl.dbjb.sh";//简报待办审核权限（审核简报）

  public final static String Bulletin_Bulletin_Publish_RightKey = "Bulletin.jbgl.dbjb.fb";//简报待办发布权限（发布简报）

  public final static String Bulletin_Affair_Audit_RightKey = "Bulletin.zwxx.zwxxsh.cx";//政务信息审核查看权限（审核政务信息）

  public final static String UIMUrl = "sys.config.uimUrl";//uim系统地址

  public final static String BulletinWorkflowFilePath = "workflow.bulletin.filePath";//简报工作流物理路径

  public final static String Bulletin_Bulletin_Manager_RightKey = "Bulletin.jbgl.dbjb.gl";//简报管理员权限（管理简报）

}
