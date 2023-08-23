plugins {
    id("java")
    id("war")
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("com.googlecode.json-simple:json-simple:1.1.1")
    implementation("javax.servlet:javax.servlet-api:3.1.0")
    implementation("javax.servlet.jsp:jsp-api:2.2")
    implementation("javax.servlet:jstl:1.2")
    testImplementation(platform("org.junit:junit-bom:5.9.1"))
    testImplementation("org.junit.jupiter:junit-jupiter")
    testImplementation("org.mockito:mockito-core:3.12.4")

}

tasks.test {
    useJUnitPlatform()
}