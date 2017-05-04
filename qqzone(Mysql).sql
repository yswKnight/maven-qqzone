#好友动态表
create table Activitys
(
    actId varchar(32) primary key,     #动态ID
    commId varchar(32),                #评论ID
    sayId varchar(32),                 #说说ID
    logId varchar(32),                 #日志ID
    userId varchar(32),                #用户ID
    photoId varchar(32),               #图片ID
    dicId varchar(32),                 #字典ID
    actcreateTime datetime                 #发布时间    
);


#相册表
create table Album
(
      albumId varchar(32) primary key,     #相册ID
      dicId varchar(32),                   #权限ID
      userId varchar(32),                  #相册创建者ID
      albumName varchar(40),               #相册名称
      cover varchar(200),		   #相册封面
      adescribe varchar(500)		#相册描述
);


#字典表
create table Dic
(
       dicId varchar(32) primary key,      #字典ID
       dicValue varchar(40)              #字典内容
);


#点赞表
create table Praise
(
       praId varchar(32) primary key,      #赞ID
       actId varchar(32),                  #动态ID
       userId varchar(32)                  #点赞者ID
);


#照片表
create table Photos
(
       photoId varchar(32) primary key,    #照片ID
       albumId varchar(32),                #相册ID
       dicId varchar(32),                  #字典ID
       pcreateTime datetime,                   #时间
       pName varchar(40),                  #照片名称
       pContent varchar(200),              #大图
       thumbanil varchar(200),              #小图
       pdescribe varchar(500)				#照片描述
);

#说说表
create table Say
(
       sayId varchar(32) primary key,      #说说ID
       userId varchar(32),                 #用户ID
       sayContent varchar(500),            #说说内容
       sayCreateTime datetime                  #发布时间
);


#说说相册
create table sayphoto
(
		sayphotoId varchar(32) primary key,	#图片id(uuid)
		sayId varchar(32),					#说说id
		photosrc varchar(100)				#图片路径
);

#用户表
create table Users
(
       userId varchar(32) primary key,     #用户ID
       dicId varchar(32),                  #字典ID
       userName varchar(40),               #用户名称
       realname varchar(40),               #真实名称
       password varchar(100),              #密码
       email varchar(100),                 #邮箱
       sex int,                            #性别
       birthday date,                      #生日
       address varchar(100),               #地址
       img varchar(50),                    #图片（头像）
       salt varchar(100)				   #密码加密
);


#好友管理表
create table Friends
(
       friendId varchar(32) primary key,   #流水号
       userId varchar(32),                 #用户ID
       Use_userId varchar(32)              #好友ID
);


#好友验证信息表
create table friendMsg
(
       msgId varchar(32) primary key,      #验证信息ID
       userId varchar(32),                 #用户ID
       Use_userId varchar(32),             #好友ID
       msg varchar(255),                   #验证信息内容
       msgCreateTime date,                 #发送验证信息时间
       status varchar(40)                  #状态
);


#日志表
create table LogAct
(
       logId varchar(32) primary key,      #日志ID
       userId varchar(32),                 #用户ID
       logTitle varchar(255),              #日志标题
       logContent varchar(4000),           #日志内容
       logcreateTime datetime                  #日志发布时间
);


#密保表
create table pwdProtect
(
      pid varchar(32) primary key,        #密保ID
      userId varchar(32),                  #用户ID
      questionId varchar(32),              #问题ID
      answer varchar(200)                  #答案
);


#评论表
create table Comments
(
       commId varchar(32) primary key,     #评论ID
       userId varchar(32),                 #用户ID
       dicId varchar(32),                  #评论类型
       Com_commid varchar(32),             #回复评论
       actId varchar(32),                  #动态ID    
       toUser varchar(40),                 #接受评论的用户
       commcreateTime datetime,                #发布评论时间
       commContent varchar(4000),          #评论内容
       corder int                          #评论排序
);


insert into dic values('1','注册用户');
insert into dic values('2','管理员');

insert into dic values('11','你的故乡在那里？');
insert into dic values('12','你的配偶职业？');
insert into dic values('13','你的小学在名称？');
insert into dic values('14','你最喜欢的运动？');
insert into dic values('15','你喜欢的水果是？');
insert into dic values('16','你喜欢的颜色是？');
insert into dic values('17','你最喜欢的明星是？');
insert into dic values('18','你最喜欢的电影是？');
insert into dic values('19','你最喜欢的音乐？');

insert into dic values('21','所有人可见');
insert into dic values('22','好友可见');
insert into dic values('23','仅自己可见');

insert into dic values('31','说说动态');
insert into dic values('32','照片动态');
insert into dic values('33','日志动态');
insert into dic values('41','说说评论');
insert into dic values('42','照片评论');
insert into dic values('43','日志评论');
