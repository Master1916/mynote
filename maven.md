
# maven deploy 设置 POM.XML
```
<distributionManagement>
  <repository>
    <id>releases</id>
    <name>public</name>
    <url>http://192.168.123.70:8088/repository/maven-releases/</url>
  </repository>
  <snapshotRepository>
    <id>snapshots</id>
    <name>Snapshots</name>
    <url>http://192.168.123.70:8088/repository/maven-snapshots/</url>
  </snapshotRepository>
</distributionManagement>

```
# 设置idea maven  always update snapshots 
