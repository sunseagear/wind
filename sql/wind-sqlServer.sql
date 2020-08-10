/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : SQL Server
 Source Server Version : 11003128
 Source Host           : localhost:1433
 Source Catalog        : wind
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 11003128
 File Encoding         : 65001

 Date: 10/08/2020 21:05:53
*/


-- ----------------------------
-- Table structure for email_send_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[email_send_log]') AND type IN ('U'))
	DROP TABLE [dbo].[email_send_log]
GO

CREATE TABLE [dbo].[email_send_log] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [email] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [subject] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [send_data] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [send_code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [response_date] datetime2(0)  NULL,
  [try_num] int  NULL,
  [msg] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nvarchar(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[email_send_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'email'
GO

EXEC sp_addextendedproperty
'MS_Description', N'主题',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'subject'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模板类型',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送编码',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'send_code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'响应时间',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'response_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'重发次数',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'try_num'
GO

EXEC sp_addextendedproperty
'MS_Description', N'返回消息',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'msg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送状态',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记（0：正常；1：删除）',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'email_send_log',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of email_send_log
-- ----------------------------
INSERT INTO [dbo].[email_send_log] ([id], [email], [subject], [content], [send_data], [send_code], [response_date], [try_num], [msg], [status], [del_flag], [remarks], [tenant_id]) VALUES (N'05df11ef6fd8467d865d8bc350ca0967', N'502079461@qq.com', N'测试模板', N'<p>测试模板123456</p>', N'{"code":"123456"}', N'2p6dl894ur', N'2018-11-09 11:44:00', N'3', N'发送失败', N'-1', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[email_send_log] ([id], [email], [subject], [content], [send_data], [send_code], [response_date], [try_num], [msg], [status], [del_flag], [remarks], [tenant_id]) VALUES (N'1bd18fc2fb4309841e230c0a99bbda8c', N'dothegod@gmail.com', N'测试模板', N'<p>测试模板1111111</p>', N'{"code":"1111111"}', N'2p6dl894ur', N'2020-02-05 02:13:34', N'0', N'发送失败', N'-1', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[email_send_log] ([id], [email], [subject], [content], [send_data], [send_code], [response_date], [try_num], [msg], [status], [del_flag], [remarks], [tenant_id]) VALUES (N'4287a548d8d988957c03f9ede01c7651', N'dothegod@163.com', N'测试模板', N'<p>测试模板123,123,123</p>', N'{"code":123123123}', N'2p6dl894ur', N'2020-02-05 02:31:12', N'0', N'发送成功', N'1', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[email_send_log] ([id], [email], [subject], [content], [send_data], [send_code], [response_date], [try_num], [msg], [status], [del_flag], [remarks], [tenant_id]) VALUES (N'ae75ade7429e80edddcb46ba1d9e330f', N'dothegod@163.com', N'测试模板', N'<p>测试模板1111111</p>', N'{"code":"1111111"}', N'2p6dl894ur', N'2020-02-05 02:18:15', N'0', N'发送成功', N'1', N'0', NULL, N'00000000')
GO


-- ----------------------------
-- Table structure for email_template
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type IN ('U'))
	DROP TABLE [dbo].[email_template]
GO

CREATE TABLE [dbo].[email_template] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [template_subject] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [template_content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] nvarchar(19) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] nvarchar(19) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[email_template] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版名称',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版编码',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版主题',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'template_subject'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版内容',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'template_content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记（0：正常；1：删除）',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'email_template',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'邮件发送模板',
'SCHEMA', N'dbo',
'TABLE', N'email_template'
GO


-- ----------------------------
-- Records of email_template
-- ----------------------------
INSERT INTO [dbo].[email_template] ([id], [name], [code], [template_subject], [template_content], [remarks], [update_by], [create_date], [del_flag], [create_by], [update_date], [tenant_id]) VALUES (N'4c7bc6a0b20c41a6be9a6495f65b10f3', N'JeeWeb社区找回密码', N'7e6cww7l5t', N'JeeWeb社区找回密码', N'&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;width: 600px; border: 1px solid #ddd; border-radius: 3px; color: #555; font-family: ''Helvetica Neue Regular'',Helvetica,Arial,Tahoma,''Microsoft YaHei'',''San Francisco'',''微软雅黑'',''Hiragino Sans GB'',STHeitiSC-Light; font-size: 12px; height: auto; margin: auto; overflow: hidden; text-align: left; word-break: break-all; word-wrap: break-word;&quot;&gt; 
    &lt;tbody style=&quot;margin: 0; padding: 0;&quot;&gt; 
     &lt;tr style=&quot;background-color: #393D49; height: 60px; margin: 0; padding: 0;&quot;&gt; 
      &lt;td style=&quot;margin: 0; padding: 0;&quot;&gt; 
       &lt;div style=&quot;color: #5EB576; margin: 0; margin-left: 30px; padding: 0;&quot;&gt;
&lt;a style=&quot;font-size: 14px; margin: 0; padding: 0; color: #5EB576; text-decoration: none;&quot; href=&quot;http://www.jeeweb.cn/&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;JeeWeb社区 - JeeWeb快速开发平台框架官方社区&lt;/a&gt;&lt;br&gt;&lt;/div&gt; &lt;/td&gt; 
     &lt;/tr&gt; 
     &lt;tr style=&quot;margin: 0; padding: 0;&quot;&gt; 
      &lt;td style=&quot;margin: 0; padding: 30px;&quot;&gt; &lt;p style=&quot;line-height: 20px; margin: 0; margin-bottom: 10px; padding: 0;&quot;&gt; Hi，&lt;em style=&quot;font-weight: 700;&quot;&gt;${realname}&lt;/em&gt;，童鞋，请在30分钟内重置您的密码： &lt;/p&gt; 
       &lt;div style=&quot;&quot;&gt; 
        &lt;a href=&quot;http://192.168.10.56:8080/user/reset?token=${token}&amp;amp;key=email&amp;amp;value=${email}&quot; style=&quot;background-color: #009E94; color: #fff; display: inline-block; height: 32px; line-height: 32px; margin: 0 15px 0 0; padding: 0 15px; text-decoration: none;&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;立即重置密码&lt;/a&gt; 
       &lt;/div&gt; &lt;p style=&quot;line-height: 20px; margin-top: 20px; padding: 10px; background-color: #f2f2f2; font-size: 12px;&quot;&gt; 如果该邮件不是由你本人操作，请勿进行激活！否则你的邮箱将会被他人绑定。 &lt;/p&gt; &lt;/td&gt; 
     &lt;/tr&gt; 
     &lt;tr style=&quot;background-color: #fafafa; color: #999; height: 35px; margin: 0; padding: 0; text-align: center;&quot;&gt; 
      &lt;td style=&quot;margin: 0; padding: 0;&quot;&gt;系统邮件，请勿直接回复。&lt;/td&gt; 
     &lt;/tr&gt; 
    &lt;/tbody&gt; 
   &lt;/table&gt; 
   &lt;style type=&quot;text/css&quot;&gt;
      .qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}
   &lt;/style&gt;', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-12 11:44:12', N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-12 14:46:35', N'00000000')
GO

INSERT INTO [dbo].[email_template] ([id], [name], [code], [template_subject], [template_content], [remarks], [update_by], [create_date], [del_flag], [create_by], [update_date], [tenant_id]) VALUES (N'e67c81395da3448782da1771f37ab840', N'测试模板', N'2p6dl894ur', N'测试模板', N'&lt;p&gt;测试模板${code}&lt;/p&gt;', NULL, NULL, N'2018-11-09 11:39:07', N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', NULL, N'00000000')
GO

INSERT INTO [dbo].[email_template] ([id], [name], [code], [template_subject], [template_content], [remarks], [update_by], [create_date], [del_flag], [create_by], [update_date], [tenant_id]) VALUES (N'fc38a13d91c0408ebc3ff4710ddffb20', N'JeeWeb社区激活邮件', N'l2g4ywbs0l', N'JeeWeb社区激活邮件', N'&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;width: 600px; border: 1px solid #ddd; border-radius: 3px; color: #555; font-family: ''Helvetica Neue Regular'',Helvetica,Arial,Tahoma,''Microsoft YaHei'',''San Francisco'',''微软雅黑'',''Hiragino Sans GB'',STHeitiSC-Light; font-size: 12px; height: auto; margin: auto; overflow: hidden; text-align: left; word-break: break-all; word-wrap: break-word;&quot;&gt; 
    &lt;tbody style=&quot;margin: 0; padding: 0;&quot;&gt; 
     &lt;tr style=&quot;background-color: #393D49; height: 60px; margin: 0; padding: 0;&quot;&gt; 
      &lt;td style=&quot;margin: 0; padding: 0;&quot;&gt; 
       &lt;div style=&quot;color: #5EB576; margin: 0; margin-left: 30px; padding: 0;&quot;&gt;
&lt;a style=&quot;font-size: 14px; margin: 0; padding: 0; color: #5EB576; text-decoration: none;&quot; href=&quot;http://www.jeeweb.cn/&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;JeeWeb社区 - JeeWeb快速开发平台框架官方社区&lt;/a&gt;
&lt;br&gt;&lt;/div&gt; &lt;/td&gt; 
     &lt;/tr&gt; 
     &lt;tr style=&quot;margin: 0; padding: 0;&quot;&gt; 
      &lt;td style=&quot;margin: 0; padding: 30px;&quot;&gt; &lt;p style=&quot;line-height: 20px; margin: 0; margin-bottom: 10px; padding: 0;&quot;&gt; Hi，&lt;em style=&quot;font-weight: 700;&quot;&gt;${realname}&lt;/em&gt;，请完成以下操作： &lt;/p&gt; 
       &lt;div style=&quot;&quot;&gt; 
        &lt;a href=&quot;http://192.168.10.56:8080/user/activate?token=${token}&quot; style=&quot;background-color: #009E94; color: #fff; display: inline-block; height: 32px; line-height: 32px; margin: 0 15px 0 0; padding: 0 15px; text-decoration: none;&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;立即激活邮箱&lt;/a&gt; 
       &lt;/div&gt; &lt;p style=&quot;line-height: 20px; margin-top: 20px; padding: 10px; background-color: #f2f2f2; font-size: 12px;&quot;&gt; 如果该邮件不是由你本人操作，请勿进行激活！否则你的邮箱将会被他人绑定。 &lt;/p&gt; &lt;/td&gt; 
     &lt;/tr&gt; 
     &lt;tr style=&quot;background-color: #fafafa; color: #999; height: 35px; margin: 0; padding: 0; text-align: center;&quot;&gt; 
      &lt;td style=&quot;margin: 0; padding: 0;&quot;&gt;系统邮件，请勿直接回复。&lt;/td&gt; 
     &lt;/tr&gt; 
    &lt;/tbody&gt; 
   &lt;/table&gt; 
   &lt;style type=&quot;text/css&quot;&gt;
      .qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}
   &lt;/style&gt;', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-12 11:41:05', N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-14 17:16:06', N'00000000')
GO


-- ----------------------------
-- Table structure for oa_notification
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[oa_notification]') AND type IN ('U'))
	DROP TABLE [dbo].[oa_notification]
GO

CREATE TABLE [dbo].[oa_notification] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [status] nvarchar(4) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[oa_notification] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布状态',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记（0：正常；1：删除）',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'oa_notification',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of oa_notification
-- ----------------------------
INSERT INTO [dbo].[oa_notification] ([id], [title], [content], [status], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'40281e815c912406015c914e3e27006b', N'测试通知1', N'测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知测试通知', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-06-10 17:20:43', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-07-22 23:27:22', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[oa_notification] ([id], [title], [content], [status], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'40281e815c914f07015c91548e690000', N'测试通知2', N'测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2测试通知2', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-06-10 17:27:36', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-07-22 23:27:25', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[oa_notification] ([id], [title], [content], [status], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'40281e815c914f07015c9154aa010001', N'测试通知3', N'测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3测试通知3', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-06-10 17:27:43', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-07-22 23:27:28', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[oa_notification] ([id], [title], [content], [status], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'40281e815c914f07015c9154c1b30002', N'测试通知4', N'测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4测试通知4', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-06-10 17:27:49', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-03-06 10:29:46', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[oa_notification] ([id], [title], [content], [status], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'40288ab85cf356ef015cf35c67ae0004', N'1111', N'11111', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-06-29 18:18:58', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-08-24 14:20:16', N'0', NULL, N'00000000')
GO


-- ----------------------------
-- Table structure for oss_attachment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[oss_attachment]') AND type IN ('U'))
	DROP TABLE [dbo].[oss_attachment]
GO

CREATE TABLE [dbo].[oss_attachment] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [file_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [user_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [upload_time] datetime2(0)  NOT NULL,
  [upload_ip] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [file_extension] nvarchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [file_path] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [file_size] int  NOT NULL,
  [content_type] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [base_path] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[oss_attachment] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'文件名称',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'file_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户ID',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'上传时间',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'upload_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'上传的ID',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'upload_ip'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文件扩展名',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'file_extension'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文件路径',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'file_path'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文件大小',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'file_size'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'oss的根路径',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'base_path'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'oss_attachment',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of oss_attachment
-- ----------------------------
INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'048ae89ba6e0cda8eb7b294b4839e040', N'logo1', NULL, N'2020-02-04 08:38:25', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/20200204223824716.png', N'42300', N'image/png', N'1', NULL, NULL, N'2020-02-04 08:38:26', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'08a541990c550031a4b5c84bc19b0a05', N'疫情公告', NULL, N'2020-02-04 19:47:30', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/20200205094729693.png', N'11098', N'image/png', N'1', NULL, NULL, N'2020-02-04 19:47:30', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'0ae88bc610694384aecc425b1346be52', N'未标题-14', NULL, N'2019-05-18 16:26:20', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558167979749.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:26:20', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'2a6a09ecc28043dd837c03ff1e3a2cd7', N'未命名', NULL, N'2019-05-18 16:13:21', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558167200777.png', N'10591', N'image/png', N'1', N'', NULL, N'2019-05-18 16:13:21', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'38bd759e0cfd40400503044028577916', N'一键报警', NULL, N'2020-02-04 19:56:58', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/test/20200205095657434.png', N'10385', N'image/png', N'1', N'test', NULL, N'2020-02-04 19:56:59', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'3a04882c8bf1452a9a880d5b3f3d32e9', N'未标题-14', NULL, N'2019-05-18 16:28:22', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558168101498.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:28:22', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'45853f6cff714e17bd3742f8baf9097a', N'未标题-14', NULL, N'2019-05-18 16:34:10', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558168448251.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:34:10', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'4df750134102368340d550a322f4cc66', N'本地疫情', NULL, N'2020-02-04 07:30:55', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/2020/02/04/1580822952887.png', N'18351', N'image/png', N'1', NULL, NULL, N'2020-02-04 07:30:55', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'4eb63491f4bd6111ebbdd7b812006880', N'防护指南', NULL, N'2020-02-04 09:02:23', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/20200204230222687.png', N'13621', N'image/png', N'1', NULL, NULL, N'2020-02-04 09:02:23', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'50a3c0af3f97425094be83dce6239f0d', N'屏幕截图(1)', NULL, N'2018-11-06 15:50:18', N'127.0.0.1', N'png', N'jeewebbbs.oss-cn-beijing.aliyuncs.com/user/portrait/2018/11/06/1541490618213.png', N'270806', N'image/png', N'1', N'/user/portrait', NULL, N'2018-11-06 15:50:18', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'5f533ee06cc30510d40d384b09b4426f', N'疑似上报', NULL, N'2020-02-04 19:53:26', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/20200205095325043.png', N'10349', N'image/png', N'1', N'', NULL, N'2020-02-04 19:53:27', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'68216b84c0a2405d829dd046ba7bd267', N'屏幕截图(1)', NULL, N'2018-11-06 15:57:09', N'127.0.0.1', N'png', N'http://jeewebbbs.oss-cn-beijing.aliyuncs.com/user/portrait/2018/11/06/1541491028415.png', N'270806', N'image/png', N'1', N'/user/portrait', NULL, N'2018-11-06 15:57:09', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'6901f6a94805484a9117edd98e8ece89', N'未标题-14', NULL, N'2019-05-18 16:36:29', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558168588826.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:36:29', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'69d6ff3f22055bffb43630d05c972595', N'疫情公告', NULL, N'2020-02-04 07:27:47', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/2020/02/04/1580822866443.png', N'11098', N'image/png', N'1', NULL, NULL, N'2020-02-04 07:27:47', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'6d235457c508116443ce979b573ad6b4', N'logo1', NULL, N'2020-02-04 07:57:44', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/20200204215743819.png', N'42300', N'image/png', N'1', NULL, NULL, N'2020-02-04 07:57:44', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'6f920a55ff094d37895e71d6a5f8a0e3', N'未标题-14', NULL, N'2019-05-18 16:38:10', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558168689991.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:38:10', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'8bcf1ec98ee624786ee6ab437f62c6dc', N'防护指南', NULL, N'2020-02-04 09:22:42', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/gangwanvuetest/2020/02/04/20200204232242045.png', N'13621', N'image/png', N'1', NULL, NULL, N'2020-02-04 09:22:42', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'bc0efa88543c45c0b62f460f32539dee', N'未标题-14', NULL, N'2019-05-18 16:37:22', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558168642074.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:37:22', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'bfc31c1c0ba835d56c2126790fb00f1f', N'本地疫情', NULL, N'2020-02-04 07:32:37', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/2020/02/04/1580823156746.png', N'18351', N'image/png', N'1', NULL, NULL, N'2020-02-04 07:32:37', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'c5e4697deb134072aafb032c5941870d', N'未标题-14', NULL, N'2019-05-18 16:25:47', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558167947101.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:25:47', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'cbae2f4be5b0adbc23d9c6d3d01f4ef0', N'疫情公告', NULL, N'2020-02-04 07:23:07', N'127.0.0.1', N'png', N'http://gangwantest.oss-cn-beijing.aliyuncs.com/2020/02/04/1580822586600.png', N'11098', N'image/png', N'1', NULL, NULL, N'2020-02-04 07:23:09', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'e8e6985e798f4c6a9997a1e948d24264', N'未标题-14', NULL, N'2019-05-18 16:11:52', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558167111350.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:11:52', NULL, NULL, NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[oss_attachment] ([id], [file_name], [user_id], [upload_time], [upload_ip], [file_extension], [file_path], [file_size], [content_type], [status], [base_path], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'f2119774227c41b3be8d3ac8a99e898e', N'未标题-14', NULL, N'2019-05-18 16:43:26', N'127.0.0.1', N'png', N'http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558169005633.png', N'4250', N'image/png', N'1', N'', NULL, N'2019-05-18 16:43:26', NULL, NULL, NULL, N'0', N'00000000')
GO


-- ----------------------------
-- Table structure for sms_send_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sms_send_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sms_send_log]
GO

CREATE TABLE [dbo].[sms_send_log] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [phone] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [template_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [send_data] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [send_code] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [try_num] int  NULL,
  [status] nvarchar(4) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [smsid] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [code] nvarchar(40) COLLATE Chinese_PRC_CI_AS  NULL,
  [msg] nvarchar(600) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [response_date] datetime2(0)  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sms_send_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模板名称',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'template_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送数据',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'send_data'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送状态',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送响应消息ID',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'smsid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'返回码',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'返回消息',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'msg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记（0：正常；1：删除）',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'响应时间',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'response_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sms_send_log',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of sms_send_log
-- ----------------------------
INSERT INTO [dbo].[sms_send_log] ([id], [phone], [template_name], [send_data], [send_code], [try_num], [status], [smsid], [code], [msg], [del_flag], [response_date], [tenant_id]) VALUES (N'809291e1091c4784ac5cc006d6f7061a', N'15085980308', N'用户注册验证码', N'{"code":"123456"}', N'7hch8lsi8w', N'0', N'1', N'8852983', NULL, N'OK', N'0', N'2018-11-09 11:47:35', N'00000000')
GO

INSERT INTO [dbo].[sms_send_log] ([id], [phone], [template_name], [send_data], [send_code], [try_num], [status], [smsid], [code], [msg], [del_flag], [response_date], [tenant_id]) VALUES (N'a576246cab47469997e76b3de666238f', N'15085980308', N'用户注册验证码', N'{"code":"49156"}', N'7hch8lsi8w', N'1', N'1', N'7653143', NULL, N'OK', N'0', N'2018-11-09 11:26:38', N'00000000')
GO

INSERT INTO [dbo].[sms_send_log] ([id], [phone], [template_name], [send_data], [send_code], [try_num], [status], [smsid], [code], [msg], [del_flag], [response_date], [tenant_id]) VALUES (N'a65867c85f97474fbdc2414d1b77cf97', N'15085980308', N'找回密码验证码', N'{"code":"88814"}', N'oal0up6qo2', N'3', N'-1', N'5365487', NULL, N'触发分钟级流控Permits:1', N'0', N'2018-11-09 11:27:00', N'00000000')
GO


-- ----------------------------
-- Table structure for sms_template
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sms_template]') AND type IN ('U'))
	DROP TABLE [dbo].[sms_template]
GO

CREATE TABLE [dbo].[sms_template] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [business_type] nvarchar(4) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [template_content] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sms_template] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版名称',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版编码',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'业务类型',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'business_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版内容',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'template_content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记（0：正常；1：删除）',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sms_template',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of sms_template
-- ----------------------------
INSERT INTO [dbo].[sms_template] ([id], [name], [code], [business_type], [template_content], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'6c625030d72e45b181ce689a2ca9afde', N'用户注册验证码', N'7hch8lsi8w', N'1', N'SMS_119805068', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-14 10:34:21', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-16 13:01:35', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[sms_template] ([id], [name], [code], [business_type], [template_content], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'a170787aa90c495d858401a36428999f', N'找回密码验证码', N'oal0up6qo2', N'1', N'SMS_119805067', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-14 10:34:38', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 16:32:43', N'0', NULL, N'00000000')
GO


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_config]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_config]
GO

CREATE TABLE [dbo].[sys_config] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [code] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [value] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [del_flag] int  NOT NULL,
  [is_sys] tinyint  NOT NULL,
  [tenant_id] nvarchar(11) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_config] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'值',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否是系统配置，如果是，该配置不可以删除',
'SCHEMA', N'dbo',
'TABLE', N'sys_config',
'COLUMN', N'is_sys'
GO


-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO [dbo].[sys_config] ([id], [create_by], [create_date], [update_by], [update_date], [remarks], [name], [code], [value], [del_flag], [is_sys], [tenant_id]) VALUES (N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-27 11:10:20', N'请勿随便设置', N'使用许可', N'license', N'123654', N'0', N'1', N'00000000')
GO

INSERT INTO [dbo].[sys_config] ([id], [create_by], [create_date], [update_by], [update_date], [remarks], [name], [code], [value], [del_flag], [is_sys], [tenant_id]) VALUES (N'107410e99915b184ba30aa34f2294a77', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-16 04:36:39', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-16 07:34:02', N'11', N'测试', N'test', N'11', N'0', N'0', N'00000000')
GO

INSERT INTO [dbo].[sys_config] ([id], [create_by], [create_date], [update_by], [update_date], [remarks], [name], [code], [value], [del_flag], [is_sys], [tenant_id]) VALUES (N'2', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-27 10:47:13', NULL, N'产品ID', N'productId', N'wind', N'0', N'0', N'00000000')
GO


-- ----------------------------
-- Table structure for sys_data_rule
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_rule]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_rule]
GO

CREATE TABLE [dbo].[sys_data_rule] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [menu_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [resource_code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [scope_name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [scope_field] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [scope_class] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [scope_column] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [scope_type] int  NOT NULL,
  [scope_value] nvarchar(2000) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_dept] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [status] int  NULL,
  [del_flag] int  NULL,
  [table_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_column] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [user_entity_field] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_data_rule] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'menu_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'资源编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'resource_code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'scope_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限字段',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'scope_field'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限类名',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'scope_class'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限字段',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'scope_column'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'scope_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限值域',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'scope_value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建部门',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'create_dept'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否已删除',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据库表',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'table_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户表对应字段',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'user_column'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'user实体类对应字段',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule',
'COLUMN', N'user_entity_field'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据权限表',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_rule'
GO


-- ----------------------------
-- Records of sys_data_rule
-- ----------------------------
INSERT INTO [dbo].[sys_data_rule] ([id], [menu_id], [resource_code], [scope_name], [scope_field], [scope_class], [scope_column], [scope_type], [scope_value], [remarks], [create_by], [create_dept], [create_date], [update_by], [update_date], [status], [del_flag], [table_name], [user_column], [tenant_id], [user_entity_field]) VALUES (N'dfc71dbeb4f8f15f9e00a945c177d2a6', NULL, N'table', N'test', N'id,title,author,type,level,content,`user.realname`,`user.username`,status', N'com.sunseagear.wind.modules.test.table.mapper.TableMapper.selectPage', N'author', N'2', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', NULL, N'2019-11-29 15:18:25', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-07-05 16:26:10', NULL, N'0', N'sys_organization', N'organization_id', N'00000000', N'organizationId')
GO

INSERT INTO [dbo].[sys_data_rule] ([id], [menu_id], [resource_code], [scope_name], [scope_field], [scope_class], [scope_column], [scope_type], [scope_value], [remarks], [create_by], [create_dept], [create_date], [update_by], [update_date], [status], [del_flag], [table_name], [user_column], [tenant_id], [user_entity_field]) VALUES (N'2d1d11805de287aa9b9108350cf45eac', NULL, N'expandTable', N'test1', N'*', N'com.sunseagear.wind.modules.test.expandtable.mapper.ExpandTableMapper.selectPage', N'organization_id', N'4', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', NULL, N'2019-12-03 07:30:19', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-29 22:54:32', NULL, N'0', N'sys_organization', N'organizationId', N'00000000', NULL)
GO


-- ----------------------------
-- Table structure for sys_data_source
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_data_source]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_data_source]
GO

CREATE TABLE [dbo].[sys_data_source] (
  [id] nvarchar(36) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [db_key] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [description] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [driver_class] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [url] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [db_user] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [db_password] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [db_type] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [db_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_data_source] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'索引关键字',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'db_key'
GO

EXEC sp_addextendedproperty
'MS_Description', N'描述',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
'MS_Description', N'驱动',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'driver_class'
GO

EXEC sp_addextendedproperty
'MS_Description', N'URL',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'url'
GO

EXEC sp_addextendedproperty
'MS_Description', N'帐号',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'db_user'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'db_password'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据库类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'db_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据库名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'db_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_data_source',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of sys_data_source
-- ----------------------------
INSERT INTO [dbo].[sys_data_source] ([id], [db_key], [description], [driver_class], [url], [db_user], [db_password], [db_type], [db_name], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'402880e74e064fc5014e0652f72b0001', N'neiwangbaogong', N'微信运营数据库', N'com.mysql.jdbc.Driver', N'jdbc:mysql://localhost:3306/attendance?useUnicode=true&amp;amp;amp;amp;amp;characterEncoding=UTF-8', N'root', N'gliwang123456', N'mysql', N'attendance', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2017-08-03 08:40:26', NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[sys_data_source] ([id], [db_key], [description], [driver_class], [url], [db_user], [db_password], [db_type], [db_name], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'8a8aada9486347c001486401180a0003', N'PMS', N'sap db', N'oracle.jdbc.driver.OracleDriver', N'jdbc:oracle:thin:@localhost:1521:oral', N'PMS', N'tz', N'oracle', N'PMS', NULL, NULL, NULL, NULL, NULL, N'0', N'00000000')
GO


-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dict]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dict]
GO

CREATE TABLE [dbo].[sys_dict] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [gid] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [label] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [value] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [sort] int  NULL,
  [remarks] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_dict] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分组ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict',
'COLUMN', N'gid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'键值键',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict',
'COLUMN', N'label'
GO

EXEC sp_addextendedproperty
'MS_Description', N'值',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict',
'COLUMN', N'value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict',
'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'描述',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据字典',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict'
GO


-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'04e4a4b8af5b6590f609ab29f1d920f1', N'e4ed989ab589d1be4b708bd285c24f1e', N'所在机构及下级可见', N'4', N'4', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:35:36', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-01-25 21:44:43', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'0578673152dd43afb7e2c65a4e3463b5', NULL, N'wey7', N'002', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 00:02:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'0b05a99bb7c24053bb06ddb9b41068c8', N'9dc0d8aceb9046559f0fcd3acfd4fb8d', N'按钮', N'3', N'3', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:47:23', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:38:29', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'2a6cb5048f204a6d99f5ea6e8cf450bf', N'0bf0a5f4378748c1b6b759aea7da9c72', N'修改', N'update', N'2', N'修改', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:55:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'2abd99f7a44e4ef0937b97109b31db87', N'9f28ef405c63412f9ef6524edb4adc68', N'继续执行', N'1', N'1', N'继续执行', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-17 15:37:58', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'30bf1683c3a54772bbc75193d8cc48ab', N'0bf0a5f4378748c1b6b759aea7da9c72', N'删除', N'delete', N'5', N'删除', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:55:29', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'32143ca22bd14795910255281934c340', NULL, N'H6', N'001', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 00:01:36', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'33a22077c3b8e79d93a1c78e23a0a050', N'e4ed989ab589d1be4b708bd285c24f1e', N'本人可见', N'2', N'2', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:35:00', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'35f74a4053fa4880af41819297c9823f', N'69c0d7e407184b339b055215b3b719a5', N'25', N'25', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 11:32:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3e285e6650cb47f88f452e156b5bf903', N'0bf0a5f4378748c1b6b759aea7da9c72', N'导出', N'export', N'7', N'导出', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:56:28', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3eb18e509ffb4dd5a069e6ea10a14001', N'1044ab256fd2468289c6f876905ff8aa', N'是', N'true', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:41:25', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40281e815ced1f27015ced2f83bc000b', N'40281e815ced1f27015ced2be5330003', N'男', N'1', N'1', N'1', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40281e815cef4f99015cef6f7d070005', N'40281e815ced1f27015ced2be5330003', N'女', N'2', N'1', N'女', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85a20b609015a20c422e90003', N'40288ab85a20b609015a20c3f7bf0002', N'是', N'1', N'1', N'1', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85a5eecc6015a5eede8720000', N'40288ab85a20b609015a20c3f7bf0002', N'否', N'0', N'2', N'否', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85bf1549e015bf175152a0001', N'40288ab85bf1549e015bf17370ff0000', N'在线', N'on_line', N'1', N'在线', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85bf1549e015bf17559ac0002', N'40288ab85bf1549e015bf17370ff0000', N'隐身', N'hidden', N'2', N'隐身', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85bf1549e015bf17590820003', N'40288ab85bf1549e015bf17370ff0000', N'强制退出', N'force_logout', N'3', N'强制退出', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85c8593cd015c859b70010011', N'40288ab85c8593cd015c859b1fcf0010', N'验证码', N'1', N'1', N'验证码', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85c8593cd015c859b8ff50012', N'40288ab85c8593cd015c859b1fcf0010', N'通知', N'2', N'2', N'通知', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85c86382b015c863993a30002', N'40288ab85c8593cd015c859b1fcf0010', N'其他', N'99', N'99', N'其他', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4e23f0cd2a154d62bdd9417610ca2679', N'0bf0a5f4378748c1b6b759aea7da9c72', N'新增', N'insert', N'1', N'新增', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:54:48', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'5b905a49c182491988865986e4cc48e3', N'9f28ef405c63412f9ef6524edb4adc68', N'放弃执行', N'3', N'3', N'放弃执行', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-17 15:38:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'6aeb216b950740c9ba61ba2994b4ce98', N'9f28ef405c63412f9ef6524edb4adc68', N'一次执行', N'2', N'2', N'一次执行', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-17 15:38:10', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'72a55df5480c48b79e095eb5c6a4728f', N'd8fd027d0743468c828d7d068239d483', N'成功', N'1', N'1', N'成功', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-28 13:15:31', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'7da9613b9af54ea19fd6b2ba349fc8ea', N'9dc0d8aceb9046559f0fcd3acfd4fb8d', N'菜单', N'2', N'2', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:47:13', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:38:26', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'821adedf100644382102418b6bb9fd9f', N'e4ed989ab589d1be4b708bd285c24f1e', N'全部可见', N'1', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:34:43', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'839273eee78947759bd8a980fcf77e99', N'0bf0a5f4378748c1b6b759aea7da9c72', N'查询', N'select', N'3', N'查询', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:55:13', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'90f97d607fb745019c88e126b989fa8d', N'7a4ed165f128484787a119179b7c18fd', N'普通类', N'2', N'2', N'普通类', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-08-20 15:00:56', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-17 17:57:04', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'929342ef5d29f0db17df321cb48d54b5', N'e4ed989ab589d1be4b708bd285c24f1e', N'所在机构可见', N'3', N'3', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:35:10', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'94be09dc54b345e7b170711b14003b48', N'69c0d7e407184b339b055215b3b719a5', N'50', N'50', N'2', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 11:32:30', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'97a7d2a2669a47b5a55565d906eef341', N'9dc0d8aceb9046559f0fcd3acfd4fb8d', N'目录', N'1', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:47:01', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:38:23', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'a94650c480914ad69f4820b01086a8be', N'7a4ed165f128484787a119179b7c18fd', N'SpringBean', N'1', N'1', N'SpringBean', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-08-20 15:00:31', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-08-24 12:36:33', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'aa6aeaf0fcaa42098f039b5e15494ebb', N'0bf0a5f4378748c1b6b759aea7da9c72', N'其他', N'other', N'6', N'其他', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:55:59', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'b568561ffaa5459e8c79fd71d58eede2', N'0bf0a5f4378748c1b6b759aea7da9c72', N'导入', N'import', N'8', N'导入', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:56:44', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'b9e6addb28b8487299413f5346bb621f', N'69c0d7e407184b339b055215b3b719a5', N'150', N'150', N'4', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 15:18:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 15:29:22', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'bbaa5726c9dd4e33bd9aa8b6003ec6e0', N'69c0d7e407184b339b055215b3b719a5', N'100', N'100', N'3', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 11:33:15', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'de1ad2226ae04bb98f6db78ff9e7fee0', N'd8fd027d0743468c828d7d068239d483', N'失败', N'-1', N'1', N'失败', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-28 13:15:39', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e64158128fd1400fb9f834c7a96a1046', N'd8fd027d0743468c828d7d068239d483', N'退出', N'0', N'0', N'退出', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-28 13:15:54', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e76f306325a0675d51f1dc25359a568e', N'e4ed989ab589d1be4b708bd285c24f1e', N'自定义', N'5', N'5', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:36:04', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:36:18', N'0')
GO

INSERT INTO [dbo].[sys_dict] ([id], [gid], [label], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e7a5f8f4fbb94cc2a3db0487340cccb4', N'1044ab256fd2468289c6f876905ff8aa', N'否', N'false', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:41:31', NULL, NULL, N'0')
GO


-- ----------------------------
-- Table structure for sys_dict_group
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_dict_group]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_dict_group]
GO

CREATE TABLE [dbo].[sys_dict_group] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [code] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_dict_group] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_group',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分组名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_group',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分组编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_group',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_group',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典分组',
'SCHEMA', N'dbo',
'TABLE', N'sys_dict_group'
GO


-- ----------------------------
-- Records of sys_dict_group
-- ----------------------------
INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'0bf0a5f4378748c1b6b759aea7da9c72', N'日志类型', N'logType', N'日志类型', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-30 23:54:01', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'1044ab256fd2468289c6f876905ff8aa', N'是否', N'sf_bool', N'是否', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:41:17', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40281e815ced1f27015ced2be5330003', N'性别', N'sex', N'性别', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85a20b609015a20c3f7bf0002', N'是否', N'sf', N'是否', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85bf1549e015bf17370ff0000', N'用户登陆状态', N'onlinestatus', N'', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40288ab85c8593cd015c859b1fcf0010', N'短信业务类型', N'businesstype', N'短信业务类型', NULL, NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'69c0d7e407184b339b055215b3b719a5', N'分页数组', N'page', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 11:31:44', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 14:13:28', N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'7a4ed165f128484787a119179b7c18fd', N'任务加载方式', N'loadway', N'任务加载方式', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-08-20 15:00:01', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-08-27 16:46:02', N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9dc0d8aceb9046559f0fcd3acfd4fb8d', N'菜单类型', N'menutype', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 14:46:50', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:42:07', N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9f28ef405c63412f9ef6524edb4adc68', N'执行策略', N'misfirePolicy', N'执行策略', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-17 15:37:42', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd8fd027d0743468c828d7d068239d483', N'登陆状态', N'loginstatus', N'登陆状态', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-09-28 13:15:00', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_dict_group] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e4ed989ab589d1be4b708bd285c24f1e', N'数据权限类型', N'dataRuleType', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:32:40', NULL, NULL, N'0')
GO


-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_login_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_login_log]
GO

