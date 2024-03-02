//
//  ListView.swift
//  Scavenger-Hunt
//
//  Created by William Sosropartono on 3/1/24.
//
import SwiftUI

// Model for a task
struct Task: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
}

// Task List View
struct TaskListView: View {
    @State private var tasks: [Task] = [
        Task(title: "Task 1", description: "Description for Task 1", isCompleted: false),
        Task(title: "Task 2", description: "Description for Task 2", isCompleted: false),
        Task(title: "Task 3", description: "Description for Task 3", isCompleted: false),
        Task(title: "Task 4", description: "Description for Task 4", isCompleted: false)
    ]
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                NavigationLink(destination: TaskDetailView(task: task)) {
                    HStack {
                        Text(task.title)
                        Spacer()
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                    }
                }
            }
            .navigationTitle("Scavenger Hunt")
        }
    }
}
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}


