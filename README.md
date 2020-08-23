# 飞廉

### 介绍
飞廉，山海经中神兽，身似鹿，头如雀，有角而蛇尾，虽不能飞，但身形敏捷，速度奇快。
擅长御风，是传说中的风神，秦人的先祖。

<img width="30%" src="http://feilian.oss-cn-beijing.aliyuncs.com/doc/feilian.jpeg" alt="飞廉">

图片来自网络

我们认为软件开发的第一要务就是速度。不论是做产品，接项目，甚至是接私活，速度都是成败的关键。
高效是一个团队的追求，更高的效率意味着更高的利润。高效也是一个程序员的追求，意味着更少的加班和更多的头发。

取名飞廉，是因为我们希望能够设计出一款框架，简单，好用，具有极高的开发效率，但又不过度的封装，将技术细节能够原本的展现出来。让新手能用，老手爱用。

### 代码生成器上线了内测了
* 一个运行在云端的代码生成工具。
* 能够自动生成单表，树表，展开表，级联表（主子表），左树右表等常见的后台系统页面。
* 支持人员选择，图片上传，百度地图，富文本等多达十几种的常用组件的自动生成，十多种表单验证的自动集成。
* 轻松减少70%的代码开发量，让开发人员从重复的增删改查中解放出来，专注业务的开发。

文档地址:http://www.sunseagear.com/#/doc/cangjie/start

有兴趣参与内测的小伙伴，加QQ:553671691,或者微信: Dothegod，加人请注明“飞廉”

### 源码地址
gitee:https://gitee.com/sunseagear/wind

github:https://github.com/sunseagear/wind
### 在线预览
http://www.sunseagear.com/dist/
### 在线文档
http://www.sunseagear.com/

    演示系统数据无法修改
### 系统要求(推荐)
>* jdk 1.8+
>* tomcat 8.0+
>* mysql 5.7+
>* nodejs 12.0+
>* npm 6.0+

### 软件架构
>* 整个系统采用前后端分离的模式
>* 后端基于SpringBoot2、Mybatis plus构建核心架构，技术结构来自于JeeWeb（该项目原作者已经不维护）
>* 前端采用vuejs，集成了element-vue-admin
>* 采用Oauth2协议进行统一的Token下发与鉴权，保证系统安全性 
>* 采用Shiro进行权限动态管理，能够做到按钮级别的权限管控。
>* 支持Quartz定时任务
>* 支持邮件定时发送
>* 支持短信定时发送
>* 支持webSocket
>* 支持多租户
>* 支持数据规则动态配置
>* 支持jar包和war包两种部署

### 我们做了什么
>* 自2018年底开始独立演进，修复很多原框架已有的BUG
>* 对原有框架进行了大量的简化，删除了不必要的代码，重新梳理了整个底层               
>* 更新Mybatis plus到3.0+，更新了DAO层的代码实现
>* 重写了element-vue-admin的菜单加载模式，使得后台配置菜单易用性大幅提高
>* 新增了按钮级别的权限控制
>* 新增了对websocket的支持
>* 新增了多租户的支持
>* 新增了动态数据规则的支持
>* 改进后台配置，支持多种状态配置，支持两种打包模式
>* 前端页面进行了大量的重写和优化
>* 新增了百度地图套件（打点，画线，画框），系统部门选择组件，系统用户选择组件，文件图片上传组件，同时修复大量原有组件的BUG
>* 提供了多种页面的代码样例以供参考

### 项目文件组成
* sql 为数据库脚本
* wind-admin 为前端系统页面
* wind-server 为后台系统
### 前端运行（命令行）
```
# 安装依赖
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev

# 打包部署
npm run build

```

### 前端运行（IDEA）
1. 在IDEA中打开前端项目<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/openAdmin.PNG)
2. 在命令行中输入npm install<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/npmInstall.PNG)
3. 点击 add configuration，弹出配置对话框<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/setting.PNG)
4. 点击左上角“+”， 添加npm项目<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/npm.PNG)
5. 在右侧Scripts下拉框，选择dev<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/npmDev.PNG)
6. 再次点击左上角“+”，添加npm项目<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/npm.PNG)
7. 在右侧Scripts下拉框，选择build:prod<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/npmBuild.PNG)
8. 创建好两个项目后点击“OK”，关闭对话框
9. 选择dev项目，点击运行，便可以运行项目<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/runDev.PNG)
10. 出现如下提示的时候，说明项目启动项目<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/run.PNG)
11. 点击链接http://localhost:9527或者http://192.168.1.101:9527，自动打开浏览器，出现如下界面，说明系统启动成功<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/home.PNG)

### 后端运行
1. 使用数据库工具导入数据脚本，可以使用自己的常用的数据库工具导入数据<br>
2. 在IDEA中打开后端项目<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/server/open.PNG)
3. 打开application-dev.yml文件，配置数据库连接信息<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/server/database.PNG)
4. 如果是第一次打开项目，在idea右下角会弹出对话框，点击Add as maven project，或者选择根目录pom.xml文件，右键选择Add as maven project<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/server/maven.PNG)
5. 同步完成以后，会自动识别为springBoot项目, 点击运行即可<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/server/run.PNG)
6. 系统运行成功<br>
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/install/server/start.PNG)


### 系统截图
首页
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/home.png)
用户
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/user.png)
菜单
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/menu.png)
权限
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/permission.png)
数据规则配置
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/dataruleForm.png)
字典
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/dict.png)
代码样例
![Image text](http://feilian.oss-cn-beijing.aliyuncs.com/doc/summary/demo.png)


### 代码生成器
创建模块
<img src="http://feilian.oss-cn-beijing.aliyuncs.com/cangjie/createTable.png" style="border: 1px solid #a9a9a9;"><br>
块配置
<img src="http://feilian.oss-cn-beijing.aliyuncs.com/cangjie/jdbc.png" style="border: 1px solid #a9a9a9;"><br>
<img src="http://feilian.oss-cn-beijing.aliyuncs.com/cangjie/form.png" style="border: 1px solid #a9a9a9;"><br>
<img src="http://feilian.oss-cn-beijing.aliyuncs.com/cangjie/list.png" style="border: 1px solid #a9a9a9;"><br>
代码生成
<img src="http://feilian.oss-cn-beijing.aliyuncs.com/cangjie/save.png" style="border: 1px solid #a9a9a9;"><br>
