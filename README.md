# ZNO Results database 2016-2019: Open data and analysis #

## Description ##
The project allows you to create a database for MS SQL Server, which contains open data with the results of [ZNO](https://testportal.com.ua/), as well as a number of views for their analysis.
The main statistics and graphs are published on the portal [DOU](https://dou.ua) for [2016](https://dou.ua/lenta/articles/zno-2016/), [2017](https://dou.ua/lenta/articles/zno-2017/), [2018](https://dou.ua/lenta/articles/zno-2018/), [2019](https://dou.ua/lenta/articles/zno-2019/) years.
## Requirements ##
You must have installed MS SQL Server 2012 (and higher) Express Edition (and higher), as well as Visual Studio 2015 (and higher). On a machine with SQL server, there must be at least 10 GB of free disk space.
## Database creation ##
1. Open the solution in VS.
1. In the window `Solution Explorer` select the file` znodb.recreate.publish.xml` and select `Publish ...` in the context menu.
1. In the `Target database connection` field, select the path to SQL Server and the name of the database to create.
1. Press the `Load Values` button and then the `Publish` button.
1. The execution time of the scripts may take about 10 minutes.

## Use ##
You can execute SQL queries on tables and views.
