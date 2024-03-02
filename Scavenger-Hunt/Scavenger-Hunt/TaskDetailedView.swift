//
//  DetailedView.swift
//  Scavenger-Hunt
//
//  Created by William Sosropartono on 3/1/24.
//

import SwiftUI
import UIKit

// Task Detail View
struct TaskDetailView: View {
    var task: Task
    
    @State private var image: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            Text(task.title)
                .font(.title)
                .padding()
            Text(task.description)
                .padding()
            if task.isCompleted {
                Text("Completed")
                    .foregroundColor(.green)
            } else {
                Text("Not Completed")
                    .foregroundColor(.red)
            }
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Button("Add Photo") {
                    self.showImagePicker = true
                }
                .padding()
            }
        }
        .navigationTitle("Task Detail")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, sourceType: self.sourceType)
        }
    }
}

// Image Picker
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
