// See README.md for license details.

ThisBuild / scalaVersion := "2.12.13"
ThisBuild / version := "0.1.0"
ThisBuild / organization := "com.github.makslevental"

lazy val root = (project in file("."))
  .settings(
    name := "braggnn_chisel",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % "3.4.3",
      "edu.berkeley.cs" %% "chiseltest" % "0.3.2" % "test",
      "org.scala-lang" % "scala-reflect" % scalaVersion.value,
      "org.scala-lang" % "scala-compiler" % scalaVersion.value,
      "edu.berkeley.cs" %% "chisel-iotesters" % "1.5.3",
      "org.scalanlp" %% "breeze" % "1.1",
      //"edu.berkeley.cs" %% "hardfloat" % "1.3" % "SNAPSHOT",
      "org.scalactic" %% "scalactic" % "3.2.9",
      "org.scalatest" %% "scalatest" % "3.2.9" % "Test", // the capital T is apparently super important???
      "org.rogach" %% "scallop" % "4.0.3"
    ),
    scalacOptions ++= Seq(
      "-Xsource:2.11",
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",
      // Enables autoclonetype2 in 3.4.x (on by default in 3.5)
      "-P:chiselplugin:useBundlePlugin"
    ),
    addCompilerPlugin(("edu.berkeley.cs" % "chisel3-plugin" % "3.4.3").cross(CrossVersion.full)),
    addCompilerPlugin(("org.scalamacros" % "paradise" % "2.1.1").cross(CrossVersion.full))
  )