CREATE TABLE [dbo].[sys_login_log] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [login_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [login_ip] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [login_location] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [browser] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [os] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nchar(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [msg] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [login_time] datetime2(0)  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT ('00000000') NOT NULL
)
GO

ALTER TABLE [dbo].[sys_login_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'访问ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录账号',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'login_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录IP地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'login_ip'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录地点',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'login_location'
GO

EXEC sp_addextendedproperty
'MS_Description', N'浏览器类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'browser'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作系统',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'os'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录状态（0成功 1失败）',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提示消息',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'msg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'访问时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'login_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统访问记录',
'SCHEMA', N'dbo',
'TABLE', N'sys_login_log'
GO


-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'003c00f2b7e4d772213b8ebc0defbb08', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:37:40', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0208c98df6c5f0f9ff460b3c4178ccdb', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:28:36', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'03f0fba903163357d335df6758bfb0bf', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:02:20', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0546af78918da1447541f4ad210b442c', N'zhangsanfeng', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:57:43', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'068ba3fee4bd6b7c11c74d558ec998ed', N'test', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:30:40', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0a5f226dcf10b08fb5bca240dafdc203', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:18:44', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0b7e9bdc19d98bdd3826e9e6c608b53e', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:24:58', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0d3e113f30f46212a8907f729d70f7f4', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-22 23:53:48', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0e6bf92ebb35f3ae60ded7c3aa6804fe', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:25:44', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0f0ff3f7e3f956d2f9f12a0f194d7588', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:15:39', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'0f6e871a58055194d93eddef105ae542', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:23:05', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'11b4828078dc50c110a1336e816c7efc', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 14:28:54', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'1402760e1c151e138dfaaeb5b34cc7c2', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:21:25', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'161c390f3c585c61bf5b4271f1720fbd', N'lisi', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'0 ', N'退出成功', N'2020-07-18 10:57:36', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'163ff2f8a8a4075535b59d6722740ad2', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:36:33', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'1a87eeac765ab5120e542aa2fbc0123b', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:42:49', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'1b4aaa8cd3352252bbafcf65cef4a2ab', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:30:48', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'1ba2450c18d4933577b4798c192b8081', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:16:15', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'1c1281c5374fa39579ba5330b2dda49c', N'zhangsan', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:51:30', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'1d9eb3702c5743daad1350036cf406eb', N'zhangsansan', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-18 10:52:41', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'26c615f0c0b74e600a3810396f314d1f', N'admin', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'0 ', N'退出成功', N'2020-07-18 10:51:25', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'2791181a5da9a8be8fda05dfec177267', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:16:09', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'27c5daebe29b257ae379dcd56f35c921', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:14:02', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'2f232c2eb88f8685c26196c12a2124b1', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:12:54', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'3024d8b9427de777c629c2074f1fa68c', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:37:35', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'384855f918fb60a8439275551336993f', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:46:58', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'38e69c8baf61aa208a0fdd295631effa', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:24:31', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'3e277346b15234b972f0899e1fe5b09f', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:28:25', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'46380e8ee6ea47c641d22f839cd44a9f', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:35:08', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'49be1686963bed49132a277aca994af3', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:42:57', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'4a310479512d71465b58fe3fc90a40aa', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:37:11', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'4d7be03c9ea0a77c18c1c53191e72645', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:23:59', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'5316f0e06f29bcdfc4045e1fbd277185', N'lisi', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:56:20', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'559fb587579ee4c87fe3ba9317138300', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:25:08', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'6023932f31fd7d5e8b464835128197f5', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:13:25', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'6521520bff23bd954df57e0a91ddb95b', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:18:54', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'673f39063e990f7c9c3d726e5d83fd22', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:23:18', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'6ce3463d4ef2006a8a464dd3a19bfd6c', N'admin', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:19:21', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'6f775db10df886c2cc388c039cc5688b', N'admin', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:24:07', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'71610f57b6d40cf42abd5f8f36e00492', N'baize', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:20:38', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'75f7573cba1ce4ceb8ccb6dde54d6139', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:28:28', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'7640b799fb408ea94eebdd473351875d', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:37:48', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'77819addd4a5141acdc7ccac93cfa6b0', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:37:50', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'79aee6574772c9da2a86590b268e76b5', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:25:14', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'7ae1704ee046231e228e78c247a677b1', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:24:47', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'7bbe0f42ed4412942dd62e3376b1908f', N'admin', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:30:06', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'808ad3d8f7da51f39c260f47319c0c19', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:29:10', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'845eb8b443d0612e38595fab92ebb61f', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:28:20', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'85cdcbfdd216fbc74e19a38d06197af6', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:36:52', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'872e2ac8ad4b9e67a6bd8bacbd02dfae', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:38:01', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'8fd29896f965dd33be10e5e254b0446d', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:13:00', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'90e1b86fdcd3cc84f35c9121a7e2030e', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:21:15', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'933587baa6d26275701e463fcb42b992', N'lisixu', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'0 ', N'退出成功', N'2020-07-18 10:58:48', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'9340390f367f0458475e201173a1e5b6', N'zhangsan', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'0 ', N'退出成功', N'2020-07-18 10:52:35', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'93d895ce0ddb875fbd8bd08dbcf87dcb', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 14:28:48', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'947731655ccab790d05a561e484549ef', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:18:32', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'976d317a1deaf0af9e0b69f8b7c41d08', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:17:49', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'97ebf179fd0159f48d7b25dcdf550654', N'dihong', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:30:05', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'983eb6225413646e6b88219b06f864cb', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:36:45', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'998b1b593c6dd47370fa9d9dac25aac5', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:37:56', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'9c476e1f39457ec95894f05df461d632', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:37:19', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'a5b41dd583ec05aae2b4103fd170a544', N'zhangsan', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'0 ', N'退出成功', N'2020-07-18 10:56:14', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'ab47cb1f64c1135a0e29ef1dd32f3b37', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:17:35', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'ac590bc1d9c24e25527282b0964973cc', N'dihong', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:21:08', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'af933025087a1bec2f440a5bee571e39', N'admin', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:24:03', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'b00b756be4c228ecd481e6b550ed25f6', N'admin', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:58:50', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'b07df525a59678c84da3a23d78125854', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:36:55', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'b61a9317a42d2668868b7ad49655ca34', N'test', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 14:30:37', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'c2105ebe6287f0c66bd5aa11bf2a3a1b', N'xiyounet', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:21:20', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'c275a093ffc00f3f91121d62314896b2', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:28:39', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'c333dac473aa2f75247ca4f0de8089a4', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:37:34', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'c44fd56fd821eebe1983430ee283328d', N'lisixu', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:58:34', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'c48d4fd3350a1359529c0a91926e98d8', N'baize', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:20:27', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'c60cf2709e0db6e64f888c515a03f2a9', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:13:13', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'cb9752de737167f956904c48f947a900', N'dihong', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:20:09', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'cbf2747df854cbe583f3bfd128473cab', N'zhangsan', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:52:53', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'cc9f40f2a27062d32172a469e8cabbf5', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:25:36', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'cf137c5de560d5f41d90a3b0e975ac95', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:37:42', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'd0a415f6882df8878377822d4bf6b694', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:37:14', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'd149a147a49fe806b7e4a7984b8d8dc8', N'dihong', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:54:46', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'd2d3e041181ab537decc76f2793c6277', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:36:36', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'd389de89276b10daaa1af69251609493', N'dihong', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:21:04', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'd812a96bfff9ef398434a10891da32be', N'dihong', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:49:33', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'daf3c67502a1f5bd037a607c7c5bf8cc', N'admin', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-18 10:50:25', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'e34473d6034b81fbd9148e4b72b5e886', N'dihong', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:43:00', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'e6fe8d8c2600d8906e69983e7a99e124', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:10:36', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'e75f9902ddf6f8dcdff2933bfcb1b31e', N'zhangsanfeng', N'127.0.0.1', N'', N'Firefox 7', N'Windows 10', N'0 ', N'退出成功', N'2020-07-18 10:58:30', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'ecb45b377a0962053231f84f0597c794', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 12:15:28', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'f03fc9e1ff53673698daf63aa9c77ac1', N'admin', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:30:33', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'f1d78b92a95f47826988b59fa7248130', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:31:08', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'f7a34de2df1e24f9488f89ba741d5166', N'jiuzhoutech', N'127.0.0.1', N'', N'Chrome', N'Windows 10', N'-1', N'用户名或密码错误', N'2020-07-21 12:24:20', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'f82c54d7ec46fe26522db708c05def23', N'xiyounet', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'0 ', N'退出成功', N'2020-07-21 14:37:28', N'00000000')
GO

INSERT INTO [dbo].[sys_login_log] ([id], [login_name], [login_ip], [login_location], [browser], [os], [status], [msg], [login_time], [tenant_id]) VALUES (N'fa2d006a1c36038b4fd2810096ddde52', N'admin', N'127.0.0.1', N'', N'Chrome 8', N'Windows 10', N'1 ', N'登陆成功', N'2020-07-21 12:36:30', N'00000000')
GO


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_menu]
GO

CREATE TABLE [dbo].[sys_menu] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [permission] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [path] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [url] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [parent_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [parent_ids] nvarchar(1000) COLLATE Chinese_PRC_CI_AS  NULL,
  [enabled] tinyint  NULL,
  [sort] int  NULL,
  [icon] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [redirect] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [cacheable] tinyint  NULL,
  [require_auth] tinyint  NULL,
  [component] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_menu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'权限ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'permission'
GO

EXEC sp_addextendedproperty
'MS_Description', N'资源路径',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单类型',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'路径编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'path'
GO

EXEC sp_addextendedproperty
'MS_Description', N'访问路由',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'url'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父编号列表',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'parent_ids'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否显示',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'enabled'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图标',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'icon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'跳转URL',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'redirect'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否缓存',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'cacheable'
GO

EXEC sp_addextendedproperty
'MS_Description', N'前端资源路径',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'component'
GO

EXEC sp_addextendedproperty
'MS_Description', N'摘要',
'SCHEMA', N'dbo',
'TABLE', N'sys_menu',
'COLUMN', N'remarks'
GO


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'008c004de43a4ebab36deb9b9a11a790', N'oss:attachment:update', N'更新', N'3', NULL, NULL, N'203aacd2a474445d8d4fb22199a7fe40', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:45:43', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'0b73fc6442d3484ebfcc0e945916a38c', N'sms:sendlog:delete', N'删除', N'3', NULL, NULL, N'5a7fb16c87f745dfb3185be1e65673a5', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:52:00', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'0ce52312cd294c5a95ffec7e7abe0ef1', N'sys:role:update', N'更新', N'3', NULL, NULL, N'f3938743bdab4c64bfa99c5c9e5341e1', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:52:50', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'10dbd0f844d04bbcbc394dcdd6b9f258', N'test:treetable:treetable:delete', N'删除', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'3', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:26', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'1307a3dd0f934efba63b2ba4b04ffd08', N'test:expandtable:expandtable:detail', N'详情', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'6', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:20:05', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'13dbeacf57934abe970497ed34ea6e59', N'monitor:login:log:list', N'查询', N'3', NULL, NULL, N'48663b3b2eb5457e8a79a6a105b8fb69', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:46:46', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'153c8847203a4df5bd8ff08e20fb6e3b', N'sys:datarule:detail', N'详情', N'3', NULL, NULL, N'9f8897e23c5b4c4e924ec983404834a6', N'a2da339ab8014bb1a0600bd20149bbbd/9f8897e23c5b4c4e924ec983404834a6/', N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 03:25:16', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'1c41720eeea94e59aeb2ea84b2cd3b00', N'sys:datarule:delete', N'删除', N'3', NULL, NULL, N'9f8897e23c5b4c4e924ec983404834a6', N'a2da339ab8014bb1a0600bd20149bbbd/9f8897e23c5b4c4e924ec983404834a6/', N'1', N'5', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 03:25:16', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'1c6cfbfc836f4c588375458bb0968c12', N'test:twotable:carmodel:export', N'汽车型号导出', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'4', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:50:24', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'1e46d1cc27f248fb880cc887639e2e4e', N'sys:user:export', N'导出', N'3', NULL, NULL, N'bedb1eeccf294d98ba2f636365d01928', NULL, N'1', N'4', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:45:14', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'1fa22fa16d6140ffbddb5747e33e7205', N'sms:template:delete', N'删除', N'3', NULL, NULL, N'5534c207669f4ba3af912622a8b5fee6', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:51:09', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'203aacd2a474445d8d4fb22199a7fe40', NULL, N'附件日志', N'2', N'/monitor/attachment', N'', N'4cfdb4c51e144a34957e2a2ceca7fae9', N'4cfdb4c51e144a34957e2a2ceca7fae9/', N'1', N'0', N'', NULL, N'1', N'1', N'views/monitor/attachment/index', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:23:20', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:48:40', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'21c83bb40edd4a9e95a2392f4ed8394a', N'test:expandtable:expandtable:update', N'更新', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'2', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 13:21:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'247c9f811073431da881a8f90972e1c8', N'', N'树形表格', N'2', N'/demo/treeTable', N'', N'abe099fdb4144a88b6635eea23d0bd01', N'abe099fdb4144a88b6635eea23d0bd01/', N'1', N'3', N'', NULL, N'1', N'1', N'views/demo/treeTable/treeTableList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-23 13:17:20', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:52:21', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'26ab0c0a2cff4bf49079bc6ee3462f27', NULL, N'表格级联', N'2', N'/demo/twoTable', N'', N'abe099fdb4144a88b6635eea23d0bd01', N'abe099fdb4144a88b6635eea23d0bd01/', N'1', N'2', N'', NULL, N'1', N'1', N'views/demo/twoTable/twoTable', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-23 13:21:24', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:52:13', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'27b5cf637a964a4a97b716739056c8e4', N'sys:tenant:list', N'列表', N'3', NULL, NULL, N'9de6b62cb95e483c8e57392213a87f77', N'a2da339ab8014bb1a0600bd20149bbbd/9de6b62cb95e483c8e57392213a87f77/', N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-28 06:30:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'2821d2f3dc5042459a4b975e1cba929a', NULL, N'源码更新', N'2', N'https://gitee.com/sunseagear/wind', N'', N'3f4c3063841641319d95412352db5a35', N'3f4c3063841641319d95412352db5a35/', N'1', N'0', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:08:00', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 18:25:25', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'2954fb967419410fb281857ec86db428', N'task:schedule:job:add', N'添加', N'3', NULL, NULL, N'38edc1e2843d411b99a05b721a2f778a', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:48:05', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'2eef0abf5d414d9589576c30b8202dcd', N'task:schedule:job:list', N'查询', N'3', NULL, NULL, N'38edc1e2843d411b99a05b721a2f778a', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:48:05', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3135bcb72d324ac8aad4a42823545570', N'test:expandtable:expandtable:delete', N'删除', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'3', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 13:21:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'35850e938efe413f9ddcc7821225266b', N'oss:attachment:list', N'查询', N'3', NULL, NULL, N'203aacd2a474445d8d4fb22199a7fe40', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:45:43', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'35af237befdb46b097070599470c8eed', N'sys:dict:add', N'添加', N'3', NULL, NULL, N'6dd8f9cceaf04ce5959e961a59ab91fc', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:28', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3864b314549e4a9cb9e540fba21852a3', N'test:table:table:import', N'导入', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'5', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'38edc1e2843d411b99a05b721a2f778a', NULL, N'计划任务', N'2', N'/tool/task', N'', N'88b25c355bdc4a7b8b8bfdb307918eb5', N'88b25c355bdc4a7b8b8bfdb307918eb5/', N'1', N'1', N'', NULL, N'1', N'1', N'views/tool/task/index', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:03:13', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:49:40', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'39883d8ee458426d8890dbc0a61dc3ac', N'test:table:table:update', N'更新', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'2', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3b980e49ec4d4d208eec8f4dd433ca6c', N'sys:menu:update', N'更新', N'3', NULL, NULL, N'64a6cd14e86f434db5bc6bd3f947398f', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3eaf2534601a4eac9cda4b17c333eee3', N'test:treeandtable:treeandtable', N'左树右表', N'2', N'/demo/treeAndTable', N'', N'abe099fdb4144a88b6635eea23d0bd01', N'abe099fdb4144a88b6635eea23d0bd01/', N'1', N'4', N'', NULL, N'1', N'1', N'views/demo/treeAndTable/treeAndTableList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-23 13:20:39', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-13 16:36:25', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'3f4c3063841641319d95412352db5a35', NULL, N'系统帮助', N'1', N'', N'', NULL, NULL, N'1', N'70', N'fas fa-question-circle', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:05:04', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:53:05', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'40a71f551a18416a850063d42250e09f', N'sys:organization:list', N'查询', N'3', NULL, NULL, N'8402e9bc967144d0988386a54c912548', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:03:07', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'41141cd290874c76968cee0ac9932f67', N'sys:tenant:detail', N'详情', N'3', NULL, NULL, N'9de6b62cb95e483c8e57392213a87f77', N'a2da339ab8014bb1a0600bd20149bbbd/9de6b62cb95e483c8e57392213a87f77/', N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-28 06:30:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'41529f653db84afaaf9ef4b16845842e', N'sys:user:list', N'查询', N'3', NULL, NULL, N'bedb1eeccf294d98ba2f636365d01928', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:45:14', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'41b543b75bcc4feca88f8b2e34c8c8c4', N'test:twotable:car:detail', N'详情', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'14', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:01', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:35', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'42cba67a7200910918ed3d6b2cf897e3', NULL, N'网络通信', N'2', N'/demo/websocket', N'', N'abe099fdb4144a88b6635eea23d0bd01', N'abe099fdb4144a88b6635eea23d0bd01/', N'1', N'6', N'', NULL, N'1', N'1', N'views/demo/websocket/websocket', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-23 23:15:29', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-23 23:17:36', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4548f01cbbf0427e8bb47243d4a546e9', N'sys:dict:delete', N'删除', N'3', NULL, NULL, N'6dd8f9cceaf04ce5959e961a59ab91fc', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:28', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'467202a879c0455d948185ad52ee871b', N'sys:config:update', N'更新', N'3', NULL, NULL, N'ea3bf0ab4bd042e0be6416680f66e19c', NULL, N'1', N'1', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-23 16:43:32', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'46ddbbabf30445e3a75ff2294e06ec50', N'test:treetable:treetable:detail', N'详情', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'10', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:54', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'48663b3b2eb5457e8a79a6a105b8fb69', NULL, N'登陆日志', N'2', N'/monitor/loginLog', N'', N'4cfdb4c51e144a34957e2a2ceca7fae9', N'4cfdb4c51e144a34957e2a2ceca7fae9/', N'1', N'1', N'', NULL, N'1', N'1', N'views/monitor/log/login', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:24:25', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:48:48', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4870363dbd084cdc99840732a26d9c4a', N'test:twotable:car:import', N'导入', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'12', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 23:03:51', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:32', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'498016d4913446deb6415785befd3480', N'sys:dict:group:delete', N'删除分组', N'3', N'', N'', N'6dd8f9cceaf04ce5959e961a59ab91fc', N'a2da339ab8014bb1a0600bd20149bbbd/6dd8f9cceaf04ce5959e961a59ab91fc/', N'1', N'0', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:41:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'49e01ae88046460484d262d47fa30719', N'sys:dict:list', N'查询', N'3', NULL, NULL, N'6dd8f9cceaf04ce5959e961a59ab91fc', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:28', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4b96d6bd8bf542ca888cdb64b1006c69', N'task:schedule:job:refresh:job', N'刷新任务', N'3', N'', N'', N'38edc1e2843d411b99a05b721a2f778a', N'88b25c355bdc4a7b8b8bfdb307918eb5/38edc1e2843d411b99a05b721a2f778a/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'刷新任务', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:55:19', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4cfdb4c51e144a34957e2a2ceca7fae9', NULL, N'系统监控', N'1', N'', N'', NULL, NULL, N'1', N'40', N'fas fa-chart-line', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:13:37', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:49:28', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4d559f775fb94b20b87c22c6643b3180', N'sys:dict:group:list', N'查询分组', N'3', N'', N'', N'6dd8f9cceaf04ce5959e961a59ab91fc', N'a2da339ab8014bb1a0600bd20149bbbd/6dd8f9cceaf04ce5959e961a59ab91fc/', N'1', N'0', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:39:48', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:41:20', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4de1c247dc8d4adfa48beb27e4e5696d', N'sys:menu:generate:button', N'生成按钮', N'3', N'', N'', N'64a6cd14e86f434db5bc6bd3f947398f', N'a2da339ab8014bb1a0600bd20149bbbd/64a6cd14e86f434db5bc6bd3f947398f/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'备注', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:01:31', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:01:52', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'4ee35f7f1db2420e82f8ce6833ba885e', N'sys:datarule:list', N'列表', N'3', NULL, NULL, N'9f8897e23c5b4c4e924ec983404834a6', N'a2da339ab8014bb1a0600bd20149bbbd/9f8897e23c5b4c4e924ec983404834a6/', N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 03:25:16', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'50e2814c16ac4bef821cb0af6bea1e2b', N'test:expandtable:expandtable:list', N'查询', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'0', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 13:21:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'5534c207669f4ba3af912622a8b5fee6', NULL, N'短信模板', N'2', N'/sms/template', N'', N'699fbeee7c914b619485f259f83a2e6d', N'699fbeee7c914b619485f259f83a2e6d/', N'1', N'0', N'', NULL, N'1', N'1', N'views/sms/template/index', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:50:14', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:46:54', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'55c0e037734a4f4d803e881cd7204692', N'sys:config:detail', N'详情', N'3', NULL, NULL, N'ea3bf0ab4bd042e0be6416680f66e19c', N'a2da339ab8014bb1a0600bd20149bbbd/ea3bf0ab4bd042e0be6416680f66e19c/', N'1', N'0', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-23 16:43:32', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-16 04:12:19', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'56e87bb7ee424e6999b27cb2a4cbc96d', N'test:expandtable:expandtable:import', N'导入', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'5', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 13:21:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'57b666b69b554c8d80da32b0141776af', N'test:treetable:treetable:add', N'添加', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'1', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:26', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'5a7fb16c87f745dfb3185be1e65673a5', NULL, N'发送日志', N'2', N'/sms/sendlog', N'', N'699fbeee7c914b619485f259f83a2e6d', N'699fbeee7c914b619485f259f83a2e6d/', N'1', N'1', N'', NULL, N'1', N'1', N'views/sms/send/log', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:50:47', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:47:06', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'5a92b11ad8434ff68b588767417c6b58', N'sys:datarule:add', N'添加', N'3', NULL, NULL, N'9f8897e23c5b4c4e924ec983404834a6', N'a2da339ab8014bb1a0600bd20149bbbd/9f8897e23c5b4c4e924ec983404834a6/', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 03:25:16', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'5b85cfebd56141d1a100102727395556', N'test:treeandtable:treeandtable:import', N'导入', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'5', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-03 01:33:11', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'608629d6bfa7461f9ca258a4393523a1', N'sys:user:add', N'添加', N'3', NULL, NULL, N'bedb1eeccf294d98ba2f636365d01928', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:45:14', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'64a6cd14e86f434db5bc6bd3f947398f', NULL, N'菜单管理', N'2', N'/sys/menu', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'30', N'', NULL, N'1', N'1', N'views/sys/menu/menuList', N'菜单管理', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 15:12:53', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:16:55', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'650fa5a8ccd04deeb656321311410606', N'monitor:operation:log:list', N'查询', N'3', NULL, NULL, N'fdb08c18a73648ddb77d2558167a764a', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:47:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'653c7b79ebdf4054b3a7233ad6168d49', NULL, N'在线用户', N'2', N'/monitor/onlineUser', N'', N'4cfdb4c51e144a34957e2a2ceca7fae9', N'4cfdb4c51e144a34957e2a2ceca7fae9/', N'1', N'3', N'', NULL, N'1', N'1', N'views/monitor/user/online', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:24:02', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:49:11', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'6869b6f955594ab2a8d10b0b130120b4', N'test:twotable:carmodel:add', N'汽车型号添加', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'1', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:48:07', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'69039de89fb94c54be70543475b995ad', N'test:twotable:car:delete', N'删除', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'10', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 23:03:51', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:28', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'699fbeee7c914b619485f259f83a2e6d', NULL, N'短信管理', N'1', N'', N'', NULL, NULL, N'1', N'20', N'fas fa-sms', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:49:28', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-09-09 21:07:24', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'6c46f6d5f6cd4cc094cc295737c3ace6', N'test:table:table:export', N'导出', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'4', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'6dd8f9cceaf04ce5959e961a59ab91fc', N'', N'字典管理', N'2', N'/sys/dict', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'60', N'', NULL, N'1', N'1', N'views/sys/dict/index', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 15:12:18', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:17:14', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'6e36c83436e34bfbb316058453e3205f', N'task:schedule:job:update', N'更新', N'3', NULL, NULL, N'38edc1e2843d411b99a05b721a2f778a', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:48:05', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'70466fa5271d45dc99cccea0027c3dc2', N'sys:tenant:update', N'更新', N'3', NULL, NULL, N'9de6b62cb95e483c8e57392213a87f77', N'a2da339ab8014bb1a0600bd20149bbbd/9de6b62cb95e483c8e57392213a87f77/', N'1', N'4', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-28 06:30:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'7230458979a149d48ff88544ce985809', N'monitor:operation:log:delete', N'删除', N'3', NULL, NULL, N'fdb08c18a73648ddb77d2558167a764a', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:47:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'760dd42695984c15a0db3f1e4ed0a4af', N'test:table:table:delete', N'删除', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'3', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'76fd71b67d784ed9bd02e320a387e834', N'', N'邮件管理', N'1', N'', N'', NULL, NULL, N'1', N'30', N'fas fa-mail-bulk', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:22:57', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:48:16', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'779d64b7717c4f3a99fc96ed7ccd075d', N'sms:template:list', N'查询', N'3', NULL, NULL, N'5534c207669f4ba3af912622a8b5fee6', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:51:09', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'7811944f996a441e9b3a761b18cb88bf', N'test:treetable:treetable:update', N'更新', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'6', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'79059d522a11459394c23c6f29092c41', N'sys:organization:add', N'添加', N'3', NULL, NULL, N'8402e9bc967144d0988386a54c912548', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:03:07', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'8386bfdcf52547c1a091e71873eedfdf', NULL, N'任务日志', N'2', N'/tool/tasklog', N'', N'88b25c355bdc4a7b8b8bfdb307918eb5', N'88b25c355bdc4a7b8b8bfdb307918eb5/', N'1', N'2', N'', NULL, N'1', N'1', N'views/tool/task/log', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:03:34', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:49:51', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'83aea54a484b4bc8a19259352badaceb', N'sys:user:update', N'更新', N'3', NULL, NULL, N'bedb1eeccf294d98ba2f636365d01928', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:45:14', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'83da63a6359e494cbbaffa678274ec19', N'sys:user:change:password', N'修改密码', N'3', N'', N'', N'bedb1eeccf294d98ba2f636365d01928', N'a2da339ab8014bb1a0600bd20149bbbd/bedb1eeccf294d98ba2f636365d01928/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'修改密码', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 15:02:30', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 15:03:03', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'8402e9bc967144d0988386a54c912548', NULL, N'组织机构', N'2', N'/sys/organization', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'50', N'', NULL, N'1', N'1', N'views/sys/organization/organizationList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 15:09:52', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:17:06', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'86d49f3cd426463080e0ac13bdfbc28d', N'sys:organization:delete', N'删除', N'3', NULL, NULL, N'8402e9bc967144d0988386a54c912548', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:03:07', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'86f65f1677184cc5b92201bbb63618d7', NULL, N'发送日志', N'2', N'/email/sendlog', N'', N'76fd71b67d784ed9bd02e320a387e834', N'76fd71b67d784ed9bd02e320a387e834/', N'1', N'1', N'', NULL, N'1', N'1', N'views/email/send/log', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:24:04', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:48:06', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'86fcadeb0950427b8a4819a4229bbd74', N'test:treetable:treetable:delete', N'删除', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'9', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'87c10320fb46431e8e2900d45d9f6dad', N'task:schedule:job:change:job:status', N'变更状态', N'3', N'', N'', N'38edc1e2843d411b99a05b721a2f778a', N'88b25c355bdc4a7b8b8bfdb307918eb5/38edc1e2843d411b99a05b721a2f778a/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'变更状态', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 13:00:19', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'88b25c355bdc4a7b8b8bfdb307918eb5', NULL, N'定时任务', N'1', N'', N'', NULL, NULL, N'1', N'60', N'fas fa-clock', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:02:41', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:50:12', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'8a13a95a71b948208d31acb590112440', N'sys:menu:add', N'添加', N'3', NULL, NULL, N'64a6cd14e86f434db5bc6bd3f947398f', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'8b226abad44047b6aa2a164b441a3815', N'test:expandtable:expandtable:add', N'添加', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'1', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 13:21:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'91b33be150b3416d82ba38128590c507', N'monitor:login:log:export', N'导出', N'3', N'', N'', N'48663b3b2eb5457e8a79a6a105b8fb69', N'4cfdb4c51e144a34957e2a2ceca7fae9/48663b3b2eb5457e8a79a6a105b8fb69/', N'1', N'0', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 14:07:10', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 14:07:26', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'91fccb99710f4f2e97567653a8ef14d6', N'task:schedule:joblog:list', N'查询', N'3', NULL, NULL, N'8386bfdcf52547c1a091e71873eedfdf', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:48:25', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'93669750fdad4979b658408e13675b30', N'sys:dict:group:add', N'添加分组', N'3', N'', N'', N'6dd8f9cceaf04ce5959e961a59ab91fc', N'a2da339ab8014bb1a0600bd20149bbbd/6dd8f9cceaf04ce5959e961a59ab91fc/', N'1', N'0', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:39:23', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:41:27', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'936b2acedf194ed3bfc403acc4c5aa71', N'test:twotable:car:list', N'查询', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'7', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 23:03:51', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:18', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9406154d48144fe0971880bb9d79f3a8', N'sys:tenant:delete', N'删除', N'3', NULL, NULL, N'9de6b62cb95e483c8e57392213a87f77', N'a2da339ab8014bb1a0600bd20149bbbd/9de6b62cb95e483c8e57392213a87f77/', N'1', N'5', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-28 06:30:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'97194b12b19248c79336a634a0ed9ac3', N'task:schedule:joblog:delete', N'删除', N'3', NULL, NULL, N'8386bfdcf52547c1a091e71873eedfdf', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:48:25', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9a42181d7301459b935871b921e1a89a', N'test:treeandtable:treeandtable:add', N'添加', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'1', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-03 01:33:11', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9afdab469e1f4f3fab4b242a2d5679e9', N'test:treetable:treetable:list', N'查询', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'4', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9c44133cf8d14addbb4b024f3515f4df', N'task:schedule:job:delete', N'删除', N'3', NULL, NULL, N'38edc1e2843d411b99a05b721a2f778a', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:48:05', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9c59bd5de46b48a4911047bf3307ebbc', N'test:treeandtable:treeandtable:update', N'更新', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'2', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-03 01:33:11', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9de6b62cb95e483c8e57392213a87f77', N'sys:tenant:list', N'租户管理', N'2', N'/sys/tenant', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'0', NULL, NULL, N'1', N'1', N'views/sys/tenant/tenantList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-28 06:30:20', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-04 08:32:25', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9f4f6568e9a54623b52657bcc6a6f478', N'test:twotable:car:update', N'更新', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'9', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 23:03:51', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:26', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9f8897e23c5b4c4e924ec983404834a6', N'sys:datarule:list', N'数据权限', N'2', N'/sys/dataRule', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'40', NULL, NULL, N'1', N'1', N'views/sys/dataRule/dataRuleList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 03:25:16', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-04 09:06:43', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'9fbb210970df4024bfb1e9eaaa9de6ac', N'sys:menu:delete', N'删除', N'3', NULL, NULL, N'64a6cd14e86f434db5bc6bd3f947398f', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'a2da339ab8014bb1a0600bd20149bbbd', NULL, N'系统设置', N'1', N'', N'', NULL, NULL, N'1', N'10', N'fas fa-cog', NULL, N'1', N'1', N'', N'系统设置', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 15:08:45', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:17:37', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'a3bb826296174bb7b7bfdd0fcb2d33fc', N'sys:role:delete', N'删除', N'3', NULL, NULL, N'f3938743bdab4c64bfa99c5c9e5341e1', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:52:50', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'a9d4028655c945eba33546ff3df634e4', N'test:treeandtable:treeandtable:detail', N'详情', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'6', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:19:40', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'abc8dc302b1540f69f2a8c24a5612c2a', N'sms:template:update', N'更新', N'3', NULL, NULL, N'5534c207669f4ba3af912622a8b5fee6', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:51:09', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'abe099fdb4144a88b6635eea23d0bd01', NULL, N'代码样例', N'1', N'', N'', NULL, NULL, N'1', N'80', N'fas fa-code', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-23 10:56:31', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:51:46', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ac793681eab74d2d99e3e6d335a79826', NULL, N'表格展开', N'2', N'/demo/expendTable', N'', N'abe099fdb4144a88b6635eea23d0bd01', N'abe099fdb4144a88b6635eea23d0bd01/', N'1', N'5', N'', NULL, N'1', N'1', N'views/demo/expandTable/expandTableList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-23 13:24:13', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-13 14:56:40', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ae18e571ddd44dbaa0384f685b3e357a', NULL, N'开发文档', N'2', N'https://panjiachen.github.io/vue-element-admin-site/zh/', N'', N'3f4c3063841641319d95412352db5a35', N'3f4c3063841641319d95412352db5a35/', N'1', N'1', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:05:48', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 18:24:53', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'afa4277041cb454ab789b55d4b4b824a', N'test:twotable:car:add', N'添加', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'8', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 23:03:51', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:24', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'b0da410e900944aa84d3ad2a170ec006', N'sys:datarule:update', N'更新', N'3', NULL, NULL, N'9f8897e23c5b4c4e924ec983404834a6', N'a2da339ab8014bb1a0600bd20149bbbd/9f8897e23c5b4c4e924ec983404834a6/', N'1', N'4', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 03:25:16', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'b338552c1eee4313b1a21a880df97e81', N'sys:user:dddd', N'设置角色', N'3', N'', N'', N'bedb1eeccf294d98ba2f636365d01928', N'a2da339ab8014bb1a0600bd20149bbbd/bedb1eeccf294d98ba2f636365d01928/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'设置角色', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 15:02:55', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'b899735bed7744c2a27c5bf3c35a3e1e', N'test:treetable:treetable:export', N'导出', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'7', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'b8faa3f2cdc9499e814be30e218a88f5', N'test:table:table:add', N'添加', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'1', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ba46b8b6d27c4f0cabea1598d15cad27', N'test:twotable:carmodel:import', N'汽车型号导入', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'5', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:50:39', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'bb2e6d8d88cb4685a33a27823dd09a30', N'test:treeandtable:treeandtable:list', N'查询', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'0', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-03 01:33:11', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'bc3c57bb7d954de7a64956e6df718fe2', N'sys:dict:group:update', N'添加分组', N'3', N'', N'', N'6dd8f9cceaf04ce5959e961a59ab91fc', N'a2da339ab8014bb1a0600bd20149bbbd/6dd8f9cceaf04ce5959e961a59ab91fc/', N'1', N'0', N'', NULL, N'1', N'1', N'', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:39:04', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:41:37', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'be2ececee58e4f5ba7cf13ac35a51fbe', N'email:template:add', N'添加', N'3', NULL, NULL, N'd4272a1fac244950acc93dac7ac1c7cf', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:24:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'be85d873590d4a10b490bf9174c707df', N'oss:attachment:delete', N'删除', N'3', NULL, NULL, N'203aacd2a474445d8d4fb22199a7fe40', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:45:43', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'bedb1eeccf294d98ba2f636365d01928', NULL, N'用户管理', N'2', N'/sys/user', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'10', N'', NULL, N'1', N'1', N'views/sys/user/index', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 15:10:29', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:16:30', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c2fa9d559e744df9971f0321e218e125', N'sys:user:role:list', N'用户角色', N'3', N'', N'', N'f3938743bdab4c64bfa99c5c9e5341e1', N'a2da339ab8014bb1a0600bd20149bbbd/f3938743bdab4c64bfa99c5c9e5341e1/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'用户角色', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 15:03:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c5280ea2f36b44e192643c1cfd63918c', N'test:treeandtable:treeandtable:delete', N'删除', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'3', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-03 01:33:11', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c782a018e34947aeae172a1fc05506a6', N'sys:user:role:delete', N'删除用户角色', N'3', N'', N'', N'bedb1eeccf294d98ba2f636365d01928', N'a2da339ab8014bb1a0600bd20149bbbd/bedb1eeccf294d98ba2f636365d01928/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'删除用户角色', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 15:05:43', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c7f55a648f974247bec0dd0745be6492', N'test:treetable:treetable:import', N'导入', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'8', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c8dacf03f6f34c1dad41bc05f85cc9e9', N'sms:template:add', N'添加', N'3', NULL, NULL, N'5534c207669f4ba3af912622a8b5fee6', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:51:09', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c8fdf84fa0aa4372b930ba57d0277ab9', N'email:template:update', N'更新', N'3', NULL, NULL, N'd4272a1fac244950acc93dac7ac1c7cf', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:24:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c97c4ff1abc5436da415047d450fdb88', N'test:table:table:list', N'查询', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'0', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:12', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'cb6f769427554df58229b65ae6038544', N'monitor:login:log:delete', N'删除', N'3', NULL, NULL, N'48663b3b2eb5457e8a79a6a105b8fb69', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:46:46', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'cdf0fe2958434b40be1fff8145cba08b', N'sys:role:add', N'添加', N'3', NULL, NULL, N'f3938743bdab4c64bfa99c5c9e5341e1', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:52:50', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd1069347e4374ddaab932656e27a2772', N'sys:organization:update', N'更新', N'3', NULL, NULL, N'8402e9bc967144d0988386a54c912548', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:03:07', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd4272a1fac244950acc93dac7ac1c7cf', NULL, N'邮件模板', N'2', N'/email/template', N'', N'76fd71b67d784ed9bd02e320a387e834', N'76fd71b67d784ed9bd02e320a387e834/', N'1', N'0', N'', NULL, N'1', N'1', N'views/email/template/index', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:23:33', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:47:53', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd4bc391e2d6b4d619435da7c37021212', N'test:twotable:carmodel:list', N'汽车型号查询', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'0', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:47:58', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd4e076ece76e4c109c794ee354133ef3', N'sys:user:delete', N'删除', N'3', NULL, NULL, N'bedb1eeccf294d98ba2f636365d01928', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:45:14', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd50770e755564f15a32c2b798cdbb2de', N'test:expandtable:expandtable:export', N'导出', N'3', NULL, NULL, N'ac793681eab74d2d99e3e6d335a79826', NULL, N'1', N'4', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-04 13:21:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'd67f9a69cce040d0b28000e988a489c7', N'sys:menu:list', N'查询', N'3', NULL, NULL, N'64a6cd14e86f434db5bc6bd3f947398f', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:04', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'da7f94c7087b42359e34c703cd2ed30f', N'test:table:table:list', N'综合表格', N'2', N'/demo/table', N'', N'abe099fdb4144a88b6635eea23d0bd01', N'abe099fdb4144a88b6635eea23d0bd01/', N'1', N'1', N'', NULL, N'1', N'1', N'views/demo/table/tableList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-23 10:59:35', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-10 13:10:30', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'dce5ce1a87e3417692a8b1225d90d121', N'email:template:delete', N'删除', N'3', NULL, NULL, N'd4272a1fac244950acc93dac7ac1c7cf', NULL, N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:24:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'dd2b6238d3304fcf926b9e389175ad42', N'sys:tenant:add', N'添加', N'3', NULL, NULL, N'9de6b62cb95e483c8e57392213a87f77', N'a2da339ab8014bb1a0600bd20149bbbd/9de6b62cb95e483c8e57392213a87f77/', N'1', N'3', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-28 06:30:20', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'deca5f90b4a74a3ca243ee81a798801f', N'test:table:table:detail', N'详情', N'3', NULL, NULL, N'da7f94c7087b42359e34c703cd2ed30f', NULL, N'1', N'6', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-25 13:23:00', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'df07014114924135a875782fcaf40333', N'test:treetable:treetable:update', N'更新', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'2', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:26', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'df3307b6f9884a2ea9c4aa32ec0388fa', N'oss:attachment:add', N'添加', N'3', NULL, NULL, N'203aacd2a474445d8d4fb22199a7fe40', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 12:45:43', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e052e5772bb74b4b8791d79732677eb1', N'test:treeandtable:treeandtable:export', N'导出', N'3', NULL, NULL, N'3eaf2534601a4eac9cda4b17c333eee3', NULL, N'1', N'4', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-03 01:33:11', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e198425d45ba6b6e31a6db4b7763f716', N'sys:config:delete', N'删除', N'3', NULL, NULL, N'ea3bf0ab4bd042e0be6416680f66e19c', NULL, N'1', N'4', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-16 04:12:46', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e49f6dfe7973326a6ed21512ee42bae0', N'sys:config:add', N'添加', N'3', NULL, NULL, N'ea3bf0ab4bd042e0be6416680f66e19c', NULL, N'1', N'3', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-16 04:12:46', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e57d4c7de46d4a12911f1c0880608fdb', N'sys:role:list', N'查询', N'3', NULL, NULL, N'f3938743bdab4c64bfa99c5c9e5341e1', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:52:50', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e6d19f6b484e4fdb8b05ed34457fd594', N'monitor:user:online:list', N'查询', N'3', NULL, NULL, N'653c7b79ebdf4054b3a7233ad6168d49', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 12:59:22', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'e746144939314619827be86fbd3efe50', N'email:template:list', N'查询', N'3', NULL, NULL, N'd4272a1fac244950acc93dac7ac1c7cf', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:24:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ea3bf0ab4bd042e0be6416680f66e19c', NULL, N'系统参数', N'2', N'/sys/config', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'70', N'', NULL, N'1', N'1', N'views/sys/config/configList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-23 16:42:13', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:17:22', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'edf9c54876d8424b9ea7edb9b992a3a3', N'test:twotable:carmodel:delete', N'汽车型号删除', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'3', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:48:25', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ee8e03adf46f4377b03e4f81176b9640', N'test:twotable:carmodel:detail', N'汽车型号详情', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'6', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:17:05', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:17:27', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ef66722b109e4b44badded26ddc129ba', N'sys:user:role:add', N'添加用户角色', N'3', N'', N'', N'bedb1eeccf294d98ba2f636365d01928', N'a2da339ab8014bb1a0600bd20149bbbd/bedb1eeccf294d98ba2f636365d01928/', N'1', N'0', N'', NULL, N'1', N'1', N'', N'添加用户角色', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 15:04:38', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'ef68f37ced434f319797e3f26ef202d2', N'test:twotable:carmodel:update', N'汽车型号更新', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'2', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:36:46', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 22:48:16', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'efe69c7d51f140abbfc1c1e05975ecae', N'sms:sendlog:list', N'查询', N'3', NULL, NULL, N'5a7fb16c87f745dfb3185be1e65673a5', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:52:00', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'eff0c65a539846f59b2046b279833dae', N'test:treetable:treetable:list', N'查询', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'0', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:26', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f219d0b6f8144f0eab326b53f3323dd7', N'email:sendlog:delete', N'删除', N'3', NULL, NULL, N'86f65f1677184cc5b92201bbb63618d7', NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:25:07', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f38443b4da684b7d8e81614d8180021e', N'test:treetable:treetable:add', N'添加', N'3', NULL, NULL, N'247c9f811073431da881a8f90972e1c8', NULL, N'1', N'5', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 21:45:49', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f3938743bdab4c64bfa99c5c9e5341e1', NULL, N'角色管理', N'2', N'/sys/role', N'', N'a2da339ab8014bb1a0600bd20149bbbd', N'a2da339ab8014bb1a0600bd20149bbbd/', N'1', N'20', N'', NULL, N'1', N'1', N'views/sys/role/roleList', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-30 15:11:36', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-26 21:16:45', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f5ea5f1f8c1d4cf1abafd1f6c4efab69', N'test:twotable:car:export', N'导出', N'3', NULL, NULL, N'26ab0c0a2cff4bf49079bc6ee3462f27', N'abe099fdb4144a88b6635eea23d0bd01/26ab0c0a2cff4bf49079bc6ee3462f27/', N'1', N'11', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-24 23:03:51', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:18:30', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f6226a63129a4141adbe6805324dabdd', N'email:sendlog:list', N'查询', N'3', NULL, NULL, N'86f65f1677184cc5b92201bbb63618d7', NULL, N'1', N'0', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-09 10:25:07', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f9b2cdabb11d429884a5465e754c4e06', N'sys:dict:update', N'更新', N'3', NULL, NULL, N'6dd8f9cceaf04ce5959e961a59ab91fc', NULL, N'1', N'2', NULL, NULL, NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-11-06 11:53:28', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'fdb08c18a73648ddb77d2558167a764a', NULL, N'操作日志', N'2', N'/monitor/operationLog', N'', N'4cfdb4c51e144a34957e2a2ceca7fae9', N'4cfdb4c51e144a34957e2a2ceca7fae9/', N'1', N'2', N'', NULL, N'1', N'1', N'views/monitor/log/operation', NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:25:04', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-28 17:49:00', N'0')
GO

INSERT INTO [dbo].[sys_menu] ([id], [permission], [name], [type], [path], [url], [parent_id], [parent_ids], [enabled], [sort], [icon], [redirect], [cacheable], [require_auth], [component], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'fedca180ec4e9822d718026cd83817f4', N'sys:config:list', N'列表', N'3', NULL, NULL, N'ea3bf0ab4bd042e0be6416680f66e19c', NULL, N'1', N'2', NULL, NULL, N'1', N'1', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-16 04:12:46', NULL, NULL, N'0')
GO


-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_message]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_message]
GO

