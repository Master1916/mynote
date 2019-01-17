yaml 配置MyBatis

logging:
  config:
    classpath: resources/log4j2.xml
  level:
    com:
      btse:
        merchant:
          mapper: debug



XML 配置
    <setting name="logImpl" value="STDOUT_LOGGING"/>
