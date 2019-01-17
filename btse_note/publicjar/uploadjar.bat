
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

call mvn deploy:deploy-file^
        -DgroupId=com.btse.match^
        -DartifactId=rateservice^
        -Dversion=1.0^
        -Dpackaging=jar^
        -DgeneratePom=true^
        -Dfile=rateservice.jar^
 -Durl=http://192.168.123.70:8088/repository/maven-releases/ -DrepositoryId=releases

call mvn deploy:deploy-file^
  -DgroupId=com.btse.sign^
  -DartifactId=hasher^
  -Dversion=1.0^
  -Dpackaging=jar^
  -DgeneratePom=true^
  -Dfile=hasher-1.0.jar^
 -Durl=http://192.168.123.70:8088/repository/maven-releases/ -DrepositoryId=releases