CREATE TABLE [dbo].[sys_message] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [is_read] tinyint  NULL,
  [read_uid] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [read_uname] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [read_date] datetime2(0)  NULL,
  [send_date] datetime2(0)  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_message] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版内容',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否阅读',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'is_read'
GO

EXEC sp_addextendedproperty
'MS_Description', N'阅读的用户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'read_uid'
GO

EXEC sp_addextendedproperty
'MS_Description', N'阅读的人',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'read_uname'
GO

EXEC sp_addextendedproperty
'MS_Description', N'阅读时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'read_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_message',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送消息',
'SCHEMA', N'dbo',
'TABLE', N'sys_message'
GO


-- ----------------------------
-- Records of sys_message
-- ----------------------------
INSERT INTO [dbo].[sys_message] ([id], [title], [content], [is_read], [read_uid], [read_uname], [read_date], [send_date], [tenant_id]) VALUES (N'34d90ff1d82c40c1b24d9598310d4174', N'回答了求解', N'<p><a href="/user/4028ea815a3d2a8c015a3d2f8d2a0002" target="_self" title="系统管理员"><cite>系统管理员</cite></a>回答了您的求解<a href="/posts/3c69b5d3676e42a5ba8adbf9a3133813/detail" target="_self" title="dasdadasd"><cite>dasdadasd</cite></a></p>', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'系统管理员', NULL, N'2018-09-21 17:12:24', N'00000000')
GO

