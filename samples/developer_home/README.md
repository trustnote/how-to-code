# 开发者社区官网

开发者社区是一个给开发者提供文档、工具、示例和交流的平台。

### 技术栈

ruby + sqlite3 + trustnote-pow-supernode + RPC-rubySDK

业务层：golang

web层：ruby（开发框架 Sinatra、前端渲染模板 erb）

数据层：kv + sqlite3

公链层：trustnote-pow-supernode

服务层：RPC-rubySDK



### why ruby ？

1. 要敏捷
基于敏捷开发的原则，我们排除了java、c#等笨重语言，优先考虑go、python、ruby、haskell以及nodejs。
python适合团队作战，库类丰富，我有多年的python编程经验，因此开发者社区第一个版本是用python写的。最终选择ruby，是因为ruby的灵活性可以足够的敏捷，这对于我们目前人手不多的情况下，是最优选择。

2. 要稳定
因为nodejs需要依赖，而nodejs社区发展速度过快，导致很多依赖必须不停更新，无形中带来一种不稳定的因素。

3. 要灵活
go和python是理想的语言，go支持并发，简单易学，但其编成风格不够灵活，因为缺少语法糖，所以不够灵活。

4. 要生态
haskell是我特别喜欢的语言，其函数式编成是我多年所推崇的。但因为会haskell的人不多，因此不利于社区开发者去维护。ruby有丰富的库，具备良好的生态。




### 目录树形结构说明

```
├── app.rb               框架入口文件，不要改动！
├── config.ru            框架配置文件，不要改动！
├── controllers          业务逻辑代码目录
│   ├── about.rb         
│   ├── index.rb         首页landingPage数据库读取
│   └── login.rb         用户登陆
├── db                   数据库目录
│   ├── landingpage.db   landingPage数据
│   ├── users.db         用户数据
│   └── walletapp.db     开发者在通用钱包里自定义的app数据（）
├── README.md            说明文件
├── restart.sh           用于启动web服务
├── static               静态目录
│   ├── css              样式表目录
│   ├── images           图片目录
│   ├── js               javascript文件目录
│   ├── videos           视频目录
│   └── webfonts         字体目录
└── templates            模板文件目录
    ├── about.erb        
    └── index.erb        首页模板
```

### 安装

```
sudo apt install ruby ruby-dev
```

or

```
curl -L  get.rvm.io | bash -s stable
rvm install 2.2.2
source /etc/profile.d/rvm.sh
gem install sinatra
gem install sqlite3
```

### 运行

```
./restart
```

### 访问

```
http://localhost:8080
```

### 开发原则

循序渐进、小步快跑、先发布后迭代，软件不是工程，是生命。软件不是按照规划生搬硬套地实施，而是根据实际情况灵活敏捷的生长。