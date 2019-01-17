
call mvn deploy:deploy-file^
 -DgroupId=com.btse.match^
 -DartifactId=client_commons^
 -Dversion=1.6^
 -Dpackaging=jar^
 -Dfile=client_commons.jar^
 -Durl=http://192.168.123.70:8088/repository/maven-releases/ -DrepositoryId=releases

 call mvn deploy:deploy-file^
  -DgroupId=com.btse.match^
  -DartifactId=server_commons^
  -Dversion=1.6^
  -Dpackaging=jar^
  -DgeneratePom=true^
  -Dfile=server_commons.jar^
 -Durl=http://192.168.123.70:8088/repository/maven-releases/ -DrepositoryId=releases