INSERT INTO [dbo].[sys_message] ([id], [title], [content], [is_read], [read_uid], [read_uname], [read_date], [send_date], [tenant_id]) VALUES (N'3daf4c6501354c64bc54d5dae1cc8532', N'回答了求解', N'<p><a href="/user/703ab3b65dd940708d191a19fb64632c" target="_self" title="王存见"><cite>王存见</cite></a>回答了您的求解<a href="/posts/b27a9f2296b5490c92b86eceac13f692/detail" target="_self" title="标题标题标题标题标题标题标题标题标题标题"><cite>标题标题标题标题标题标题标题标题标题标题</cite></a></p>', N'0', N'703ab3b65dd940708d191a19fb64632c', N'王存见', NULL, N'2018-09-20 11:37:39', N'00000000')
GO

INSERT INTO [dbo].[sys_message] ([id], [title], [content], [is_read], [read_uid], [read_uname], [read_date], [send_date], [tenant_id]) VALUES (N'67185c781b0541ad975ed740df5fdfd7', N'回答了求解', N'<p><a href="/user/d7bdacb99d8746548c0882417ae3abbd" target="_self" title="白猫"><cite>白猫</cite></a>回答了您的求解<a href="/posts/b2dcc675fb5d48a88120c5900ff1a4fd/detail" target="_self" title="测试一个标题哈哈哈哈"><cite>测试一个标题哈哈哈哈</cite></a></p>', N'1', N'd7bdacb99d8746548c0882417ae3abbd', N'白猫', NULL, N'2018-09-13 13:42:47', N'00000000')
GO

