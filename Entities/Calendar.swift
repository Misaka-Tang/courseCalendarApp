//
//  Calendar.swift
//  CourseSchedualApp
//
//  Created by Miska on 2023/2/15.
//

import Foundation

class Calendar{
// to store a series of events into one calendar
  var eventList: [Event]
//need to get prodid it means softwares' info
  var prodid: String
  //need a calendar name
  var calendarName: String? = "test"
  
  init(prodid: String) {
    self.prodid = prodid
//    self.calendarName
    self.eventList = []
  }
}
