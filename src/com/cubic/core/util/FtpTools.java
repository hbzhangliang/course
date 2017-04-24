package com.cubic.core.util;

import com.cubic.core.config.Constants;
import com.cubic.core.entity.Attachment;
import com.cubic.core.manager.AttachmentMng;
import com.cubic.core.manager.SysConfigMng;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.*;
import java.net.SocketException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by liang_zhang on 2015/06/08.
 */

/**
 * ftp上传，下载
 */
@Service("ftpTools")
public class FtpTools {

  private final static Logger logger = LogManager.getLogger();

  private ThreadLocal<FTPClient> ftpClientThreadLocal = new ThreadLocal<FTPClient>();

  private String host;
  private int port;
  private String username;
  private String password;

  private boolean binaryTransfer = true;
  private boolean passiveMode = true;
  private String encoding = "UTF-8";
  private int clientTimeout = 1000 * 30;

  public String getHost() {
    return host;
  }

  public void setHost(String host) {
    this.host = host;
  }

  public int getPort() {
    return port;
  }

  public void setPort(int port) {
    this.port = port;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public boolean isBinaryTransfer() {
    return binaryTransfer;
  }

  public void setBinaryTransfer(boolean binaryTransfer) {
    this.binaryTransfer = binaryTransfer;
  }

  public boolean isPassiveMode() {
    return passiveMode;
  }

  public void setPassiveMode(boolean passiveMode) {
    this.passiveMode = passiveMode;
  }

  public String getEncoding() {
    return encoding;
  }

  public void setEncoding(String encoding) {
    this.encoding = encoding;
  }

  public int getClientTimeout() {
    return clientTimeout;
  }

  public void setClientTimeout(int clientTimeout) {
    this.clientTimeout = clientTimeout;
  }

  //---------------------------------------------------------------------
  // private method
  //---------------------------------------------------------------------

  /**
   * 返回一个FTPClient实例
   *
   * @throws FTPClientException
   */
  private FTPClient getFTPClient() throws FTPClientException {
    if (ftpClientThreadLocal.get() != null && ftpClientThreadLocal.get().isConnected()) {
      return ftpClientThreadLocal.get();
    } else {
      FTPClient ftpClient = new FTPClient(); //构造一个FtpClient实例
      ftpClient.setControlEncoding(encoding); //设置字符集

      connect(ftpClient); //连接到ftp服务器

      //设置为passive模式
      if (passiveMode) {
        ftpClient.enterLocalPassiveMode();
      }
      setFileType(ftpClient); //设置文件传输类型

      try {
        ftpClient.setSoTimeout(clientTimeout);
      } catch (SocketException e) {
        throw new FTPClientException("Set timeout error.", e);
      }
      ftpClientThreadLocal.set(ftpClient);
      return ftpClient;
    }
  }

  /**
   * 设置文件传输类型
   *
   * @throws FTPClientException
   * @throws IOException
   */
  private void setFileType(FTPClient ftpClient) throws FTPClientException {
    try {
      if (binaryTransfer) {
        ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
      } else {
        ftpClient.setFileType(FTPClient.ASCII_FILE_TYPE);
      }
    } catch (IOException e) {
      throw new FTPClientException("Could not to set file type.", e);
    }
  }

  /**
   * 连接到ftp服务器
   *
   * @param ftpClient
   * @return 连接成功返回true，否则返回false
   * @throws FTPClientException
   */
  private boolean connect(FTPClient ftpClient) throws FTPClientException {
    try {
      ftpClient.connect(host, port);

      // 连接后检测返回码来校验连接是否成功
      int reply = ftpClient.getReplyCode();

      if (FTPReply.isPositiveCompletion(reply)) {
        //登陆到ftp服务器
        if (ftpClient.login(username, password)) {
          setFileType(ftpClient);
          return true;
        }
      } else {
        ftpClient.disconnect();
        throw new FTPClientException("FTP server refused connection.");
      }
    } catch (IOException e) {
      if (ftpClient.isConnected()) {
        try {
          ftpClient.disconnect(); //断开连接
        } catch (IOException e1) {
          throw new FTPClientException("Could not disconnect from server.", e1);
        }

      }
      throw new FTPClientException("Could not connect to server.", e);
    }
    return false;
  }


  //---------------------------------------------------------------------
  // public method
  //---------------------------------------------------------------------

  /**
   * 断开ftp连接
   *
   * @throws FTPClientException
   */
  public void disconnect() throws FTPClientException {
    try {
      FTPClient ftpClient = getFTPClient();
      ftpClient.logout();
      if (ftpClient.isConnected()) {
        ftpClient.disconnect();
        ftpClient = null;
      }
    } catch (IOException e) {
      throw new FTPClientException("Could not disconnect from server.", e);
    }
  }

  public boolean mkdir(String pathname) throws FTPClientException {
    return mkdir(pathname, null);
  }

  /**
   * 在ftp服务器端创建目录（不支持一次创建多级目录）
   * <p/>
   * 该方法执行完后将自动关闭当前连接
   *
   * @param pathname
   * @return
   * @throws FTPClientException
   */
  public boolean mkdir(String pathname, String workingDirectory) throws FTPClientException {
    return mkdir(pathname, workingDirectory, true);
  }

  /**
   * 在ftp服务器端创建目录（不支持一次创建多级目录）
   *
   * @param pathname
   * @param autoClose 是否自动关闭当前连接
   * @return
   * @throws FTPClientException
   */
  public boolean mkdir(String pathname, String workingDirectory, boolean autoClose) throws FTPClientException {
    try {
      getFTPClient().changeWorkingDirectory(workingDirectory);
      return getFTPClient().makeDirectory(pathname);
    } catch (IOException e) {
      throw new FTPClientException("Could not mkdir.", e);
    } finally {
      if (autoClose) {
        disconnect(); //断开连接
      }
    }
  }

  /**
   * 上传一个本地文件到远程指定文件
   *
   * @param remoteAbsoluteFile 远程文件名(包括完整路径)
   * @param localAbsoluteFile  本地文件名(包括完整路径)
   * @return 成功时，返回true，失败返回false
   * @throws FTPClientException
   */
  public boolean put(String remoteAbsoluteFile, String localAbsoluteFile) throws FTPClientException {
    return put(remoteAbsoluteFile, localAbsoluteFile, true);
  }

  /**
   * 上传一个本地文件到远程指定文件
   *
   * @param remoteAbsoluteFile 远程文件名(包括完整路径)
   * @param localAbsoluteFile  本地文件名(包括完整路径)
   * @param autoClose          是否自动关闭当前连接
   * @return 成功时，返回true，失败返回false
   * @throws FTPClientException
   */
  public boolean put(String remoteAbsoluteFile, String localAbsoluteFile, boolean autoClose) throws FTPClientException {
    InputStream input = null;
    try {
      // 处理传输
      input = new FileInputStream(localAbsoluteFile);
      getFTPClient().storeFile(remoteAbsoluteFile, input);
      logger.debug("put " + localAbsoluteFile);
      return true;
    } catch (FileNotFoundException e) {
      throw new FTPClientException("local file not found.", e);
    } catch (IOException e) {
      throw new FTPClientException("Could not put file to server.", e);
    } finally {
      try {
        if (input != null) {
          input.close();
        }
      } catch (Exception e) {
        throw new FTPClientException("Couldn't close FileInputStream.", e);
      }
      if (autoClose) {
        disconnect(); //断开连接
      }
    }
  }

  /**
   * 下载一个远程文件到本地的指定文件
   *
   * @param remoteAbsoluteFile 远程文件名(包括完整路径)
   * @param localAbsoluteFile  本地文件名(包括完整路径)
   * @return 成功时，返回true，失败返回false
   * @throws FTPClientException
   */
  public boolean get(String remoteAbsoluteFile, String localAbsoluteFile) throws FTPClientException {
    return get(remoteAbsoluteFile, localAbsoluteFile, true);
  }

  /**
   * 下载一个远程文件到本地的指定文件
   *
   * @param remoteAbsoluteFile 远程文件名(包括完整路径)
   * @param localAbsoluteFile  本地文件名(包括完整路径)
   * @param autoClose          是否自动关闭当前连接
   * @return 成功时，返回true，失败返回false
   * @throws FTPClientException
   */
  public boolean get(String remoteAbsoluteFile, String localAbsoluteFile, boolean autoClose) throws FTPClientException {
    OutputStream output = null;
    try {
      output = new FileOutputStream(localAbsoluteFile);
      return get(remoteAbsoluteFile, output, autoClose);
    } catch (FileNotFoundException e) {
      throw new FTPClientException("local file not found.", e);
    } finally {
      try {
        if (output != null) {
          output.close();
        }
      } catch (IOException e) {
        throw new FTPClientException("Couldn't close FileOutputStream.", e);
      }
    }
  }

  /**
   * 下载一个远程文件到指定的流 处理完后记得关闭流
   *
   * @param remoteAbsoluteFile
   * @param output
   * @return
   * @throws FTPClientException
   */
  public boolean get(String remoteAbsoluteFile, OutputStream output) throws FTPClientException {
    return get(remoteAbsoluteFile, output, true);
  }

  /**
   * 下载一个远程文件到指定的流 处理完后记得关闭流
   *
   * @param remoteAbsoluteFile
   * @param output
   * @return
   * @throws FTPClientException
   */
  public boolean get(String remoteAbsoluteFile, OutputStream output, boolean autoClose) throws FTPClientException {
    this.host = sysConfigMng.getCacheValue("sys.ftp.ip");
    this.port = Integer.parseInt(sysConfigMng.getCacheValue("sys.ftp.port"));
    this.username = sysConfigMng.getCacheValue("sys.ftp.user");
    this.password = sysConfigMng.getCacheValue("sys.ftp.pwd");
    try {
      FTPClient ftpClient = getFTPClient();
      // 处理传输
      return ftpClient.retrieveFile(remoteAbsoluteFile, output);
    } catch (IOException e) {
      throw new FTPClientException("Couldn't get file from server.", e);
    } finally {
      if (autoClose) {
        disconnect(); //关闭链接
      }
    }
  }

  /**
   * 从ftp服务器上删除一个文件
   * 该方法将自动关闭当前连接
   *
   * @param delFile
   * @return
   * @throws FTPClientException
   */
  public boolean delete(String delFile) throws FTPClientException {
    return delete(delFile, true);
  }

  /**
   * 从ftp服务器上删除一个文件
   *
   * @param delFile
   * @param autoClose 是否自动关闭当前连接
   * @return
   * @throws FTPClientException
   */
  public boolean delete(String delFile, boolean autoClose) throws FTPClientException {
    try {
      getFTPClient().deleteFile(delFile);
      return true;
    } catch (IOException e) {
      throw new FTPClientException("Couldn't delete file from server.", e);
    } finally {
      if (autoClose) {
        disconnect(); //关闭链接
      }
    }
  }

  /**
   * 批量删除
   * 该方法将自动关闭当前连接
   *
   * @param delFiles
   * @return
   * @throws FTPClientException
   */
  public boolean delete(String[] delFiles) throws FTPClientException {
    return delete(delFiles, true);
  }

  /**
   * 批量删除
   *
   * @param delFiles
   * @param autoClose 是否自动关闭当前连接
   * @return
   * @throws FTPClientException
   */
  public boolean delete(String[] delFiles, boolean autoClose) throws FTPClientException {
    try {
      FTPClient ftpClient = getFTPClient();
      for (String s : delFiles) {
        ftpClient.deleteFile(s);
      }
      return true;
    } catch (IOException e) {
      throw new FTPClientException("Couldn't delete file from server.", e);
    } finally {
      if (autoClose) {
        disconnect(); //关闭链接
      }
    }
  }

  /**
   * 列出远程默认目录下所有的文件
   *
   * @return 远程默认目录下所有文件名的列表，目录不存在或者目录下没有文件时返回0长度的数组
   * @throws FTPClientException
   */
  public String[] listNames() throws FTPClientException {
    return listNames(null, true);
  }

  public String[] listNames(boolean autoClose) throws FTPClientException {
    return listNames(null, autoClose);
  }

  /**
   * 列出远程目录下所有的文件
   *
   * @param remotePath 远程目录名
   * @param autoClose  是否自动关闭当前连接
   * @return 远程目录下所有文件名的列表，目录不存在或者目录下没有文件时返回0长度的数组
   * @throws FTPClientException
   */
  public String[] listNames(String remotePath, boolean autoClose) throws FTPClientException {
    try {
      String[] listNames = getFTPClient().listNames(remotePath);
      return listNames;
    } catch (IOException e) {
      throw new FTPClientException("列出远程目录下所有的文件时出现异常", e);
    } finally {
      if (autoClose) {
        disconnect(); //关闭链接
      }
    }
  }

  private boolean createFolder(String remote) throws IOException {
    FTPClient ftp = null;
    try {
      ftp = getFTPClient();
    } catch (FTPClientException e) {
      e.printStackTrace();
    }
    boolean success = true;
    String directory = remote.substring(0, remote.lastIndexOf("/") + 1);
    // 如果远程目录不存在，则递归创建远程服务器目录
    if (!directory.equalsIgnoreCase("/")
        && !ftp.changeWorkingDirectory(directory)) {
      int start = 0;
      int end = 0;
      if (directory.startsWith("/")) {
        start = 1;
      } else {
        start = 0;
      }
      end = directory.indexOf("/", start);
      while (true) {
        String subDirectory = new String(remote.substring(start, end));
        if (!ftp.changeWorkingDirectory(subDirectory)) {
          if (ftp.makeDirectory(subDirectory)) {
            ftp.changeWorkingDirectory(subDirectory);
          } else {
            System.out.println("创建目录失败");
            success = false;
            return success;
          }
        }
        start = end + 1;
        end = directory.indexOf("/", start);
        // 检查所有目录是否创建完毕
        if (end <= start) {
          break;
        }
      }
    }
    return success;
  }

  public class FTPClientException extends Exception {
    public FTPClientException(String message, Throwable cause) {
      super(message, cause);
    }

    public FTPClientException(String message) {
      super(message);
    }
  }

  public void startUploadToFTP() throws Exception {
    this.host = sysConfigMng.getCacheValue("sys.ftp.ip");
    this.username = sysConfigMng.getCacheValue("sys.ftp.user");
    this.password = sysConfigMng.getCacheValue("sys.ftp.pwd");
    this.port = Integer.parseInt(sysConfigMng.getCacheValue("sys.ftp.port"));
    connect(getFTPClient());
    String localFileTempFolder = sysConfigMng.getCacheValue("sys.upload.tempFolder");
    List<Attachment> list = attachmentMng.getFileSendToFTP();
    if (!list.isEmpty()) {
      logger.debug(list.size() + "个文件将执行同步");
      for (Attachment attachment : list) {
        attachment = attachmentMng.get(attachment.getId());
        String targetFolder = uploadDir();
        if (createFolder(targetFolder)) {
          logger.debug("toFolder:" + targetFolder + attachment.getFilename());
          logger.debug("fromFolder:" + localFileTempFolder + attachment.getFilepath());
          if (put("/home/ftpall/" + targetFolder + attachment.getFilename(), localFileTempFolder + attachment.getFilepath(), false)) {
            logger.debug("传输完毕！");
            attachmentMng.saveOrUpdate(attachment);
            new File(localFileTempFolder + attachment.getFilepath()).delete();
          }
        }
      }
    }
    disconnect();
    sysConfigMng.setValue(Constants.FTPUpdateTime, new Date().toString(), "");
  }

  /**
   * 获取上传文件夹路径
   * 规则：本系统FTP上传根目录/yyyy/MM/dd/
   *
   * @return 上传文件夹路径字符串
   */
  private String uploadDir() {
    return sysConfigMng.getCacheValue(Constants.FTPRootPath)
        + "/"
        + Calendar.getInstance().get(Calendar.YEAR)
        + "/"
        + ((Calendar.getInstance().get(Calendar.MONTH) + 1) < 10
        ? ("0" + (Calendar.getInstance().get(Calendar.MONTH) + 1))
        : (Calendar.getInstance().get(Calendar.MONTH) + 1))
        + "/"
        + (Calendar.getInstance().get(Calendar.DATE) < 10
        ? ("0" + Calendar.getInstance().get(Calendar.DATE))
        : (Calendar.getInstance().get(Calendar.DATE)))
        + "/";
  }

  @Resource
  private SysConfigMng sysConfigMng;

  @Resource
  private AttachmentMng attachmentMng;

  public static void main(String[] args) {
    FtpTools f = new FtpTools();
    f.host = "100.100.100.65";
    f.username = "ftpall";
    f.password = "ftpall";
    f.port = 21;
    FTPClient fc = null;
    try {
      fc = f.getFTPClient();
    } catch (FTPClientException e) {
      e.printStackTrace();
    }
    try {
      f.connect(fc);
    } catch (FTPClientException e) {
      e.printStackTrace();
    }
    try {
      f.get("bulletin/2015/09/07/d993bfb2-f3f6-498f-b6e6-36d4b8efaed4.txt", "e:/99.txt", true);
    } catch (FTPClientException e) {
      e.printStackTrace();
    }
    try {
      System.out.print(f.put("bulletin/123/345/456/1.txt", "e:/1234.txt", false));
    } catch (FTPClientException e) {
      e.printStackTrace();
    }
    /*try {
      f.mkdir("bulletin/2015/09/07/");
    } catch (FTPClientException e) {
      e.printStackTrace();
    }*/
    /*InputStream inputStream = null;
    boolean copyFalg = true;
    try {
      String ftpFile = "/home/ftpall/dmarch.ini";
      try {
        inputStream = fc.retrieveFileStream(ftpFile);
      } catch (IOException e) {
        e.printStackTrace();
      }
      // 复制文件时掉用了retrieveFileStream方法
      // 调用完之后必须调用completePendingCommand释放,否则FTP会断开连接
      try {
        if (!fc.completePendingCommand()) {
          copyFalg = false;
        }
      } catch (IOException e) {
        e.printStackTrace();
      }
      if (inputStream != null) {
        try {
          fc.storeFile("/home/ftpall/dmarch123.ini", inputStream);
        } catch (IOException e) {
          e.printStackTrace();
        }
        // 关闭文件流
        try {
          inputStream.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
        System.out.print("完成复制");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }*/
  }
}