INSERT INTO [dbo].[sys_message] ([id], [title], [content], [is_read], [read_uid], [read_uname], [read_date], [send_date], [tenant_id]) VALUES (N'7730bb741c9341c2869dfaaf70665c06', N'回答了求解', N'<p><a href="/user/d7bdacb99d8746548c0882417ae3abbd" target="_self" title="白猫"><cite>白猫</cite></a>回答了您的求解<a href="/posts/b2dcc675fb5d48a88120c5900ff1a4fd/detail" target="_self" title="测试一个标题哈哈哈哈"><cite>测试一个标题哈哈哈哈</cite></a></p>', N'0', N'd7bdacb99d8746548c0882417ae3abbd', N'白猫', NULL, N'2018-09-13 13:52:10', N'00000000')
GO

INSERT INTO [dbo].[sys_message] ([id], [title], [content], [is_read], [read_uid], [read_uname], [read_date], [send_date], [tenant_id]) VALUES (N'9a311d6e471544d9b07c4d966c9b86e3', N'回答了求解', N'<p><a href="/user/4028ea815a3d2a8c015a3d2f8d2a0002" target="_self" title="系统管理员"><cite>系统管理员</cite></a>回答了您的求解<a href="/posts/3c69b5d3676e42a5ba8adbf9a3133813/detail" target="_self" title="dasdadasd"><cite>dasdadasd</cite></a></p>', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'系统管理员', NULL, N'2018-09-21 17:12:36', N'00000000')
GO

INSERT INTO [dbo].[sys_message] ([id], [title], [content], [is_read], [read_uid], [read_uname], [read_date], [send_date], [tenant_id]) VALUES (N'9fb5dd93108340f9a8e108fa150e4dc0', N'回答了求解', N'<p><a href="/user/703ab3b65dd940708d191a19fb64632c" target="_self" title="王存见"><cite>王存见</cite></a>回答了您的求解<a href="/posts/b27a9f2296b5490c92b86eceac13f692/detail" target="_self" title="标题标题标题标题标题标题标题标题标题标题"><cite>标题标题标题标题标题标题标题标题标题标题</cite></a></p>', N'0', N'703ab3b65dd940708d191a19fb64632c', N'王存见', NULL, N'2018-09-21 17:12:05', N'00000000')
GO


-- ----------------------------
-- Table structure for sys_message_template
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_message_template]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_message_template]
GO

CREATE TABLE [dbo].[sys_message_template] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [template_title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [template_content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_message_template] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版编码',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版标题',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template',
'COLUMN', N'template_title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模版内容',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template',
'COLUMN', N'template_content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发送消息模板',
'SCHEMA', N'dbo',
'TABLE', N'sys_message_template'
GO


-- ----------------------------
-- Records of sys_message_template
-- ----------------------------
INSERT INTO [dbo].[sys_message_template] ([id], [name], [code], [template_title], [template_content], [tenant_id]) VALUES (N'980000eda2bf4644b099404cc4b8cd68', N'产品付款成功模板', N'ur780e3fjt', N'产品付款成功模板', N'&lt;p&gt;&lt;a href=&quot;/user/${uid}&quot; target=&quot;_self&quot; title=&quot;${realname}&quot;&gt;&lt;cite&gt;${realname}&lt;/cite&gt;&lt;/a&gt;在求解&lt;a href=&quot;/posts/${postsId}/detail&quot; target=&quot;_self&quot; title=&quot;${postsTitle}&quot;&gt;&lt;cite&gt;${postsTitle}&lt;/cite&gt;&lt;/a&gt;。中回复了你&lt;/p&gt;', N'00000000')
GO

INSERT INTO [dbo].[sys_message_template] ([id], [name], [code], [template_title], [template_content], [tenant_id]) VALUES (N'c1fc105870bc4e3b8252973cc557ad75', N'回答了求解', N'iheyj2har8', N'回答了求解', N'&lt;p&gt;&lt;a href=&quot;/user/${uid}&quot; target=&quot;_self&quot; title=&quot;${realname}&quot;&gt;&lt;cite&gt;${realname}&lt;/cite&gt;&lt;/a&gt;回答了您的求解&lt;a href=&quot;/posts/${postsId}/detail&quot; target=&quot;_self&quot; title=&quot;${postsTitle}&quot;&gt;&lt;cite&gt;${postsTitle}&lt;/cite&gt;&lt;/a&gt;&lt;/p&gt;', N'00000000')
GO

INSERT INTO [dbo].[sys_message_template] ([id], [name], [code], [template_title], [template_content], [tenant_id]) VALUES (N'f5f928d3d7354a73a73bd67e21bc54dd', N'回复中AT了你', N'yfsidsne12', N'回复中AT了你', N'&lt;p&gt;&lt;a href=&quot;/user/${uid}&quot; target=&quot;_self&quot; title=&quot;${realname}&quot;&gt;&lt;cite&gt;${realname}&lt;/cite&gt;&lt;/a&gt;在求解&lt;a href=&quot;/posts/${postsId}/detail&quot; target=&quot;_self&quot; title=&quot;${postsTitle}&quot;&gt;&lt;cite&gt;${postsTitle}&lt;/cite&gt;&lt;/a&gt;。中回复了你&lt;/p&gt;', N'00000000')
GO


-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_operation_log]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_operation_log]
GO

CREATE TABLE [dbo].[sys_operation_log] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [content] nvarchar(1000) COLLATE Chinese_PRC_CI_AS  NULL,
  [log_type] nvarchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [request_uri] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [browser] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [os] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [operation_ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [operation_name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [method] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [params] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [msg] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_operation_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志标题',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志内容',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作方式',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'log_type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求URL',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'request_uri'
GO

EXEC sp_addextendedproperty
'MS_Description', N'浏览器',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'browser'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作系统',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'os'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作IP地址',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'operation_ip'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作人',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'operation_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作方法',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'method'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'params'
GO

EXEC sp_addextendedproperty
'MS_Description', N'异常信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'msg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求状态',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志表',
'SCHEMA', N'dbo',
'TABLE', N'sys_operation_log'
GO


-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_organization]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_organization]
GO

CREATE TABLE [dbo].[sys_organization] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [parent_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [parent_ids] nvarchar(1000) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_organization] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_organization',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父节点',
'SCHEMA', N'dbo',
'TABLE', N'sys_organization',
'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父节点路径',
'SCHEMA', N'dbo',
'TABLE', N'sys_organization',
'COLUMN', N'parent_ids'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记',
'SCHEMA', N'dbo',
'TABLE', N'sys_organization',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_organization',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'05fa0ccf85e2dac369445c927fed4ed9', N'西游网络', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-17 11:07:53', NULL, NULL, N'0', NULL, N'89013384')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'103c59b6e4dcdb4a00c4d128c431a3d5', N'飞廉', N'40288ab85b6080e1015b60996d690005', N'40288ab85b6080e1015b60996d690005/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-01-25 21:26:56', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-26 23:25:41', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'1469131e587ee3da82308dd0a2956dbf', N'大汉无忧', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-07-18 11:22:22', NULL, NULL, N'0', NULL, N'28648086')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'3409babe66b970ed4c841bf0ec72b887', N'李四的租户', NULL, NULL, N'67d2d0b2a68b0178ca1aa3c3a1e0bd1c', N'2020-07-18 10:56:47', NULL, NULL, N'0', NULL, N'96192153')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'397f2b2f1f92bd4fd4ef893cee61c354', N'测试', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-07-21 14:30:26', NULL, NULL, N'0', NULL, N'01208100')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'40288ab85b6080e1015b60996d690005', N'山海', NULL, NULL, NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-08-05 21:46:27', N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'4ca062d0ed5803df2e4b86754c1b3e7e', N'张三的租户', NULL, NULL, N'ff803cb98718d47127fd5291ab959a49', N'2020-07-18 10:52:27', NULL, NULL, N'0', NULL, N'82517141')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'68a207cc33fa7d89924bdb3d030e5b59', N'lisixu的租户', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-07-18 11:00:14', NULL, NULL, N'0', NULL, N'27317614')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'74c1e35673fa31b2716f296d6f45ff85', N'租户名称', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-07-18 11:15:42', NULL, NULL, N'0', NULL, N'31126092')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'82e352cab34c0c5d45fb048f99a1d93f', N'后台开发', N'103c59b6e4dcdb4a00c4d128c431a3d5', N'40288ab85b6080e1015b60996d690005/103c59b6e4dcdb4a00c4d128c431a3d5/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-01-25 21:27:12', NULL, NULL, N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'd269cc34a28843303a8863dde83a3d3a', N'山海科技', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-13 10:01:07', NULL, NULL, N'0', NULL, N'35798760')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'd2cae9f8eefd5c0941bf44dcb57cec5b', N'仓颉', N'40288ab85b6080e1015b60996d690005', N'40288ab85b6080e1015b60996d690005/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-26 23:25:53', NULL, NULL, N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[sys_organization] ([id], [name], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'ea33ae995d2daa7f41843eeca8976c65', N'九州科技', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-16 09:28:50', NULL, NULL, N'0', NULL, N'86865558')
GO


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role]
GO

CREATE TABLE [dbo].[sys_role] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [code] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_sys] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [usable] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'英文名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否系统数据',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'is_sys'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否可用',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'usable'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_role',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色表',
'SCHEMA', N'dbo',
'TABLE', N'sys_role'
GO


-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO [dbo].[sys_role] ([id], [name], [code], [is_sys], [usable], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'0', N'总系统管理员', N'admin', N'1', N'1', NULL, N'2017-02-13 15:52:53', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2018-10-31 21:32:43', N'总系统管理员', N'0', N'00000000')
GO

INSERT INTO [dbo].[sys_role] ([id], [name], [code], [is_sys], [usable], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'1', N'系统管理员', N'tenantAdmin', N'0', N'1', NULL, N'2017-02-13 15:52:53', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-13 11:10:20', N'租户系统管理员', N'0', N'00000000')
GO

INSERT INTO [dbo].[sys_role] ([id], [name], [code], [is_sys], [usable], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'43b7e6d70640e2b577e1b2dbbdca1032', N'用户', N'user', N'1', N'1', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-17 07:37:14', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-27 10:34:39', NULL, N'0', N'00000000')
GO

INSERT INTO [dbo].[sys_role] ([id], [name], [code], [is_sys], [usable], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [tenant_id]) VALUES (N'9e69dd6647d2b156afcd962473f05a58', N'山海角色', N'shanhairole', N'0', N'1', N'49cc47c9a5646525345621673dbc10fc', N'2019-12-17 10:56:41', NULL, NULL, NULL, N'0', N'35798760')
GO


-- ----------------------------
-- Table structure for sys_role_data_rule
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_data_rule]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_data_rule]
GO

CREATE TABLE [dbo].[sys_role_data_rule] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [data_rule_category] int  NULL,
  [data_rule_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [role_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_role_data_rule] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_data_rule',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'权限类型(1:数据权限、2:接口权限)',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_data_rule',
'COLUMN', N'data_rule_category'
GO

EXEC sp_addextendedproperty
'MS_Description', N'权限id',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_data_rule',
'COLUMN', N'data_rule_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色id',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_data_rule',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色数据权限关联表',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_data_rule'
GO


-- ----------------------------
-- Records of sys_role_data_rule
-- ----------------------------
INSERT INTO [dbo].[sys_role_data_rule] ([id], [data_rule_category], [data_rule_id], [role_id]) VALUES (N'fb7de9d6f0e84b7d1aa81d6d358a6eaf', NULL, N'2d1d11805de287aa9b9108350cf45eac', N'0')
GO


-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_role_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_role_menu]
GO

