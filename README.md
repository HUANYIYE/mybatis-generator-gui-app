# mybatis-generator-gui-app
自动化构建工具
简介
基于mybatis generator开发一款界面工具, 本工具可以使你非常容易及快速生成Mybatis的Java POJO文件及数据库Mapping文件。

在原有基础上集成了Service与Controller的文件的生成。

要求
本工具由于使用了Java 8的众多特性，所以要求JDK 1.8.0.60以上版本，另外JDK 1.9暂时还不支持。

 

工具下载地址：
https://github.com/HUANYIYE/mybatis-generator-gui-app.git



1.运行mybatis-generator-gui.jar启动程序



2.点击数据库链接，输入数据库链接配置



3.双击链接数据库，并选择要构建的表



4.选择项目所在目录，输入实体类、Mapper接口等文件的包名与存放目录会生成文件至指定的目录下。



5.勿取消“DAO方法抽出到公共父接口”与“DAO使用@Repository注解”的选项，会导致DAO层不可用



6.ftl目录下为service与contriller的模板文件，可根据需要进行修改

