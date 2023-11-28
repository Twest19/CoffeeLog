//
//  CalendarView.swift
//  CoffeeLog
//
//  Created by Tim West on 10/29/23.
//

import SwiftUI


struct CalendarView: UIViewRepresentable {
    
    let dateInterval: DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let newCalendar = UICalendarView()
        newCalendar.delegate = context.coordinator
        newCalendar.calendar = Calendar(identifier: .gregorian)
        newCalendar.availableDateRange = dateInterval
        return newCalendar
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    

    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
        
    }
}