CREATE TABLE [dbo].[sys_role_menu] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [menu_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [role_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_role_menu] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu',
'COLUMN', N'menu_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色-菜单',
'SCHEMA', N'dbo',
'TABLE', N'sys_role_menu'
GO


-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'002e5ca38ba7f8b4464506d5b4b1b183', N'936b2acedf194ed3bfc403acc4c5aa71', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'00f23b57bc80b00d2170c45c58ee9e9b', N'ba46b8b6d27c4f0cabea1598d15cad27', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'01292acec54b38b99f7b4c13fef8577c', N'da7f94c7087b42359e34c703cd2ed30f', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'015b457d8bb512709477f4295422b0d7', N'6c46f6d5f6cd4cc094cc295737c3ace6', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'027ec44978064d9074f3e1d08e18c119', N'46ddbbabf30445e3a75ff2294e06ec50', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'03373450e663303478b845cf2190dafd', N'd50770e755564f15a32c2b798cdbb2de', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0412c6d6d59635eca12405c9270fe14d', N'69039de89fb94c54be70543475b995ad', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'042b87c2ed538df4aca804ef0c719822', N'e49f6dfe7973326a6ed21512ee42bae0', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'04b057a3724b87976d2d9f851289aa9d', N'7811944f996a441e9b3a761b18cb88bf', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'056cd16eeb1d8a7a3cead87f71afb5a3', N'83aea54a484b4bc8a19259352badaceb', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'05a969db3d97dc591f8a43c2dc23aced', N'79059d522a11459394c23c6f29092c41', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'05e45bfb8c584c0b147707aa00e99c3e', N'41141cd290874c76968cee0ac9932f67', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'07be1510fcff74a37ffc767e16c87d26', N'10dbd0f844d04bbcbc394dcdd6b9f258', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0a1ed29e0367b5e15b3fd696e23697e9', N'27b5cf637a964a4a97b716739056c8e4', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0a74f84f7465f8a945447b082013267f', N'4870363dbd084cdc99840732a26d9c4a', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0a8c38d271b8a3d24a99e4281376ae12', N'64a6cd14e86f434db5bc6bd3f947398f', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0a9cddc0e3917bea33c8003a3058cc65', N'3135bcb72d324ac8aad4a42823545570', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0c6791bfa06fb1be8b8151525d0cbd63', N'91fccb99710f4f2e97567653a8ef14d6', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0d702988bbb847dbb85939725681d7e1', N'760dd42695984c15a0db3f1e4ed0a4af', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0da76037c544ce17a8cfeb37756c25f6', N'5534c207669f4ba3af912622a8b5fee6', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0dc2786e4e70fcef97265dd21ebdc70f', N'd1069347e4374ddaab932656e27a2772', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0dc50ca8b941d1c2618076f1e1ade817', N'4d559f775fb94b20b87c22c6643b3180', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0dde5fb58d32c2de50ac3c453a252dba', N'f219d0b6f8144f0eab326b53f3323dd7', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'0f28c47279c565ed0a3e25bf5d7074bc', N'50e2814c16ac4bef821cb0af6bea1e2b', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'116dd4b9c0d1edd1ef649d0744197556', N'86d49f3cd426463080e0ac13bdfbc28d', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'117eda605801189565e6b49b6299614d', N'df07014114924135a875782fcaf40333', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'119f85368c47b745d05b9cb5d19e6bd1', N'd50770e755564f15a32c2b798cdbb2de', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'133e3c275165fefbeb5caf2598b06a17', N'b338552c1eee4313b1a21a880df97e81', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'137ec8f91806ba8a1b2da39f66cfa682', N'afa4277041cb454ab789b55d4b4b824a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'154e6c910465050b785167a9808729f5', N'bedb1eeccf294d98ba2f636365d01928', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'16771a91c9c3cfd7d2b67457009b0676', N'7230458979a149d48ff88544ce985809', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'17624da2bbb63890959c37750f3cf937', N'8402e9bc967144d0988386a54c912548', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1848411520fe85c80734bb8d2b188a22', N'ee8e03adf46f4377b03e4f81176b9640', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'19c59e80b60ba471551c016ef79fcf31', N'779d64b7717c4f3a99fc96ed7ccd075d', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1a5f52e37ae30eb3f7ee211f82455772', N'df3307b6f9884a2ea9c4aa32ec0388fa', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1b7c677d5eef3d2d212939a924210975', N'b8faa3f2cdc9499e814be30e218a88f5', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1ca731c3ac05db848c8226125d3b0e16', N'76fd71b67d784ed9bd02e320a387e834', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1d7f0b2a53206f7760bda2204e5a1689', N'35850e938efe413f9ddcc7821225266b', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1dbb146de605e5963c94682d213188a6', N'10dbd0f844d04bbcbc394dcdd6b9f258', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1e70c2d1227314bef6a260140b7f0425', N'ac793681eab74d2d99e3e6d335a79826', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'1f86478706ae676e029334f6137d199e', N'2954fb967419410fb281857ec86db428', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'208bec1ba62f24b2c0fa7bbfc900d955', N'86fcadeb0950427b8a4819a4229bbd74', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2097e8027d411b0a07a2f0abdd342e09', N'46ddbbabf30445e3a75ff2294e06ec50', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'22b52a619e68c22fd529b5c656f62d5b', N'41b543b75bcc4feca88f8b2e34c8c8c4', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'22f78930c556f9958583c27e9036ecdc', N'41b543b75bcc4feca88f8b2e34c8c8c4', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'23d2e19907c14a2c9dac199dc9e8a52c', N'39883d8ee458426d8890dbc0a61dc3ac', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'25221df6306ebf19ac17714313dae6a3', N'8386bfdcf52547c1a091e71873eedfdf', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'276a1d7a294a7cc3eb164c6182ede96d', N'e052e5772bb74b4b8791d79732677eb1', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'27926d46d1706bb81fc1d472624379c4', N'50e2814c16ac4bef821cb0af6bea1e2b', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'27ae32d804f659a2a20a90005d5e56e3', N'21c83bb40edd4a9e95a2392f4ed8394a', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'296b6696d645b4fff24affb57332ba01', N'f38443b4da684b7d8e81614d8180021e', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2a684d0fc49cfa8240299dcdd808dea4', N'6869b6f955594ab2a8d10b0b130120b4', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2b1ae8527e4b8c50f477970c2d9f9593', N'56e87bb7ee424e6999b27cb2a4cbc96d', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2bf1f1af8d84912193e6eb593f17297f', N'f5ea5f1f8c1d4cf1abafd1f6c4efab69', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2c651e62e85e1888be5c6dfccdd544d7', N'650fa5a8ccd04deeb656321311410606', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2dc0a94ac38c6e7aff3fa07811caa688', N'3eaf2534601a4eac9cda4b17c333eee3', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2dd9e4e7e62e9b75fffbfb98c72c9448', N'5b85cfebd56141d1a100102727395556', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2f32f661f5456b46b209075ebd2db9b3', N'5a92b11ad8434ff68b588767417c6b58', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2fdba9abeb9c5fa0b6812a29bf3d37ed', N'f38443b4da684b7d8e81614d8180021e', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'2ffc3c0c76ab67112ca108dffc0e6048', N'da7f94c7087b42359e34c703cd2ed30f', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'3068befb3c9ff66bc9170fcc46c58f32', N'7811944f996a441e9b3a761b18cb88bf', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'30d584bba3fdbe2be1ca37003ce0d264', N'3eaf2534601a4eac9cda4b17c333eee3', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'31b58ae749bf459a9047be7c53fd945e', N'247c9f811073431da881a8f90972e1c8', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'327004511ee0364e81b0e33d2776cd4c', N'83aea54a484b4bc8a19259352badaceb', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'332e79c4906c22c274955ede3d62b780', N'9c59bd5de46b48a4911047bf3307ebbc', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'341ed4c2c34c9ec6a79a3ebb98e8805d', N'56e87bb7ee424e6999b27cb2a4cbc96d', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'34c81a25f22cd0042f4b39966c248ff0', N'c5280ea2f36b44e192643c1cfd63918c', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'3544d806c1b42951fee08edc4da11bbb', N'5b85cfebd56141d1a100102727395556', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'36a49dbfdff509feb6ebe88dfbacff3a', N'd4bc391e2d6b4d619435da7c37021212', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'378fcd0ead60ac67c9752a0b8c7994c0', N'abe099fdb4144a88b6635eea23d0bd01', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'39c6e03236296d600fe12bd62ecf65f4', N'edf9c54876d8424b9ea7edb9b992a3a3', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'39cd3015d34cf8b214215062f195493e', N'760dd42695984c15a0db3f1e4ed0a4af', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'39ddd6bf55a16d642386056f7c5b2dbd', N'a2da339ab8014bb1a0600bd20149bbbd', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'3a0a8740f50edbbf834c963b631bbe41', N'1fa22fa16d6140ffbddb5747e33e7205', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'3be32b5eb58e9f258abe16f500017fbd', N'9c59bd5de46b48a4911047bf3307ebbc', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'3d4289c028b4abe264d075b0b03ad905', N'1c41720eeea94e59aeb2ea84b2cd3b00', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'3de58f860cf40aaeea00002f629e15e9', N'b0da410e900944aa84d3ad2a170ec006', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4124c70e03b460a7521876b5c21e41d9', N'41529f653db84afaaf9ef4b16845842e', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'414063b35f9ee7df8f9ae4b31437e105', N'1c6cfbfc836f4c588375458bb0968c12', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'43c69bbcf107bdc15ba9b0d840cdb989', N'26ab0c0a2cff4bf49079bc6ee3462f27', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'44cc86cff25dd9d6f253951f40782632', N'70466fa5271d45dc99cccea0027c3dc2', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'472abc8d8344797e7c986f132c9b0128', N'dce5ce1a87e3417692a8b1225d90d121', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4744bce6f573d01f5f706d77e49b14a3', N'edf9c54876d8424b9ea7edb9b992a3a3', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'48026e05d5fe21ab9344066406288393', N'df07014114924135a875782fcaf40333', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4827f7a4b732c4a453e19815f80f2395', N'c5280ea2f36b44e192643c1cfd63918c', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'489de8e38d8bb0ba0e9a28f9251c3ebf', N'ac793681eab74d2d99e3e6d335a79826', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'48d4eed05195342a5e031ea2600fbe8b', N'40a71f551a18416a850063d42250e09f', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4b0ce3339426597e6dea87364d0a1707', N'ef66722b109e4b44badded26ddc129ba', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4bdeb7d6d49b958079d70d4030878265', N'6dd8f9cceaf04ce5959e961a59ab91fc', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4be180c999b5eda26c7cf9f12a57329e', N'd50770e755564f15a32c2b798cdbb2de', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4ca8ab5e74ede6bf16118eb3f658e15b', N'97194b12b19248c79336a634a0ed9ac3', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4d76db89497e99feac1394c4ff1edac9', N'c8fdf84fa0aa4372b930ba57d0277ab9', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4dd3cbef28de2749a694ac95691db99f', N'f38443b4da684b7d8e81614d8180021e', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4e4d792e78c88b2b4ac4dab9577a03d4', N'c97c4ff1abc5436da415047d450fdb88', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4f48f541c87cb5e35a149f0913ce6c77', N'6869b6f955594ab2a8d10b0b130120b4', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'4f8a0a8ffefe6fb86d7e07bd81d0eb78', N'56e87bb7ee424e6999b27cb2a4cbc96d', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5049ce7161ebcb3dde54be70ac5f9ba5', N'46ddbbabf30445e3a75ff2294e06ec50', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'510a2bf6dff44bfaa176ed5784a14c77', N'a3bb826296174bb7b7bfdd0fcb2d33fc', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'51561197c34495bb788bd9565cd44e4f', N'fedca180ec4e9822d718026cd83817f4', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'523c588bd66ff0db29266ad1aced04eb', N'b8faa3f2cdc9499e814be30e218a88f5', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'528ec88992785a694c2c2c10aee0ee17', N'a9d4028655c945eba33546ff3df634e4', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'52ef6925be76ea6ed272e0ec050c0bdf', N'93669750fdad4979b658408e13675b30', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'534bbfb11d8c8ab4b749a485705d80cb', N'42cba67a7200910918ed3d6b2cf897e3', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5444be4d062291cfb2d28248b6fa33c0', N'6e36c83436e34bfbb316058453e3205f', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'55246763c96cb528da44999623d22713', N'a9d4028655c945eba33546ff3df634e4', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'556d100d7e81f8fbacc1d94bda71e80a', N'9afdab469e1f4f3fab4b242a2d5679e9', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'55b43be3e7bdab140219069c8d969dfb', N'69039de89fb94c54be70543475b995ad', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'57f103048f42acb8cb56b9e854fa85c2', N'c5280ea2f36b44e192643c1cfd63918c', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'597fad0f22e68117f4b597732233b855', N'1307a3dd0f934efba63b2ba4b04ffd08', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5a3b21bf00d0ae5f869b5aadf95a5a59', N'3f4c3063841641319d95412352db5a35', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5b3647c2b2de3aef900e05238620c3cb', N'48663b3b2eb5457e8a79a6a105b8fb69', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5c0c819992a9cb6363a7d4b1e887fe2c', N'eff0c65a539846f59b2046b279833dae', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5d7407980bab8c748ebe2911ff780e9c', N'55c0e037734a4f4d803e881cd7204692', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'5d851277c0ecd8b0bcb8bd8e01aeffa0', N'4ee35f7f1db2420e82f8ce6833ba885e', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6104929c9a5adec84395f43628b472b1', N'c7f55a648f974247bec0dd0745be6492', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'61384eb97f55cdf1281c425e9a1ddad9', N'83da63a6359e494cbbaffa678274ec19', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'640ecba2d2f3f50b2158d370f12b5dce', N'4548f01cbbf0427e8bb47243d4a546e9', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'64a76869506153f99b04c6be335faefc', N'9afdab469e1f4f3fab4b242a2d5679e9', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6549c79e080478715390d9794a549f8a', N'1e46d1cc27f248fb880cc887639e2e4e', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'65c2351124d418675b343128b630660e', N'760dd42695984c15a0db3f1e4ed0a4af', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'666a0d4623012114f1ff450937fb5480', N'653c7b79ebdf4054b3a7233ad6168d49', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6706e834c1763a72297cf68224f20724', N'e052e5772bb74b4b8791d79732677eb1', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'68e71d903e071289d0bbd745a7b107a9', N'498016d4913446deb6415785befd3480', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6c8832bff085fb5dd330ee1d5a499ad6', N'69039de89fb94c54be70543475b995ad', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6dc2f547e43eba7ff1c926ef79694739', N'd4e076ece76e4c109c794ee354133ef3', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6de1740803ecf6dda452bdeedf900dee', N'ba46b8b6d27c4f0cabea1598d15cad27', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'6eb590cbe7951909b59e6eaad60404bd', N'7811944f996a441e9b3a761b18cb88bf', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'700b856e73ebcc88a0d1d254acb6d0a0', N'b899735bed7744c2a27c5bf3c35a3e1e', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'71e6353ec6cc7766228fe444d07cdac3', N'38edc1e2843d411b99a05b721a2f778a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'72a18861924743f42a2e7f7f2250e92b', N'e57d4c7de46d4a12911f1c0880608fdb', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'72fdda5a315b82f846811fe8e2226a5a', N'da7f94c7087b42359e34c703cd2ed30f', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'73d2fda4553a8b3d82e99addcf0c046d', N'608629d6bfa7461f9ca258a4393523a1', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'744b1465ae6f046fb7c74a704f16e372', N'efe69c7d51f140abbfc1c1e05975ecae', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'74abc26ca3e4e83ba4858a1b3aa16fac', N'8b226abad44047b6aa2a164b441a3815', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'75af8f146cffc747213e4dcfaad2a4cc', N'2821d2f3dc5042459a4b975e1cba929a', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'76995996d96e37b450679c3612ec8599', N'c7f55a648f974247bec0dd0745be6492', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'773c7039d5e357552ee8d1f1834f860f', N'9a42181d7301459b935871b921e1a89a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'778884b4be7c5984b3ec38d102d8e58f', N'3eaf2534601a4eac9cda4b17c333eee3', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'77ff7cb18c65db6d7c08ba91209bf98c', N'3864b314549e4a9cb9e540fba21852a3', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7911e602fdf03b98515964497985ccfb', N'9de6b62cb95e483c8e57392213a87f77', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7962498500abb9dc0d1516adea6a977c', N'4de1c247dc8d4adfa48beb27e4e5696d', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7b2a966d6f70ddae90312435deee3883', N'0ce52312cd294c5a95ffec7e7abe0ef1', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7bcf70e2bc55e183daa6e10b9f107736', N'35af237befdb46b097070599470c8eed', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7be113299cd5493adc0bc44e4d4c0d61', N'1c6cfbfc836f4c588375458bb0968c12', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7dd10bb7bffab2fb6b9ff6c7ac1cf3d4', N'86fcadeb0950427b8a4819a4229bbd74', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7f6e932e5943313a031c199bda736cd5', N'f5ea5f1f8c1d4cf1abafd1f6c4efab69', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'7f728275d2748e32e964f0a1dab68c59', N'936b2acedf194ed3bfc403acc4c5aa71', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'80416b5e716454e387ebb277a505ef45', N'3f4c3063841641319d95412352db5a35', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'805a2ca32f5b3f5afcf497ee6969c00d', N'57b666b69b554c8d80da32b0141776af', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8068b7d8d79cffc03a5b7f7ada2acd2f', N'9a42181d7301459b935871b921e1a89a', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'821037c822dbc1c0ce6df573b67f40f5', N'd67f9a69cce040d0b28000e988a489c7', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'85d71769a2b4f129b764c19d5eeab7ea', N'247c9f811073431da881a8f90972e1c8', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'86b54c4da7ef12c408872480109b7417', N'9fbb210970df4024bfb1e9eaaa9de6ac', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'88a81fe5913575d0ff25fefd18d36009', N'c2fa9d559e744df9971f0321e218e125', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'89d3d5d1e890fc76567321b0aaf964fa', N'86d49f3cd426463080e0ac13bdfbc28d', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'89e4ca27d786b37e4700c4c4f3ce5078', N'ef68f37ced434f319797e3f26ef202d2', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8a746fba2ecc3183cde9ba7c31e0f759', N'9a42181d7301459b935871b921e1a89a', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8b6aa6338feeb000fc007d3b13aefc00', N'c97c4ff1abc5436da415047d450fdb88', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8bd38248236800cf81fa68d32e7ad8a1', N'cdf0fe2958434b40be1fff8145cba08b', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8bf980fd2f9fefb3d46dd6e9b5695415', N'ef66722b109e4b44badded26ddc129ba', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8c585250c9ddfe44f551ecc5b707d8be', N'4cfdb4c51e144a34957e2a2ceca7fae9', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8e6c94efa87948de7ef6caba57f9f82a', N'57b666b69b554c8d80da32b0141776af', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8ec283bbd1433c59e6b32bd44ee949f7', N'13dbeacf57934abe970497ed34ea6e59', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'8efb8d491a39495d54c2268e21c75785', N'df07014114924135a875782fcaf40333', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9046fa59fa5a5e479513f64d6c444d81', N'f6226a63129a4141adbe6805324dabdd', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'91dd14300525b52962aa5ebb685bcf39', N'4870363dbd084cdc99840732a26d9c4a', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'92a8288944d2ab2ef004dc9bd4918672', N'fdb08c18a73648ddb77d2558167a764a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9384a9be112e06f50ce76dde5c8db944', N'6869b6f955594ab2a8d10b0b130120b4', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'938b6e12810dc932ba94cf7042cc35d5', N'e746144939314619827be86fbd3efe50', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'94ab78bd2b8a075a4f462fedc5b113a2', N'8b226abad44047b6aa2a164b441a3815', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'95c13db47e2b3eb0603aa5586c64bbe3', N'008c004de43a4ebab36deb9b9a11a790', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9632585a06b27dbb75d90c0acc6965bc', N'ae18e571ddd44dbaa0384f685b3e357a', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9745210e200066b2b6083f684bd2bffb', N'ef68f37ced434f319797e3f26ef202d2', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'974c2c332df32268f93fcc7e238a9787', N'abc8dc302b1540f69f2a8c24a5612c2a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'983069b4f9c19cf24a05987c0b83e664', N'c8dacf03f6f34c1dad41bc05f85cc9e9', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'988d293f58b1132b316dd29c1e206550', N'26ab0c0a2cff4bf49079bc6ee3462f27', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'99e794b98485ba2f68aee34f96360467', N'edf9c54876d8424b9ea7edb9b992a3a3', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9b29e7ff7e395b9a025b2e5899def566', N'd4bc391e2d6b4d619435da7c37021212', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9b8cb3223441773765d8416af46a722d', N'a3bb826296174bb7b7bfdd0fcb2d33fc', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9c0e6a46fbc0efac1d2178401d376d27', N'ba46b8b6d27c4f0cabea1598d15cad27', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9e6240f0300a64389d308653e2ad8871', N'42cba67a7200910918ed3d6b2cf897e3', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9ee7dbd143df426f726908d4f0379f36', N'c97c4ff1abc5436da415047d450fdb88', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9f0197e2eceb758e31e1f75fe4b638fb', N'deca5f90b4a74a3ca243ee81a798801f', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9f2c4a8445b077ce8134b333d52e5f37', N'bedb1eeccf294d98ba2f636365d01928', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'9fd69369ece87274acbf26878b0cb99f', N'0b73fc6442d3484ebfcc0e945916a38c', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a0278eaf2d89bc8cddd9a24057389416', N'd4272a1fac244950acc93dac7ac1c7cf', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a19d4b1aaeade5de00b56c2eb090fb80', N'f3938743bdab4c64bfa99c5c9e5341e1', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a362a9f4f18784158bdac34cb330c570', N'f5ea5f1f8c1d4cf1abafd1f6c4efab69', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a46c851537f19ced84e45aca340361bd', N'3864b314549e4a9cb9e540fba21852a3', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a52b330a678342d858a6a966b6d58a4e', N'bc3c57bb7d954de7a64956e6df718fe2', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a54bc53331e55c4c57b82f7c5f090c3c', N'203aacd2a474445d8d4fb22199a7fe40', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a54fa2af8f5263c55b76d1a69d61092b', N'40a71f551a18416a850063d42250e09f', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a60ed983c03a0a6516d853434f7fdad9', N'1307a3dd0f934efba63b2ba4b04ffd08', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'a855a7cb4060c1ace84bc3368b340c6e', N'50e2814c16ac4bef821cb0af6bea1e2b', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ab10f4e57f89d6dabcf987b9abc88443', N'abe099fdb4144a88b6635eea23d0bd01', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ad5a884f456e6fc7b5cfd9e91288905e', N'41529f653db84afaaf9ef4b16845842e', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ad71ff646f2f4fdd22bd3d207c1e8bad', N'afa4277041cb454ab789b55d4b4b824a', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'afba6e68cd5244761089089b1cae4904', N'49e01ae88046460484d262d47fa30719', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'afc43a686001bb41e928b8a11f403ffc', N'2821d2f3dc5042459a4b975e1cba929a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b00bb0671f545e201a963da7f8966954', N'9c44133cf8d14addbb4b024f3515f4df', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b106f2c091b2a7dfad76d2ab2aa28b4b', N'41b543b75bcc4feca88f8b2e34c8c8c4', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b11a1494cbde36d5484d58500ce94df7', N'88b25c355bdc4a7b8b8bfdb307918eb5', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b1859d4f3744cf8a3f2cb8c9280e930e', N'e052e5772bb74b4b8791d79732677eb1', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b3cf3af607493a485c75a765752647dc', N'eff0c65a539846f59b2046b279833dae', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b50ab6d0ba00e278353eb4fbbe5cf57c', N'6c46f6d5f6cd4cc094cc295737c3ace6', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b591924e0d3dd96777ba66d8bfded3d6', N'be2ececee58e4f5ba7cf13ac35a51fbe', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b88022c7bc74167e2f063cbe3143d7c1', N'b338552c1eee4313b1a21a880df97e81', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b94033fc4c68dd010ece27a1c52ff5ae', N'f9b2cdabb11d429884a5465e754c4e06', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'b9a939b36b69d60ab8663f5934a76496', N'5b85cfebd56141d1a100102727395556', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'baf76765bf36e4b5ca8ff4a2a2f41013', N'57b666b69b554c8d80da32b0141776af', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'bb60c8f285866fec1e5103bf9bf6479a', N'91b33be150b3416d82ba38128590c507', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'bc51f7f09852bd0cb7cb974256a045a0', N'8b226abad44047b6aa2a164b441a3815', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'bf7ec99e952a9ea9cdc814acb719abe6', N'be85d873590d4a10b490bf9174c707df', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c29a1c6567b2947a89c5fd980e9fa064', N'eff0c65a539846f59b2046b279833dae', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c2d2550f77c07e4276e11debfcd0fa64', N'9f4f6568e9a54623b52657bcc6a6f478', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c5c6c6f93b557ee1121714ccde5d4c5c', N'ee8e03adf46f4377b03e4f81176b9640', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c61996381ea381b4d6c9575b112d2e60', N'ac793681eab74d2d99e3e6d335a79826', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c65b7a805955c709fffd76fa0cd0c492', N'2eef0abf5d414d9589576c30b8202dcd', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c6b526f1416b0131c15f3881106c9976', N'cb6f769427554df58229b65ae6038544', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c6dd7958852d952a03bfff4c542d2d28', N'86fcadeb0950427b8a4819a4229bbd74', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'c9a47cc1084afd6c94dc3a0fa86780d7', N'153c8847203a4df5bd8ff08e20fb6e3b', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ca09b157b1c4d0134dda876d4e2d892e', N'e6d19f6b484e4fdb8b05ed34457fd594', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ca40e4691aa5bd67b0546d7fe7ad5b57', N'83da63a6359e494cbbaffa678274ec19', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cadce7b864b31602646c7502cb91e827', N'4b96d6bd8bf542ca888cdb64b1006c69', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cb0307977ef413728cbc43dfc2281f5c', N'467202a879c0455d948185ad52ee871b', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cd5ce56fb63d723e8ca5f449a2b880ca', N'deca5f90b4a74a3ca243ee81a798801f', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ceaeba0b6b3788469cd0a38ed7512905', N'c2fa9d559e744df9971f0321e218e125', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cef87df6c4e065fedf99464f53fc0238', N'936b2acedf194ed3bfc403acc4c5aa71', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cf55233cc9eb15758e6ed0e8fc5372e2', N'ef68f37ced434f319797e3f26ef202d2', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cfa6bb24244224e0b9266ace55f42623', N'9c59bd5de46b48a4911047bf3307ebbc', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'cfb38708b7135101d77b2c11416d7bca', N'd4e076ece76e4c109c794ee354133ef3', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd069350088e327797dbcd0b71d4cf15b', N'b8faa3f2cdc9499e814be30e218a88f5', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd20170917664bee34ce7525f2496cb7b', N'8402e9bc967144d0988386a54c912548', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd2bceec486bdbf9f1530d7714d8c62b2', N'3135bcb72d324ac8aad4a42823545570', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd3a69063728f10ebba1f6d9cacdc4412', N'10dbd0f844d04bbcbc394dcdd6b9f258', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd3cce3a074d6a0e298e2c1e2f4b8a750', N'dd2b6238d3304fcf926b9e389175ad42', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd460e06b436f132945835971a31c4212', N'afa4277041cb454ab789b55d4b4b824a', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd5f3315a60c2ac445f4cc82831d1d6ee', N'abe099fdb4144a88b6635eea23d0bd01', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd6523968d12be3861d85703746735630', N'3135bcb72d324ac8aad4a42823545570', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'd9d289cfc90680fbab99a5498988b63a', N'9f8897e23c5b4c4e924ec983404834a6', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'da70842d765fec7b518b425121c4a23c', N'ae18e571ddd44dbaa0384f685b3e357a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'da939e74d23802cee8597c6cbedaf607', N'f3938743bdab4c64bfa99c5c9e5341e1', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'dafcaca465f3ec1cebd4131056836180', N'79059d522a11459394c23c6f29092c41', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'dc1ebad98d128bbd982de5f7b48f485e', N'247c9f811073431da881a8f90972e1c8', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'dd2b6295d24ded12a95a6823f85cc36f', N'e57d4c7de46d4a12911f1c0880608fdb', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'de0306286a50eab258f4dcdda4065b23', N'd1069347e4374ddaab932656e27a2772', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'de22ee4a7a2d21d37c127168510efa85', N'8a13a95a71b948208d31acb590112440', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'dec39226eb1659b68625b52276e4ebe2', N'39883d8ee458426d8890dbc0a61dc3ac', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'deca7caf3227e22c7a907bf87948ef76', N'1c6cfbfc836f4c588375458bb0968c12', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e0eebc56110d1bb2540b1be852b8de28', N'26ab0c0a2cff4bf49079bc6ee3462f27', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e27966d430bd8ed3272177473a2e3f2a', N'42cba67a7200910918ed3d6b2cf897e3', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e3b477130a4abcd175d62a61e0749f44', N'5a7fb16c87f745dfb3185be1e65673a5', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e5b8fe5933cf3de77a83e0f9d0bd5a5c', N'ea3bf0ab4bd042e0be6416680f66e19c', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e7d05fc19ab7eff957922de7c891a87d', N'9f4f6568e9a54623b52657bcc6a6f478', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e8464975315a63cb05361344dd8dbf63', N'21c83bb40edd4a9e95a2392f4ed8394a', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e85b00def994e65fadc51616332c05f4', N'bb2e6d8d88cb4685a33a27823dd09a30', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e9a2c0fa643419108033bfbf55ebcc6d', N'e198425d45ba6b6e31a6db4b7763f716', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'e9facb27f90bc299fbff5c4af6baa8d4', N'b899735bed7744c2a27c5bf3c35a3e1e', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ea5e27f825ead3040839e6a615806931', N'c7f55a648f974247bec0dd0745be6492', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'eac73eb6093e692ae742434af33f3c19', N'9afdab469e1f4f3fab4b242a2d5679e9', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'eb3814910768fb41a7401cd84a11524d', N'c782a018e34947aeae172a1fc05506a6', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'eb5f0801b439e286284992e6c1bf35fc', N'1307a3dd0f934efba63b2ba4b04ffd08', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ebd5a3820e8781d6254afbd6daf9bb61', N'4870363dbd084cdc99840732a26d9c4a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ec67e11c560691650f8c91eb74b0125b', N'deca5f90b4a74a3ca243ee81a798801f', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ecf5eb75d10e251763c5df79d5f881f7', N'b899735bed7744c2a27c5bf3c35a3e1e', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ed6a98a0c91aa27c04c280073e97fbd2', N'ee8e03adf46f4377b03e4f81176b9640', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'eed3a622cdf0c0017ac2d55f13e85c8d', N'bb2e6d8d88cb4685a33a27823dd09a30', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'efcabd4605fa2cd768506f9b9d7df7c0', N'86f65f1677184cc5b92201bbb63618d7', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f0457a713dd12dc5bf2d548ce57cbc10', N'699fbeee7c914b619485f259f83a2e6d', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f3f8aad3cfa90130ad626828d00849cb', N'87c10320fb46431e8e2900d45d9f6dad', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f540d6b0be8c071fb59938769ffeca6f', N'3b980e49ec4d4d208eec8f4dd433ca6c', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f555aba6886351905a2d23ff35c3cbf8', N'608629d6bfa7461f9ca258a4393523a1', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f69f6c5e656258e17b1dc0db952f6b0d', N'c782a018e34947aeae172a1fc05506a6', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f7c992d2358eebf740613c2d8b78a215', N'a9d4028655c945eba33546ff3df634e4', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f7d3fed46c8d7105cfa277411bce57a6', N'21c83bb40edd4a9e95a2392f4ed8394a', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f8dc13b9bcb8aa5727dc664867102434', N'cdf0fe2958434b40be1fff8145cba08b', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'f9e07a9846fb8b6cfbeb3fa653106529', N'9406154d48144fe0971880bb9d79f3a8', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'fb7c3c5eae5e2076b0e878668423aef1', N'd4bc391e2d6b4d619435da7c37021212', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'fcbf5b5ab45b7df16afc9caa7e961ef5', N'9f4f6568e9a54623b52657bcc6a6f478', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'fd1386b149fdf72a7a1abdc58ee7a638', N'39883d8ee458426d8890dbc0a61dc3ac', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'fdff3f2b20176e05d1de0fe1ff906773', N'0ce52312cd294c5a95ffec7e7abe0ef1', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ff22c365f90f630aba5b9c4501588b1a', N'1e46d1cc27f248fb880cc887639e2e4e', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ff4e10eb29194d15aac4303cc15dc4e5', N'bb2e6d8d88cb4685a33a27823dd09a30', N'1')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'ff50808774b32343e0d75bff2566bd80', N'3864b314549e4a9cb9e540fba21852a3', N'0')
GO

INSERT INTO [dbo].[sys_role_menu] ([id], [menu_id], [role_id]) VALUES (N'fff0eb469b4de1ebb3661e4ea17ecfd4', N'6c46f6d5f6cd4cc094cc295737c3ace6', N'1')
GO


-- ----------------------------
-- Table structure for sys_sessions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_sessions]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_sessions]
GO

