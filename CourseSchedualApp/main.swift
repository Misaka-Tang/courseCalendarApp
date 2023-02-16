//
//  main.swift
//  CourseSchedualApp
//
//  Created by Miska on 2023/2/14.
//

import Foundation

//create courses instances course infos
let crs1 = Course(courseID: "CPS.5309", courseName: "software engineering", courseInstructor: "Alen", courseDateStart: "20230217T140000", courseDateEnd: "20230217T151500", courseDay: [.tue,.thr])
//this param you need to fill your app's information
let calnd = Calendar(prodid: "-//Apple Inc.//macOS 13.2//EN")
//create a tool kit to provide services
let service = MethodsCalenAndEvet()
//exchange format from course to event
let evn1 = service.getEvent(rawData: crs1)
//add events to calendar
service.addEvent(event: evn1, calendar: calnd)
//create a file and import this file into your calendar application like ical.
service.generateIcsFile(calendar: service.calendarToString(calendar: calnd)
                        , path: "/Users/tangweiye/Desktop")
