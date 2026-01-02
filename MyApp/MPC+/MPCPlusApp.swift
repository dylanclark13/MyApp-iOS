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
                    website: "https://www.afsupply.com",
                    latitude: 40.6906,
                    longitude: -73.9435
                ),

                Vendor(
                    name: "Allied Sprinkler Corp.",
                    categories: ["Sprinkler Supply", "Pipes & Fittings"],
                    address: "118 West 18th Street, New York, NY",
                    phone: "2126758062",
                    website: "https://www.alliedsprinkler.com",
                    latitude: 40.7415,
                    longitude: -73.9971
                ),

                Vendor(
                    name: "AM/PM Supply",
                    categories: ["Pipes & Fittings", "Plumbing Fixtures"],
                    address: "2293 Second Avenue, New York, NY",
                    phone: "7183812845",
                    website: "https://www.ampmsupply.com",
                    latitude: 40.7962,
                    longitude: -73.9367
                ),

                Vendor(
                    name: "Bruce Supply",
                    categories: ["Hardware", "Pipes & Fittings"],
                    address: "8805 18th Avenue, Brooklyn, NY",
                    phone: "7182594900",
                    website: "",
                    latitude: 40.6197,
                    longitude: -74.0045
                ),

                Vendor(
                    name: "Central Plumbing Specialties",
                    categories: ["Pipes & Fittings", "Plumbing Fixtures"],
                    address: "3619 White Plains Road, Bronx, NY",
                    phone: "7187989799",
                    website: "https://www.centralplumbingspecialties.com",
                    latitude: 40.8404,
                    longitude: -73.8551
                ),

                Vendor(
                    name: "Coastal Supply Group",
                    categories: ["Pipes & Fittings", "Heating"],
                    address: "480 Bay Street, Staten Island, NY",
                    phone: "7184472692",
                    website: "https://www.coastalsupplygroup.com",
                    latitude: 40.6340,
                    longitude: -74.0753
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
            // Insert seed data into the context
            for vendor in vendors {
                context.insert(vendor)
            }

            do {
                try context.save()
            } catch {
                assertionFailure("Failed to save seed vendors: \(error)")
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