CREATE TABLE [dbo].[sys_sessions] (
  [id] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [session] nvarchar(2000) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_sessions] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of sys_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_tenant]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_tenant]
GO

CREATE TABLE [dbo].[sys_tenant] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [contact] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [phone] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [user_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[sys_tenant] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'id主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建日期',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新日期',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标识',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户标识',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系人',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'contact'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户管理',
'SCHEMA', N'dbo',
'TABLE', N'sys_tenant'
GO


-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO [dbo].[sys_tenant] ([id], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id], [contact], [phone], [name], [user_id]) VALUES (N'487396777bf30416ee1ff5c22543512f', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-29 14:43:01', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-26 22:46:44', N'0', NULL, N'00000000', N'boss', N'13111111111', N'山海科技', N'4028ea815a3d2a8c015a3d2f8d2a0002')
GO

INSERT INTO [dbo].[sys_tenant] ([id], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id], [contact], [phone], [name], [user_id]) VALUES (N'01a16c43838c176f59a8d152a071bff0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-16 09:28:50', NULL, NULL, N'0', NULL, N'86865558', N'boss2', N'13311111111', N'九州科技', N'44452a3f185f8fc03b63c75c5ba59fd9')
GO

INSERT INTO [dbo].[sys_tenant] ([id], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id], [contact], [phone], [name], [user_id]) VALUES (N'833590525a5386670b8396bc94b06b6c', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-12-17 11:08:08', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-26 18:41:37', N'0', NULL, N'89013384', N'boss3', N'13311111111', N'西游网络', N'126657d9b6648cbd188cee3cbf713981')
GO


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user]
GO

CREATE TABLE [dbo].[sys_user] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [realname] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [username] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [portrait] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [password] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [salt] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [email] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [phone] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] tinyint  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [organization_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'真实名称',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'realname'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'username'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'portrait'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'password'
GO

EXEC sp_addextendedproperty
'MS_Description', N'邮件',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'email'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'phone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统用户的状态',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属组织ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'organization_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'sys_user',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO [dbo].[sys_user] ([id], [realname], [username], [portrait], [password], [salt], [email], [phone], [status], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id]) VALUES (N'126657d9b6648cbd188cee3cbf713981', N'西游网络', N'xiyounet', NULL, N'a0c4df50efa380ea505cbeb2d542a8b8', N'acf600b7bc8d04513b8dbe175a2172af', NULL, N'13311111111', N'1', NULL, NULL, NULL, NULL, N'0', NULL, N'05fa0ccf85e2dac369445c927fed4ed9', N'89013384')
GO

INSERT INTO [dbo].[sys_user] ([id], [realname], [username], [portrait], [password], [salt], [email], [phone], [status], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id]) VALUES (N'13e929eff9596c22361e10e33e0b8234', N'白泽', N'baize', NULL, N'e25d7cddfc97d702c395048440c4a679', N'acf600b7bc8d04513b8dbe175a2172af', NULL, N'13211111111', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'103c59b6e4dcdb4a00c4d128c431a3d5', N'00000000')
GO

INSERT INTO [dbo].[sys_user] ([id], [realname], [username], [portrait], [password], [salt], [email], [phone], [status], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id]) VALUES (N'4028ea815a3d2a8c015a3d2f8d2a0002', N'系统管理员', N'admin', NULL, N'e25d7cddfc97d702c395048440c4a679', N'acf600b7bc8d04513b8dbe175a2172af', N'wind@sunseagear.com', N'13111111111', N'1', N'2019-04-16 01:08:19', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-22 17:16:28', NULL, N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'40288ab85b6080e1015b60996d690005', N'00000000')
GO

INSERT INTO [dbo].[sys_user] ([id], [realname], [username], [portrait], [password], [salt], [email], [phone], [status], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id]) VALUES (N'44452a3f185f8fc03b63c75c5ba59fd9', N'九州科技', N'jiuzhoutech', NULL, N'3107f38e4597fe316ed621994bd3c807', N'acf600b7bc8d04513b8dbe175a2172af', NULL, N'13311111111', N'1', NULL, NULL, NULL, NULL, N'0', NULL, N'ea33ae995d2daa7f41843eeca8976c65', N'86865558')
GO

INSERT INTO [dbo].[sys_user] ([id], [realname], [username], [portrait], [password], [salt], [email], [phone], [status], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id]) VALUES (N'c91a986a797a8b69d6e13e94e2c78740', N'帝江(hong)', N'dihong', NULL, N'45ab3cf06ef22078d03da623c6abdd98', N'8757269b239fc7bb838c2a4452817f90', NULL, N'13311111111', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'd2cae9f8eefd5c0941bf44dcb57cec5b', N'00000000')
GO


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sys_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[sys_user_role]
GO

CREATE TABLE [dbo].[sys_user_role] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [user_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [role_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[sys_user_role] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role',
'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色编号',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role',
'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户-角色',
'SCHEMA', N'dbo',
'TABLE', N'sys_user_role'
GO


-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'43cdc2781bc2154e763d64ef6078a60b', N'126657d9b6648cbd188cee3cbf713981', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'4cfd06e6076906f56242635e7cad08b7', N'06ae39cd8ce42744a576a4204bc425a7', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'59c47b010a09e4bd13b0d21992b994ea', N'c91a986a797a8b69d6e13e94e2c78740', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'5f7e5539f6b121438ce7dd9fbbfb556f', N'13e929eff9596c22361e10e33e0b8234', N'43b7e6d70640e2b577e1b2dbbdca1032')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'631ab068d69087911f4a6580ddbfab9d', N'3004b806c27b51184c91511972084186', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'677685d49d6494a79506ca844ff1baf5', N'4b2adf2831b85914e1310fd7d401a5af', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'74b68ec1366bfcb15c6cab1930b31d6f', N'bb84e7d458644f9f81e9df4eecc39bd0', N'0')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'773d63b1c99449bd85fac6c270b8bd16', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'0')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'773d63b1c99449bd85fac6c270b8bd17', N'49cc47c9a5646525345621673dbc10fc', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'830ccedbb6ad763786d5591959a856f0', N'67d2d0b2a68b0178ca1aa3c3a1e0bd1c', N'0')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'8b1ebdd4266c98c9de87eb32250227be', N'ff803cb98718d47127fd5291ab959a49', N'0')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'a02c11310bd0fc2279822c167037ab4c', N'0769017c87b1179733fac705461146ae', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'b27d65f47b24ab6607f555026fbb6b2b', N'1503ad286f471b361ba6b716fcc67307', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'ca8279b1958e8284cf482ef1c105d5e5', N'7fe6dc45fd62bc40ad188267c9408da0', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'd5b38ea853808238e57d8d0ba2062caa', N'bf5a446c42964ad6a42b2bbb04604190', N'0')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'e19d2e05ba915f9ce597712709d79b52', N'44452a3f185f8fc03b63c75c5ba59fd9', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'eb9201d6b80638c1c575a4ebb50f7707', N'092b7c63dfdd903132858bd100bb02c5', N'0')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'ec2845d96816743e5ad7fa1177250c87', N'5a4addc3d1a960d1246b24b84c7527ee', N'1')
GO

INSERT INTO [dbo].[sys_user_role] ([id], [user_id], [role_id]) VALUES (N'fcf58093ee0ee15be9fb1e0052c7bb51', N'7d4aaac7b5500ed65514228cfd090db5', N'1')
GO


-- ----------------------------
-- Table structure for task_schedule_job
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[task_schedule_job]') AND type IN ('U'))
	DROP TABLE [dbo].[task_schedule_job]
GO

CREATE TABLE [dbo].[task_schedule_job] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [cron_expression] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [method_name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [method_params] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [misfire_policy] nvarchar(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [is_concurrent] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [description] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [job_status] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [job_group] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [create_by] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [execute_class] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [job_name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [load_way] nvarchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[task_schedule_job] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'cron表达式',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'cron_expression'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务调用的方法名',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'method_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求参数',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'method_params'
GO

EXEC sp_addextendedproperty
'MS_Description', N'执行策略',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'misfire_policy'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务是否有状态',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'is_concurrent'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务描述',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新者',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'update_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'create_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务状态',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'job_status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务分组',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'更新时间',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'update_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建者',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'create_by'
GO

EXEC sp_addextendedproperty
'MS_Description', N'Spring bean',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'execute_class'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'加载任务方式',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job',
'COLUMN', N'load_way'
GO


-- ----------------------------
-- Records of task_schedule_job
-- ----------------------------
INSERT INTO [dbo].[task_schedule_job] ([id], [cron_expression], [method_name], [method_params], [misfire_policy], [is_concurrent], [description], [update_by], [create_date], [job_status], [job_group], [update_date], [create_by], [execute_class], [job_name], [load_way]) VALUES (N'4ff760aa5e1042158f760fc41a225691', N'0/10 * * * * ?', N'run', N'', N'3', N'0', N'测试任务', NULL, NULL, N'0', N'sys', NULL, NULL, N'smsTask', N'短信修复发送定时任务', N'1')
GO

INSERT INTO [dbo].[task_schedule_job] ([id], [cron_expression], [method_name], [method_params], [misfire_policy], [is_concurrent], [description], [update_by], [create_date], [job_status], [job_group], [update_date], [create_by], [execute_class], [job_name], [load_way]) VALUES (N'9d3449fe77f395da4e832a366d8c5e20', N'0 0 0 * * ?', N'run', N'', N'', N'1', N'', NULL, NULL, N'1', N'system', NULL, NULL, N'logTask', N'日志清除', N'1')
GO

INSERT INTO [dbo].[task_schedule_job] ([id], [cron_expression], [method_name], [method_params], [misfire_policy], [is_concurrent], [description], [update_by], [create_date], [job_status], [job_group], [update_date], [create_by], [execute_class], [job_name], [load_way]) VALUES (N'b57316ae58234829b5602687180dfa28', N'0/10 * * * * ?', N'run', N'', NULL, N'0', N'', NULL, NULL, N'0', N'sys', NULL, NULL, N'emailTask', N'邮件修复发送定时任务', N'1')
GO


-- ----------------------------
-- Table structure for task_schedule_job_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[task_schedule_job_log]') AND type IN ('U'))
	DROP TABLE [dbo].[task_schedule_job_log]
GO

CREATE TABLE [dbo].[task_schedule_job_log] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [job_group] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [execute_class] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [method_name] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [method_params] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [job_message] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nchar(2) COLLATE Chinese_PRC_CI_AS  NULL,
  [exception_info] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_time] datetime2(0)  NULL
)
GO

ALTER TABLE [dbo].[task_schedule_job_log] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务日志ID',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务名称',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'job_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务组名',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'job_group'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务方法',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'method_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'方法参数',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'method_params'
GO

EXEC sp_addextendedproperty
'MS_Description', N'日志信息',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'job_message'
GO

EXEC sp_addextendedproperty
'MS_Description', N'执行状态（0正常 1失败）',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'异常信息',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'exception_info'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log',
'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
'MS_Description', N'定时任务调度日志表',
'SCHEMA', N'dbo',
'TABLE', N'task_schedule_job_log'
GO


-- ----------------------------
-- Records of task_schedule_job_log
-- ----------------------------
INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'0029efe73c349f151bd98c4e8285ed09', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-25 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'0156f963a01ec5925dd6292e23b267c2', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：811毫秒', N'1 ', NULL, N'2020-08-02 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'0313556d7c149702709e95fd72120a20', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：457毫秒', N'1 ', NULL, N'2020-07-18 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'0dec6eff7d9159d44eebdde8b9eed0a9', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：611毫秒', N'1 ', NULL, N'2020-07-21 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'0ea14b7f8ec020eaf846dc4ec235e61c', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：381毫秒', N'1 ', NULL, N'2020-07-23 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'168001a17cc95189d27092d5e3f9685e', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-18 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'173e53e17eb74ca9ba0706738ede3646', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：1548毫秒', N'-1', NULL, N'2020-05-24 00:39:50')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'17407788a901c8e194d5584c0e260b05', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-08-02 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'2214e528771917ca1b35ba6bef96b717', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：930毫秒', N'1 ', NULL, N'2020-07-24 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'230735755d6cdf98fca603c6e8392b05', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-05-26 00:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'27856524e95159d420a04584f26caf3a', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：577毫秒', N'1 ', NULL, N'2020-07-23 00:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'289ff84b53428482d5c7becc8ba13d8f', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：333毫秒', N'1 ', NULL, N'2020-08-03 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'2972a080cc0e577c8e5a84bfc0e29d15', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-08-04 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'2badef95adb28a44073c47687cfd005e', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：871毫秒', N'-1', NULL, N'2020-07-22 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'2c4fc026d2ed984a0bc15d2a6a17a658', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-08-05 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'41b0a078ca4d1eb9746f14c9b8b5549f', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：1154毫秒', N'1 ', NULL, N'2020-05-26 00:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'53a1c3f7913bfcc7ffa91666cba5252b', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：1014毫秒', N'1 ', NULL, N'2020-07-18 00:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'5c3b44456b1143c41e44a601f8532249', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：923毫秒', N'1 ', NULL, N'2020-05-30 00:00:57')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'5e2c7f7326e8362309dcb904da9fc15f', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-29 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'679ca62083843913133d0733c828382c', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-23 00:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'697a2bfd672084297bdc0a060b65c989', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-18 00:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'6e0423b51aa7b0557499e44f883b0317', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-30 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'6f05f265f5674b4287aaa73a07f8eb21', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：342毫秒', N'1 ', NULL, N'2020-08-01 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'79a8fdb1f6ea8ced26cb7ebb4b4cd4c4', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：385毫秒', N'1 ', NULL, N'2020-07-30 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'7f79b7dc1eb07bdb5f2a8a32431424bf', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-05-30 00:00:56')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'831cf29e17c32b1dc84bca65714e1039', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-08-03 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'885141f04ad1f05e894fe94884c15a2b', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-27 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'8d75231b2b8adbfb22bf2fab55b15907', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-31 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'941736b870b20bce0fc54e9f7e0310a1', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-05-24 00:39:48')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'97b922286aeb3121e3f0777361430005', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：589毫秒', N'1 ', NULL, N'2020-05-27 11:12:36')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'9d9e9703993ac05c70b79c09c7573df4', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-23 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'a10c99f8d007b2d0cab92fdf72863d82', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-20 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'a998fbf5cf1ad599d49b2dda08d93797', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-21 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'aa0ecb8c3618d4a3351d256200aff007', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：862毫秒', N'1 ', NULL, N'2020-07-19 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'adbc69dbd8c9b16a22aef669783cca72', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：882毫秒', N'1 ', NULL, N'2020-07-26 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'ba30e21d17d0f6cfd1d4a70c719a6816', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：308毫秒', N'1 ', NULL, N'2020-07-20 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'bbb1809b96555631a24d7f886ef82494', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：768毫秒', N'-1', N'Could not roll back JDBC transaction; nested exception is java.sql.SQLNonTransientConnectionException: Communications link failure during rollback(). Transaction resolution unknown.', N'2020-07-29 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'c031133c0bf566e3fd8bca29c748d0de', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-22 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'c35fe4cc2af2a9bee19a1cf6e96bc7e7', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-08-01 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'c50b45c99af74bfa7ae1511c7f9897da', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-28 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'd25243e0bab08a169f0fe79af1acfaf0', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-05-27 11:12:35')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'df8aca23f7b9a8ff851c0b12c78bd699', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：918毫秒', N'1 ', NULL, N'2020-08-04 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'e0b0df5afb241423d0dfef981e1e5041', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-24 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'e0c3e7efa642f2acb31c51447aea5196', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：365毫秒', N'1 ', NULL, N'2020-07-27 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'e4811bf1fb78f76a4d751837cb253473', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：661毫秒', N'1 ', NULL, N'2020-07-28 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'ec3302ec6715edcaf13d20afbfe76c33', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-26 08:00:00')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'eea639fbd5a8356b7d3efaf5868bcae7', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除运行开始!', N'0 ', NULL, N'2020-07-19 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'f82daf136a54e5844e055c5fc58faf30', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：514毫秒', N'1 ', NULL, N'2020-07-25 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'fce696f5a7b9d0d11f070a27cfc2a003', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：1168毫秒', N'1 ', NULL, N'2020-07-31 08:00:01')
GO

INSERT INTO [dbo].[task_schedule_job_log] ([id], [job_name], [job_group], [execute_class], [method_name], [method_params], [job_message], [status], [exception_info], [create_time]) VALUES (N'fcf103747dd2e204d8ee0b5fd1db63e1', N'日志清除', N'system', N'logTask', N'run', N'', N'日志清除 总共耗时：410毫秒', N'1 ', NULL, N'2020-08-05 08:00:00')
GO


-- ----------------------------
-- Table structure for test_car
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_car]') AND type IN ('U'))
	DROP TABLE [dbo].[test_car]
