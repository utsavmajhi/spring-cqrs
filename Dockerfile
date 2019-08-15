FROM azul/zulu-openjdk-alpine:12.0.2 as build
WORKDIR /workspace/app
 
COPY spring/projectone/gradlew .
COPY spring/projectone/gradle gradle
COPY spring/projectone/build.gradle .
RUN ./gradlew dependencies
 
COPY spring/projectone/src src
RUN ./gradlew clean build -x test
RUN mkdir -p build/dependency && (cd build/dependency; jar -xf ../libs/*.jar)
 
FROM azul/zulu-openjdk-alpine:12.0.2
VOLUME /dutchmill
#EXPOSE 8080
ARG DEPENDENCY=/workspace/app/build/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.javaverse.projectone.Application"]

