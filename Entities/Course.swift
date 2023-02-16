//
//  Course.swift
//  CourseSchedualApp
//
//  Created by Miska on 2023/2/14.
//

import Foundation

///this class is course information class which means store
///raw input datas from user, here are some basic infos you
///might be need or you can add more features

class Course{

  var courseID: String
  var courseName: String
  var courseInstructor: String
  var courseDateStart: String
  var courseDateEnd: String
  //this prop means store days the class you have in a week, exp: your course have same time
  //on Tue and Wed you can add into this param or you can see example in 'main' file.
  var courseDay: [Week]

  init (courseID: String, courseName: String, courseInstructor: String, courseDateStart: String,
        courseDateEnd: String, courseDay: [Week]){
    self.courseID = courseID
    self.courseName = courseName
    self.courseInstructor = courseInstructor
    self.courseDateStart = courseDateStart
    self.courseDateEnd = courseDateEnd
    self.courseDay = courseDay
  }
}
