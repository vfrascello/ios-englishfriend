import Firebase
import Foundation

class DateHelper {
    static func getMinutesAndHoursBetweenDates(timestamp: Timestamp) -> String {
        
        let startDate = timestamp.dateValue()
        let currentDate = Date()
        let diffSeconds = Int(currentDate.timeIntervalSince1970 - startDate.timeIntervalSince1970)
        
       
        let hours = diffSeconds / 3600
        let minutes = (diffSeconds / 60) % 60
        
        if(minutes == 0 && hours == 0){
            return "Just now"
        } else if (hours == 0){
            return "\(minutes) min"
        } else if (hours > 23 && hours < 48) {
            let days = hours / 24
            return "\(days) day ago"
        }
        else if (hours > 23) {
            let days = hours / 24
            return "\(days) days ago"
        }
        else
        {
            return "\(hours)hr \(minutes)min"
        }
        
    }
}
