package com.cubic.util.io;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;

import java.io.File;

/**
 * Created by liang_zhang on 2014/12/16.
 */
public class FileZipHelper {

  private File zipFile;

  public FileZipHelper(String zipFile) {
    this.zipFile = new File(zipFile);
  }

  /**
   * 执行压缩操作
   *
   * @param srcPathName 需要被压缩的文件/文件夹
   */
  public File compressExe(String srcPathName) {
    File srcdir = new File(srcPathName);
    if (!srcdir.exists()) {
      throw new RuntimeException(srcPathName + "不存在！");
    }
    Project prj = new Project();
    Zip zip = new Zip();
    zip.setProject(prj);
    zip.setDestFile(zipFile);
    FileSet fileSet = new FileSet();
    fileSet.setProject(prj);
    fileSet.setDir(srcdir);
    //fileSet.setIncludes("**/*.java"); //包括哪些文件或文件夹 eg:zip.setIncludes("*.java");
    //fileSet.setExcludes(...); //排除哪些文件或文件夹
    zip.addFileset(fileSet);
    zip.execute();
    return zipFile;
  }

  public static void main(String[] args) {
    FileZipHelper zca = new FileZipHelper("c:/res/123.zip");
    zca.compressExe("c:/res");
  }
}
