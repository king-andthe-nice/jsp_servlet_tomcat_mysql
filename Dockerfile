FROM tomcat:9.0-jdk17
# 修改前
# COPY ./WebContent/ /usr/local/tomcat/webapps/ROOT/
# 修改后
COPY ./WebContent/ /usr/local/tomcat/webapps/StudentManagement/
# COPY ./build/classes/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/
# COPY ./WebContent/WEB-INF/lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/
COPY ./build/classes/ /usr/local/tomcat/webapps/StudentManagement/WEB-INF/classes/
COPY ./WebContent/WEB-INF/lib/ /usr/local/tomcat/webapps/StudentManagement/WEB-INF/lib/