GO

CREATE TABLE [dbo].[test_car] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [code] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[test_car] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'test_car',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'名称',
'SCHEMA', N'dbo',
'TABLE', N'test_car',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'品牌代码',
'SCHEMA', N'dbo',
'TABLE', N'test_car',
'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'test_car',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'test_car',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典分组',
'SCHEMA', N'dbo',
'TABLE', N'test_car'
GO


-- ----------------------------
-- Records of test_car
-- ----------------------------
INSERT INTO [dbo].[test_car] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag], [tenant_id]) VALUES (N'1e53e2812aa34d9abd6bc7ded070e6ee', N'哈弗', N'002', N'阿三大声道', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-26 23:45:59', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:24:19', N'0', N'00000000')
GO

INSERT INTO [dbo].[test_car] ([id], [name], [code], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag], [tenant_id]) VALUES (N'79e50f7cc7164e159b6128110ecf28bd', N'比亚迪', N'001', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-26 23:37:16', NULL, NULL, N'0', N'00000000')
GO


-- ----------------------------
-- Table structure for test_car_model
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_car_model]') AND type IN ('U'))
	DROP TABLE [dbo].[test_car_model]
GO

CREATE TABLE [dbo].[test_car_model] (
  [id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [car_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [value] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [sort] int  NULL,
  [remarks] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[test_car_model] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'汽车',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model',
'COLUMN', N'car_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'型号名',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'型号代码',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model',
'COLUMN', N'value'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model',
'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'描述',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model',
'COLUMN', N'remarks'
GO

EXEC sp_addextendedproperty
'MS_Description', N'数据字典',
'SCHEMA', N'dbo',
'TABLE', N'test_car_model'
GO


-- ----------------------------
-- Records of test_car_model
-- ----------------------------
INSERT INTO [dbo].[test_car_model] ([id], [car_id], [name], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'2d8de06fc6774d159fa4ea3758a3758e', N'1e53e2812aa34d9abd6bc7ded070e6ee', N'h6', N'001', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 00:10:45', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 00:11:45', N'0')
GO

INSERT INTO [dbo].[test_car_model] ([id], [car_id], [name], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'327f8ce636d3413c94ac9f44f0839b83', N'79e50f7cc7164e159b6128110ecf28bd', N'汉', N'003', N'3', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:49:23', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:51:33', N'0')
GO

INSERT INTO [dbo].[test_car_model] ([id], [car_id], [name], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'77077b6f6cd54557acecf62b81979984', N'79e50f7cc7164e159b6128110ecf28bd', N'唐', N'001', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:49:02', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[test_car_model] ([id], [car_id], [name], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c6505ba95a304c47895307fea735e42d', N'1e53e2812aa34d9abd6bc7ded070e6ee', N'wey7', N'002', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 00:14:08', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[test_car_model] ([id], [car_id], [name], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'c8374120bda044118580df60710174bd', N'1e53e2812aa34d9abd6bc7ded070e6ee', N'h9', N'003', N'1', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:44:05', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:48:44', N'0')
GO

INSERT INTO [dbo].[test_car_model] ([id], [car_id], [name], [value], [sort], [remarks], [create_by], [create_date], [update_by], [update_date], [del_flag]) VALUES (N'f4dfd96542574a8ba3dc3be9880ca4d6', N'79e50f7cc7164e159b6128110ecf28bd', N'王朝', N'002', N'2', N'', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:49:10', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-04-27 11:51:38', N'0')
GO


-- ----------------------------
-- Table structure for test_expand_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_expand_table]') AND type IN ('U'))
	DROP TABLE [dbo].[test_expand_table]
GO

CREATE TABLE [dbo].[test_expand_table] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [shop] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [category] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [address] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [description] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [tag] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [organization_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [image] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[test_expand_table] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'商品名称',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属店铺',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'shop'
GO

EXEC sp_addextendedproperty
'MS_Description', N'商品分类',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'category'
GO

EXEC sp_addextendedproperty
'MS_Description', N'店铺地址',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'商品描述',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标签',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'tag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'组织ID',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'organization_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片',
'SCHEMA', N'dbo',
'TABLE', N'test_expand_table',
'COLUMN', N'image'
GO


-- ----------------------------
-- Records of test_expand_table
-- ----------------------------
INSERT INTO [dbo].[test_expand_table] ([id], [name], [shop], [category], [address], [description], [tag], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id], [image]) VALUES (N'08c7fa3112fab09a3d9007c3883e9caa', N'平板电脑', N'3C卖场', N'电子产品', N'智能手机卖场', N'大屏幕大尺寸，大有可为', N'大屏，语音助手', N'2020-05-30 22:19:35', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-30 22:19:52', NULL, N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', NULL, N'00000000', NULL)
GO

INSERT INTO [dbo].[test_expand_table] ([id], [name], [shop], [category], [address], [description], [tag], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [organization_id], [tenant_id], [image]) VALUES (N'50a5699064ac49aeae0dbf50e8172f1d', N'智能手机', N'手机卖场', N'电子产品', N'阿斯达s''d', N'最新的智能手机，最新的配置，最低的价格', N'手机', N'2019-05-04 14:02:11', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-05-30 22:18:12', NULL, N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'4028ea815a452f69015a45346f7b0001', N'00000000', NULL)
GO


-- ----------------------------
-- Table structure for test_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_table]') AND type IN ('U'))
	DROP TABLE [dbo].[test_table]
GO

CREATE TABLE [dbo].[test_table] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [author] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [type] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [level] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [content] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [status] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [tag] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [readings] int  NULL,
  [publish_date] datetime2(0)  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[test_table] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'作者',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'author'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'level'
GO

EXEC sp_addextendedproperty
'MS_Description', N'内容',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标签',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'tag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'阅读数',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'readings'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'publish_date'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'test_table',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of test_table
-- ----------------------------
INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'11af6bf658691874d4762267241a71e1', N'testuser', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'china', N'3', N'&lt;p&gt;testuser&lt;/p&gt;', N'published', NULL, NULL, N'2020-01-26 03:05:00', N'2020-01-26 03:06:03', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-07-05 16:57:59', NULL, N'0', N'bf5a446c42964ad6a42b2bbb04604190', N'00000000')
GO

INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'2e12735f8b05b9d65338a393145c7f98', N'bbbb', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'china', N'1', N'&lt;p&gt;asdas&amp;nbsp;&lt;/p&gt;', N'published', NULL, NULL, N'2020-01-26 03:05:00', N'2020-01-26 03:05:31', NULL, NULL, NULL, N'0', N'092b7c63dfdd903132858bd100bb02c5', N'00000000')
GO

INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'7c059874514549459efe9da842b0ad5f', N'admin3', N'13e929eff9596c22361e10e33e0b8234', N'CN', N'1', N'&lt;p&gt;&lt;img class=&quot;wscnph&quot; src=&quot;http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558169005633.png&quot; /&gt;&lt;img class=&quot;wscnph&quot; src=&quot;http://harbouross.oss-cn-beijing.aliyuncs.com/2019/05/18/1558169051041.png&quot; /&gt;dfasdfdsf&lt;/p&gt;', N'published', NULL, NULL, N'2019-04-03 00:37:00', N'2019-04-24 12:32:38', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-06-14 18:07:10', NULL, N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'00000000')
GO

INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'9accf9bdc02f48a48facc321370541de', N'admin2', N'13e929eff9596c22361e10e33e0b8234', N'US', N'1', N'aaaa', N'published', NULL, NULL, N'2019-04-24 00:02:00', N'2019-04-23 23:20:23', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-25 19:07:07', NULL, N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'00000000')
GO

INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'd0188d2e7d65e839f135ff5d476b7f10', N'西游网络文章', N'126657d9b6648cbd188cee3cbf713981', N'china', N'1', N'&lt;p&gt;阿斯顿发斯蒂芬&lt;/p&gt;', N'published', NULL, NULL, N'2019-12-17 11:20:00', N'2019-12-17 11:23:42', NULL, NULL, NULL, N'0', N'126657d9b6648cbd188cee3cbf713981', N'89013384')
GO

INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'db4eaa99fb4642f3b3b1fbfc49713f58', N'admin1', N'c91a986a797a8b69d6e13e94e2c78740', N'china', N'1', N'&lt;p&gt;adasdasds&lt;/p&gt;
&lt;p&gt;&lt;img class=&quot;wscnph&quot; src=&quot;data:image/png;base64,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&quot; /&gt;&lt;/p&gt;', N'published', NULL, NULL, N'2019-06-13 00:00:00', N'2019-06-14 18:12:40', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2020-02-04 02:08:04', NULL, N'0', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'00000000')
GO

INSERT INTO [dbo].[test_table] ([id], [title], [author], [type], [level], [content], [status], [tag], [readings], [publish_date], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by], [tenant_id]) VALUES (N'f67a8d7433ec8b4f7355191118845dc9', N'山海文章', N'c91a986a797a8b69d6e13e94e2c78740', N'china', N'3', N'&lt;p&gt;阿斯顿发送到，好像忘了标签&lt;/p&gt;', N'draft', NULL, NULL, N'2019-12-17 11:25:00', N'2019-12-17 11:26:11', NULL, NULL, NULL, N'0', N'49cc47c9a5646525345621673dbc10fc', N'35798760')
GO


-- ----------------------------
-- Table structure for test_tree_and_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_tree_and_table]') AND type IN ('U'))
	DROP TABLE [dbo].[test_tree_and_table]
GO

CREATE TABLE [dbo].[test_tree_and_table] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [type] nvarchar(250) COLLATE Chinese_PRC_CI_AS  NULL,
  [tag] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [area_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[test_tree_and_table] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'主键',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_and_table',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'部门名称',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_and_table',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_and_table',
'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'标签',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_and_table',
'COLUMN', N'tag'
GO


-- ----------------------------
-- Records of test_tree_and_table
-- ----------------------------
INSERT INTO [dbo].[test_tree_and_table] ([id], [name], [type], [tag], [area_id], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by]) VALUES (N'030181840a5f449daad2a78c5c6b0d76', N'市委', N'市委', N'', N'a25c56ceb3134e25abcd3f11241067b9', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[test_tree_and_table] ([id], [name], [type], [tag], [area_id], [create_date], [update_by], [update_date], [remarks], [del_flag], [create_by]) VALUES (N'c6201bd0a6534309a512575c3094ba7f', N'城管', N'城管', N'阿达是否', N'0246a2a1667c453fac27fa4fd118c18b', NULL, NULL, NULL, NULL, NULL, NULL)
GO


-- ----------------------------
-- Table structure for test_tree_table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test_tree_table]') AND type IN ('U'))
	DROP TABLE [dbo].[test_tree_table]
GO

CREATE TABLE [dbo].[test_tree_table] (
  [id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [name] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [geocoding] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [postal_code] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [parent_id] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [parent_ids] nvarchar(1000) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [create_date] datetime2(0)  NULL,
  [update_by] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [update_date] datetime2(0)  NULL,
  [del_flag] nchar(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [remarks] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [tenant_id] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[test_tree_table] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_table',
'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否叶子节点',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_table',
'COLUMN', N'geocoding'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父节点',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_table',
'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父节点路径',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_table',
'COLUMN', N'parent_ids'
GO

EXEC sp_addextendedproperty
'MS_Description', N'删除标记',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_table',
'COLUMN', N'del_flag'
GO

EXEC sp_addextendedproperty
'MS_Description', N'租户ID',
'SCHEMA', N'dbo',
'TABLE', N'test_tree_table',
'COLUMN', N'tenant_id'
GO


-- ----------------------------
-- Records of test_tree_table
-- ----------------------------
INSERT INTO [dbo].[test_tree_table] ([id], [name], [geocoding], [postal_code], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'0246a2a1667c453fac27fa4fd118c18b', N'陕西', N'001001', N'710000', NULL, NULL, N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 23:33:26', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-26 18:26:54', N'0', N'陕西', N'00000000')
GO

INSERT INTO [dbo].[test_tree_table] ([id], [name], [geocoding], [postal_code], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'06cdf012b088513f11aeede4549ed121', N'河西', N'1123', N'123123', N'e26e805cfeeb2b772db3924fddcbc807', N'0246a2a1667c453fac27fa4fd118c18b/e26e805cfeeb2b772db3924fddcbc807/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-13 12:02:21', NULL, NULL, N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[test_tree_table] ([id], [name], [geocoding], [postal_code], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'9db9219474f6519913b3acd2f21554d4', N'雁塔区', N'1111', N'11111', N'a25c56ceb3134e25abcd3f11241067b9', N'0246a2a1667c453fac27fa4fd118c18b/a25c56ceb3134e25abcd3f11241067b9/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-13 11:14:23', NULL, NULL, N'0', NULL, N'00000000')
GO

INSERT INTO [dbo].[test_tree_table] ([id], [name], [geocoding], [postal_code], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'a25c56ceb3134e25abcd3f11241067b9', N'西安', N'2123165', N'123123', N'0246a2a1667c453fac27fa4fd118c18b', N'0246a2a1667c453fac27fa4fd118c18b/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 23:38:28', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-05-02 23:49:15', N'0', N'西安', N'00000000')
GO

INSERT INTO [dbo].[test_tree_table] ([id], [name], [geocoding], [postal_code], [parent_id], [parent_ids], [create_by], [create_date], [update_by], [update_date], [del_flag], [remarks], [tenant_id]) VALUES (N'e26e805cfeeb2b772db3924fddcbc807', N'咸阳', N'11111', N'22222', N'0246a2a1667c453fac27fa4fd118c18b', N'0246a2a1667c453fac27fa4fd118c18b/', N'4028ea815a3d2a8c015a3d2f8d2a0002', N'2019-11-13 11:38:14', NULL, NULL, N'0', N'咸阳', N'00000000')
GO


-- ----------------------------
-- Primary Key structure for table email_send_log
-- ----------------------------
ALTER TABLE [dbo].[email_send_log] ADD CONSTRAINT [PK__email_se__3213E83FAAF82E54] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table email_template
-- ----------------------------
ALTER TABLE [dbo].[email_template] ADD CONSTRAINT [PK__email_te__3213E83F88102618] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table oa_notification
-- ----------------------------
ALTER TABLE [dbo].[oa_notification] ADD CONSTRAINT [PK__oa_notif__3213E83F67331969] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table oss_attachment
-- ----------------------------
ALTER TABLE [dbo].[oss_attachment] ADD CONSTRAINT [PK__oss_atta__3213E83FC1538EFD] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sms_send_log
-- ----------------------------
ALTER TABLE [dbo].[sms_send_log] ADD CONSTRAINT [PK__sms_send__3213E83FAA27BC0D] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sms_template
-- ----------------------------
ALTER TABLE [dbo].[sms_template] ADD CONSTRAINT [PK__sms_temp__3213E83F92C4D01C] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE [dbo].[sys_config] ADD CONSTRAINT [PK__sys_conf__3213E83F9DF1FB6D] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_data_source
-- ----------------------------
ALTER TABLE [dbo].[sys_data_source] ADD CONSTRAINT [PK__sys_data__3213E83FDDA41CD8] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_dict
-- ----------------------------
CREATE NONCLUSTERED INDEX [sys_dict_groupid_key]
ON [dbo].[sys_dict] (
  [gid] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE [dbo].[sys_dict] ADD CONSTRAINT [PK__sys_dict__3213E83FEC807BB2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_dict_group
-- ----------------------------
ALTER TABLE [dbo].[sys_dict_group] ADD CONSTRAINT [PK__sys_dict__3213E83F11090991] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_login_log
-- ----------------------------
ALTER TABLE [dbo].[sys_login_log] ADD CONSTRAINT [PK__sys_logi__3213E83FA12AF29E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_menu
-- ----------------------------
CREATE NONCLUSTERED INDEX [idx_sys_resource_parent_id]
ON [dbo].[sys_menu] (
  [parent_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [idx_sys_resource_parent_ids]
ON [dbo].[sys_menu] (
  [parent_ids] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE [dbo].[sys_menu] ADD CONSTRAINT [PK__sys_menu__3213E83F7FC7C4D3] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_message
-- ----------------------------
CREATE NONCLUSTERED INDEX [sys_message_read_uid]
ON [dbo].[sys_message] (
  [read_uid] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_message
-- ----------------------------
ALTER TABLE [dbo].[sys_message] ADD CONSTRAINT [PK__sys_mess__3213E83F06FAC146] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_message_template
-- ----------------------------
ALTER TABLE [dbo].[sys_message_template] ADD CONSTRAINT [PK__sys_mess__3213E83F85AEB149] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_operation_log
-- ----------------------------
CREATE NONCLUSTERED INDEX [sys_log_create_by]
ON [dbo].[sys_operation_log] (
  [create_by] ASC
)
GO

CREATE NONCLUSTERED INDEX [sys_log_request_uri]
ON [dbo].[sys_operation_log] (
  [operation_ip] ASC
)
GO

CREATE NONCLUSTERED INDEX [sys_log_create_date]
ON [dbo].[sys_operation_log] (
  [create_date] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_operation_log
-- ----------------------------
ALTER TABLE [dbo].[sys_operation_log] ADD CONSTRAINT [PK__sys_oper__3213E83FD89BD939] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_organization
-- ----------------------------
CREATE NONCLUSTERED INDEX [idx_sys_organization_parent_id]
ON [dbo].[sys_organization] (
  [parent_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [idx_sys_organization_parent_ids]
ON [dbo].[sys_organization] (
  [parent_ids] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_organization
-- ----------------------------
ALTER TABLE [dbo].[sys_organization] ADD CONSTRAINT [PK__sys_orga__3213E83F2B97313E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------
CREATE NONCLUSTERED INDEX [sys_role_del_flag]
ON [dbo].[sys_role] (
  [del_flag] ASC
)
GO

CREATE NONCLUSTERED INDEX [sys_role_enname]
ON [dbo].[sys_role] (
  [code] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE [dbo].[sys_role] ADD CONSTRAINT [PK__sys_role__3213E83F30DF2C46] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_role_menu
-- ----------------------------
CREATE NONCLUSTERED INDEX [sys_role_menu_menuid]
ON [dbo].[sys_role_menu] (
  [menu_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [sys_role_menu_roleid]
ON [dbo].[sys_role_menu] (
  [role_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE [dbo].[sys_role_menu] ADD CONSTRAINT [PK__sys_role__3213E83F52A73C15] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_sessions
-- ----------------------------
ALTER TABLE [dbo].[sys_sessions] ADD CONSTRAINT [PK__sys_sess__3213E83F542C4994] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE [dbo].[sys_user] ADD CONSTRAINT [PK__sys_user__3213E83FD3AA7DE2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table sys_user_role
-- ----------------------------
CREATE NONCLUSTERED INDEX [sys_user_role_userid]
ON [dbo].[sys_user_role] (
  [user_id] ASC
)
GO

CREATE NONCLUSTERED INDEX [sys_user_role_roleid]
ON [dbo].[sys_user_role] (
  [role_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE [dbo].[sys_user_role] ADD CONSTRAINT [PK__sys_user__3213E83F243BA3F0] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table task_schedule_job
-- ----------------------------
ALTER TABLE [dbo].[task_schedule_job] ADD CONSTRAINT [PK__task_sch__3213E83FA3C27B94] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table task_schedule_job_log
-- ----------------------------
ALTER TABLE [dbo].[task_schedule_job_log] ADD CONSTRAINT [PK__task_sch__3213E83FB1E868EC] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table test_car
-- ----------------------------
ALTER TABLE [dbo].[test_car] ADD CONSTRAINT [PK__test_car__3213E83F9335CB97] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table test_car_model
-- ----------------------------
CREATE NONCLUSTERED INDEX [test_car_model_car_id]
ON [dbo].[test_car_model] (
  [car_id] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table test_car_model
-- ----------------------------
ALTER TABLE [dbo].[test_car_model] ADD CONSTRAINT [PK__test_car__3213E83F1E4C5A8A] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table test_expand_table
-- ----------------------------
ALTER TABLE [dbo].[test_expand_table] ADD CONSTRAINT [PK__test_exp__3213E83FCE4D3F39] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table test_table
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [idx_test_table_title]
ON [dbo].[test_table] (
  [title] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table test_table
-- ----------------------------
ALTER TABLE [dbo].[test_table] ADD CONSTRAINT [PK__test_tab__3213E83F41719454] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table test_tree_and_table
-- ----------------------------
ALTER TABLE [dbo].[test_tree_and_table] ADD CONSTRAINT [PK__test_tre__3213E83F57A62544] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table test_tree_table
-- ----------------------------
ALTER TABLE [dbo].[test_tree_table] ADD CONSTRAINT [PK__test_tre__3213E83FEDD37246] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table sys_dict
-- ----------------------------
ALTER TABLE [dbo].[sys_dict] ADD CONSTRAINT [sys_dict_groupid_key] FOREIGN KEY ([gid]) REFERENCES [dbo].[sys_dict_group] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table test_car_model
-- ----------------------------
ALTER TABLE [dbo].[test_car_model] ADD CONSTRAINT [test_car_model_car_id] FOREIGN KEY ([car_id]) REFERENCES [dbo].[test_car] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

