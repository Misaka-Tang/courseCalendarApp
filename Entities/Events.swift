//
//  Events.swift
//  CourseSchedualApp
//
//  Created by Miska on 2023/2/15.
//

import Foundation

///in this project our calendar are conclude several events,
///this class means we need exchange our raw data class content
///into 'event' sothat we can deliver event string to check and
///put event to our 'calendar'
class Event{

  var course: Course

  var dtStart: String? = nil
  var dtEnd: String? = nil
  var description: String? = nil
  var summary: String? = nil
  var uid: UUID
  var weekDays: [Week]

  init(course: Course) {
    self.course = course
    uid = UUID()
    self.weekDays = course.courseDay
  }

}
