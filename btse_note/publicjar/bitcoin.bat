
call mvn deploy:deploy-file^
 -DgroupId=com.btse.coin^
 -DartifactId=seqwit^
 -Dversion=1.0^
 -Dpackaging=jar^
 -Dfile=Seqwit-1.0.jar^
 -Durl=http://192.168.123.70:8088/repository/maven-releases/ -DrepositoryId=releases
