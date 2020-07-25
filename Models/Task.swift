//
//  Task.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 11/26/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI
import CoreData

// Identifiable protocol is used to identify which item is which when working with
// dynamic lists. Because Tasks will exist inside of a dynamic list, we must be able
// to differntiate them from one another
public class Task: NSManagedObject, Identifiable {
    public var ID: UUID = UUID()  // identifier for this task
    @NSManaged public var title:String  // Title of the note
    @NSManaged var notes:String  // Notes regarding the task
    @NSManaged var isUrgent:Bool  // How important is the task?
    @NSManaged var tags:[String]  // Since tasks can have multiple tags
    @NSManaged var timeSpent: TimeInterval  // time spent towards the given task
    @NSManaged var createdDate: Date
    @NSManaged var createdDay: String  // the day the object was created; solution for ensuring that all of the tasks will only live under the respective day that they are created
    
    // Due to the usage of NSManagedObject, there is no need for initializers
    // Designated initializer
//    init(title: String, notes: String, isUrgent: Bool, tags:[String]) {
//        self.title = title
//        self.isUrgent = isUrgent
//        self.tags = tags
//        self.notes = notes
//        //self.day = day
//        self.timeSpent = 0  // always zero when we create the task
//    }
    
    // Convenience init - not all tasks will have notes associated with them
//    convenience init(title: String) {
//        self.init(title: title, notes: " ", isUrgent: false, tags:[])
//    }
    
    // Convenience inits for testing purposes
//    convenience init(isUrgent: Bool) {
//        self.init(title: "UrgencyTest", notes: " ", isUrgent: isUrgent, tags:[])
//    }
    
    // MARK: - Functions -
    // Control our little icon denoting importance/urgency
    func toggleIsUrgent() {
        isUrgent = !isUrgent
    }
    
    // Get the title of the task
    public func getTitle() -> String {
        return title
    }
    
    // Update the title of task (testing private variable of the class)
    public func updateTitle(newTitle: String) {
        title = newTitle
    }
    
    // Get the notes
    func getNotes() -> String {
        return notes
    }
    
    // Get the notes of the task
    func getTags() -> [String] {
        return tags
    }
    
    // Get what day the task belongs to -- used for sorting tasks to their respective days
    func getDay() -> String {
        return createdDay
    }
}

// Declaring statics in our extension allows us to call the method without the object being present
extension Task {
    // This is how we will get all items in our persistent container in AppDelegate
    static func getAllTasks() -> NSFetchRequest<Task> {
        let request:NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        
        let sortDescriptor = NSSortDescriptor(key: "createdDate", ascending: false)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

struct Task_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
