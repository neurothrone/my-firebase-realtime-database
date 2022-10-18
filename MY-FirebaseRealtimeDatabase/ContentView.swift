//
//  ContentView.swift
//  MY-FirebaseRealtimeDatabase
//
//  Created by Zaid Neurothrone on 2022-10-18.
//

import Firebase
import SwiftUI

struct ContentView: View {
  @State private var allFruit: [String] = []
  @State private var fruitName = ""
  
  private var ref: DatabaseReference! = Database.database().reference()
  private let fruitCollection = "fruits"
  
  var body: some View {
    VStack {
      HStack {
        TextField("Fruit name", text: $fruitName)
          .textFieldStyle(.roundedBorder)
          .autocorrectionDisabled(true)
        
        Button(action: addFruit) {
          Image(systemName: "plus")
            .imageScale(.large)
        }
        .buttonStyle(.borderedProminent)
        .tint(.mint)
        .disabled(fruitName.isEmpty)
      }
      .padding(.bottom)
      
      if allFruit.isEmpty {
        Text("No fruits yet...")
      } else {
        List {
          ForEach(allFruit, id: \.self) { fruit in
            Text(fruit)
          }
          .onDelete(perform: deleteFruit)
        }
      }
      
      Spacer()
    }
    .padding()
    .onAppear(perform: fetchFruit)
  }
}

extension ContentView {
  private func addFruit() {
    ref.child(fruitCollection).childByAutoId().setValue(fruitName)
    fetchFruit()
  }
  
  private func fetchFruit() {
    allFruit = []
    
    ref.child(fruitCollection).getData { error, snapshot in
      if let error {
        assertionFailure("❌ -> Failed to fetch fruit from Firebase. Error: \(error)")
      }
      
      if let snapshot {
        for fruit in snapshot.children {
          let fruitSnap = fruit as! DataSnapshot
          let fruitName = fruitSnap.value as! String
          allFruit.append(fruitName)
        }
      }
    }
  }
  
  private func deleteFruit(atOffsets: IndexSet) {
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
