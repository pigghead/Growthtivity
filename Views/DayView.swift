//
//  DayView.swift
//  Growthtivity
//
//  Created by Justin Armstrong on 11/26/19.
//  Copyright © 2019 Justin Armstrong. All rights reserved.
//

import SwiftUI

// This is where all of the TaskRow objects will go. This is the Dynamic List
// that will display tasks. Task -> TaskRow -> DayView
// Problem: I must find a way to differentiate different days

// Additionally, the array of Tasks will need to be kept elsewhere and
// accessed from this different space.
struct DayView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTasks()) var taskItems:FetchedResults<Task>
    
    // Enable/disable the details about each task in a drop down fashion
    @State private var showDetail = false
    
    // Nasty bug found when trying to navigate to an AddTask view
    @State private var navigationSelectionTag:Int? = 0
    @State private var showAddTaskView = false
    
    // Here is all of the information necessary to add a new task
    // They are wrapped with @State because they need to change
    @State private var taskTitle:String = ""
    @State private var isUrgent:Bool = false
    @State private var notes:String = ""
    
    var Day:String  // What day are we displaying?
    //var numOfTasks:Int  // How many tasks are in this day?
    
    // https://stackoverflow.com/questions/57024263/how-to-navigate-to-a-new-view-from-navigationbar-button-click-in-swiftui
    // I encountered a disgusting bug in which creating and using my own custom navigation elements on the navigation bar would cause a crash on completion of animation when navigating backwards (plus button takes me to a view, clicking back would break the entire app).
    // Solution.2: This stack overflow provided a solution which exists on the TaskRow view. Essentially, I had to assign each view a tag number and trigger NavigationLink based on which tag number is retrieved
    // Solution.3: Another problem exists in which placing a navigationlink inside of a navigationbaritems method will break the code. Apple forums suggest creating a @State bool that will toggle the desired view
    // link for Solution.3: https://forums.developer.apple.com/thread/125937#394606
    var body: some View {
        List {  // Dynamic list here
            // This section is for adding new tasks
            Section(header: Text("Add Task...")) {
                TextField("Task title...", text: self.$taskTitle)
                TextField("Task notes...", text: self.$notes)
                HStack {
                	Toggle(isOn: self.$isUrgent) {
                	    Text("Is Urgent")
                	}
                    Button(action: {
                        // Temporary task
                        let taskItem = Task(context: self.managedObjectContext)
                        
                        // assign each part of the task according to what the user has entered
                        taskItem.title = self.taskTitle
                        taskItem.notes = self.notes
                        taskItem.isUrgent = self.isUrgent
                        taskItem.createdDate = Date()
                        //taskItem.createdDay = self.Day
                        
                        // Make sure nothing goes wrong with the saving
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print("Error saving new task")
                        }
                        
                        // This is to reset the form after clicking the plus
                        self.taskTitle = ""
                        self.notes = ""
                        self.isUrgent = false
                        
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                    }
                }
            }
            
            // Section where all of the tasks are
            Section(header: Text("Tasks")) {
                // Iterate through our dynamic list
                ForEach(self.taskItems) { task in
                    // Helper function (see below)
                    link_to_details(taskTitle: task.title, taskDesc: task.notes, taskUrgent: task.isUrgent)
                }.onDelete { indexSet in  // This gives us slide to delete functionality
                    // make temporary association of which row we are trying to delete
                    let deleteMe = self.taskItems[indexSet.first!]
                    // Delete it from our CoreData
                    self.managedObjectContext.delete(deleteMe)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print("Error deleting an entry")
                    }
                }
            }
        }
        .navigationBarTitle(Day)
    }
}

// MARK: - HELPER FUNCTIONS -
// Shortcut for calling NavigationLink
private func link<Destination: View>(taskTitle: String, destination: Destination)-> some View {
    return NavigationLink(destination: destination) {
        Text(taskTitle)
    }
}

// Shortcut for calling NavigationLink; Leads directly to TaskDetailView(), and accepts all the information from CoreData to populate the details page
private func link_to_details(taskTitle: String, taskDesc: String, taskUrgent: Bool) -> some View {
    return NavigationLink(destination: TaskDetailView(title: taskTitle, desc: taskDesc)) {
        Text(taskTitle)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(Day: "Monday")
    }
}
