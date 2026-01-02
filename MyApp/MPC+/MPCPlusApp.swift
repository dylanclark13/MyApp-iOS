import SwiftUI
import SwiftData

@main
struct MPCPlusApp: App {

    let container: ModelContainer = {
        let schema = Schema([Vendor.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let container = try! ModelContainer(for: schema, configurations: [config])

        let context = container.mainContext
        let existing = try? context.fetch(FetchDescriptor<Vendor>())

        if existing?.isEmpty ?? true {
            let vendors: [Vendor] = [

                Vendor(
                    name: "AF Supply Corp",
                    categories: ["Pipes & Fittings", "Plumbing Fixtures"],
                    address: "942 Lafayette Avenue, Brooklyn, NY",
                    phone: "7184436900",
                    website: "",
                    latitude: 40.6906,
                    longitude: -73.9435
                ),

                Vendor(
                    name: "F.W. Webb Company",
                    categories: ["Pipes & Fittings", "Boilers & Heating"],
                    address: "13 West 24th Street, New York, NY",
                    phone: "2122551200",
                    website: "https://fwwebb.com",
                    latitude: 40.7429,
                    longitude: -73.9903
                ),

                Vendor(
                    name: "Washington Plumbing Supply",
                    categories: ["Pipes & Fittings"],
                    address: "4290 Third Avenue, Bronx, NY",
                    phone: "7185834400",
                    website: "",
                    latitude: 40.8178,
                    longitude: -73.9146
                ),

                Vendor(
                    name: "Webster Plumbing Supply, Inc.",
                    categories: ["Pipes & Fittings", "Hardware"],
                    address: "1758 Webster Avenue, Bronx, NY",
                    phone: "7185831600",
                    website: "",
                    latitude: 40.8440,
                    longitude: -73.8977
                )
            ]

            for vendor in vendors {
                context.insert(vendor)
            }
        }

        return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
