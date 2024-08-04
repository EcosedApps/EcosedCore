allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.layout.buildDirectory = file(path = "../build")

subprojects {
    project.layout.buildDirectory = file(
        path = "${rootProject.layout.buildDirectory}/${project.name}"
    )
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>(name = "clean") {
    delete(rootProject.layout.buildDirectory)
}