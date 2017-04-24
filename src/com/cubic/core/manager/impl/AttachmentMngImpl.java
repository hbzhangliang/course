package com.cubic.core.manager.impl;

import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.Attachment;
import com.cubic.core.manager.AttachmentMng;
import com.cubic.core.manager.SysConfigMng;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;

@Service("attachmentMng")
@Transactional
public class AttachmentMngImpl extends BaseMngImpl<Attachment> implements AttachmentMng {

  @Override
  public List<Attachment> findByObjectId(String objectId) {
    if (StringUtils.isNotEmpty(objectId))
      return find("from Attachment where objectId = ?0", objectId);
    else
      return null;
  }

  @Override
  public List<Attachment> findByObjectIdandCate(String objectId,String category){
    if (StringUtils.isNotEmpty(objectId))
      return find("from Attachment where objectId = ?0 and category= ?1", objectId,category);
    else
      return null;

  }

  @Override
  public List<Attachment> getFileSendToFTP() {
    return find("from Attachment where sentToFTP = 0");
  }

  @Override
  public String getIdByDisplayName(String fileDisplayName) {
    return (String) jdbcTemplate.queryForList("SELECT pid FROM T_CORE_ATTACHMENT WHERE FILE_NAME_DISPLAY = ?", fileDisplayName).get(0).get("pid");
  }

  /**
   * 获取附件物理文件路径
   *
   * @param attId attachmentId
   * @return 路径
   */
  @Override
  public String getFilePath(String attId) {
    if (StringUtils.isEmpty(attId))
      return "";
    else {
      Attachment a = load(attId);
      return sysConfigMng.getCacheValue("sys.upload.tempFolder") + a.getFilepath();
    }
  }

  @Override
  public void clearAttachment(String attId) {
    Attachment a = load(attId);
    new File(sysConfigMng.getCacheValue("sys.upload.tempFolder") + a.getFilepath()).delete();
    del(a.getId());
  }

  @Override
  public void updateObjectId(String objectId, String fid) {
    for (String attrId : fid.split(",")) {
      if(StringUtils.isNotEmpty(attrId)) {
        Attachment a = get(attrId);
        a.setObjectId(objectId);
        saveOrUpdate(a);
      }
    }
  }

  @Override
  public Map<String, Object> getImageAttByObjId(String id) {
    return jdbcTemplate.queryForList("SELECT FILETYPE,FILEPATH FROM t_core_attachment WHERE OBJECTID = ?", id).get(0);
  }

  @Resource
  private SysConfigMng sysConfigMng;
}
