//
//  Methods.swift
//  CourseSchedualApp
//
//  Created by Miska on 2023/2/15.
//

import Foundation
///this class give some utilities to provide services.
class MethodsCalenAndEvet{

  func getEvent(rawData: Course)->Event{
    //call course instance to event class
    let event: Event = Event(course: rawData)
    event.description = "Prof name \(rawData.courseInstructor)"
    event.summary = "\(rawData.courseID) \(rawData.courseName)"
    event.dtStart = rawData.courseDateStart
    event.dtEnd = rawData.courseDateEnd
    return event

  }

  //this func let class event to print into terminal or to file
  func eventToString(event: Event) -> String {
    let days = event.weekDays
    var eventStr = String()
    eventStr.append("BEGIN:VEVENT\n")
    eventStr.append("DTSTART:\(event.dtStart!)"+"\n")
    eventStr.append("DTEND:\(event.dtEnd!)"+"\n")
    eventStr.append("UID:\(event.uid)"+"\n")
    eventStr.append("SUMMARY:\(event.summary!)"+"\n")
    eventStr.append("DESCRIPTION:\(event.description!)"+"\n")
    //there have some params need to statical write in : UNTIL, BYDAY
    eventStr.append("RRULE:FREQ=WEEKLY;UNTIL=20230530T133000;INTERVAL=1;BYDAY=\(days[0].rawValue),\(days[1].rawValue);WKST=SU\n")
    eventStr.append("END:VEVENT\n")
    print(eventStr)
    return eventStr
  }

  //add instance event to our calendar
  func addEvent(event: Event, calendar: Calendar) {
    calendar.eventList.append(event)
  }

  //this func let class calendar to print into terminal or to file
  func calendarToString(calendar: Calendar)->String{
    var calenStr = String()
    let eventList = calendar.eventList
    calenStr.append("BEGIN:VCALENDAR\n")
    calenStr.append("X-APPLE-CALENDAR-COLOR:#34AADC\n")
    calenStr.append("PRODID:\(calendar.prodid)\n")
    calenStr.append("VERSION:2.0\n")
    calenStr.append("CALSCALE:GREGORIAN\n")
    calenStr.append("X-WR-CALNAME:\(calendar.calendarName!)\n")
    for item in eventList{
      calenStr.append(eventToString(event: item))
    }
    calenStr.append("END:VCALENDAR")
    print(calenStr)
    return calenStr
  }
  
//there is the way to generate a special file to store infos of our calendar
  func generateIcsFile(calendar: String, path: String) -> Void {
    let fileManager = FileManager.default
    let filePath = path+"/schedual.ics"
    fileManager.createFile(atPath: filePath, contents: nil, attributes: nil)
    let handle = FileHandle(forWritingAtPath: filePath)
    do{
      try handle?.write(contentsOf: calendar.data(using: .utf8)!)
      print("success!")
    }catch {
      print("Error")
    }
  }
}

