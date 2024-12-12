//
//  EditView.swift
//  BucketList
//
//  Created by Mark Santoro on 12/12/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    
    @State private var name: String
    @State private var description: String
    
    var onSave: (Location) -> Void
    
    init(location: Location, onSave: @escaping (Location) -> Void){
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationBarTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    EditView(location: .example) {_ in}
}
