import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedCategories: Set<String>

    // placeholder options
    private let allCategories = [
        "Pipes & Fittings",
        "Hardware",
        "Plumbing Fixtures",
        "Boilers & Heating"
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(allCategories, id: \.self) { category in
                    HStack {
                        Text(category)
                        Spacer()
                        if selectedCategories.contains(category) {
                            Image(systemName: "checkmark")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggle(category)
                    }
                }
            }
            .navigationTitle("Filters")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Clear") {
                        selectedCategories.removeAll()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func toggle(_ category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
}

