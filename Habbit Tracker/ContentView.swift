//
//  ContentView.swift
//  Habbit Tracker
//
//  Created by Kristina Kostenko on 09.02.2025.
//

import SwiftUI

struct Activity: Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount: Int
}


@Observable
class Activities {
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
        activities = []
    }
}

struct ContentView: View {
    @State private var title = ""
    @State private var description = ""
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            List(activities) { activity in
                NavigationLink("title") {
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
