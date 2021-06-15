cat <<EOF > Dockerfile
FROM openjdk:8-jre-alpine
COPY target/springboot-demo-0.0.1-SNAPSHOT.jar /springboot-demo.jar
ENTRYPOINT ["java","-jar","-Xms64m","-Xmx128m","/springboot-demo.jar"]
EOF

echo "Dockerfile created successfully!"

# 基于指定目录下的Dockerfile构建镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/sauvio/springboot-demo:1.0 .

# push镜像，这边需要阿里云镜像仓库登录，在w2上登录
docker push registry.cn-hangzhou.aliyuncs.com/sauvio/springboot-demo:1.0