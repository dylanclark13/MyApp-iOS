import SwiftUI
import SwiftData

@main
struct MyAppApp: App {
    
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Vendor.self
        ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        return try! ModelContainer(for: schema, configurations: [config])
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    seedVendorsIfNeeded()
                }
        }
        .modelContainer(sharedModelContainer)
    }
    
    private func seedVendorsIfNeeded() {
        let context = sharedModelContainer.mainContext
        
        let existing = try? context.fetch(FetchDescriptor<Vendor>())
        guard existing?.isEmpty ?? true else { return }
        
        let vendors: [Vendor] = [
            
            Vendor(name: "AF Supply Corp", address: "942 Lafayette Avenue, Brooklyn, NY", phone: "7184436900", website: "", latitude: 40.6906, longitude: -73.9435),
            Vendor(name: "AF Supply Corp", address: "140 East Merrick Road, Freeport, NY", phone: "5163778300", website: "", latitude: 40.6576, longitude: -73.5836),
            Vendor(name: "AF Supply Corp", address: "50 Dickson Street, Glen Cove, NY", phone: "5166768330", website: "", latitude: 40.8627, longitude: -73.6337),
            Vendor(name: "AF Supply Corp", address: "195 Lauman Lane, Hicksville, NY", phone: "5168224320", website: "", latitude: 40.7715, longitude: -73.5251),
            Vendor(name: "AF Supply Corp", address: "44-22 54th Road, Maspeth, NY", phone: "7186401439", website: "", latitude: 40.7396, longitude: -73.9254),
            Vendor(name: "AF Supply Corp", address: "22 West 21st Street, New York, NY", phone: "2122435400", website: "", latitude: 40.7411, longitude: -73.9916),
            
            Vendor(name: "Allied Sprinkler Corp.", address: "118 West 18th Street, New York, NY", phone: "2126758062", website: "", latitude: 40.7415, longitude: -73.9971),
            
            Vendor(name: "AM/PM Supply", address: "2293 Second Avenue, New York, NY", phone: "7183812845", website: "", latitude: 40.7962, longitude: -73.9367),
            Vendor(name: "AM/PM Supply", address: "59-23 55th Street, Queens, NY", phone: "7183812845", website: "", latitude: 40.7402, longitude: -73.9246),
            
            Vendor(name: "Bruce Supply", address: "8805 18th Avenue, Brooklyn, NY", phone: "7182594900", website: "", latitude: 40.6197, longitude: -74.0045),
            
            Vendor(name: "Central Plumbing Specialties", address: "205 Adams Street, Bedford Hills, NY", phone: "9142979361", website: "", latitude: 41.2351, longitude: -73.6447),
            Vendor(name: "Central Plumbing Specialties", address: "3619 White Plains Road, Bronx, NY", phone: "7187989799", website: "", latitude: 40.8404, longitude: -73.8551),
            Vendor(name: "Central Plumbing Specialties", address: "31A Ponquogue Avenue, Hampton Bays, NY", phone: "6317280621", website: "", latitude: 40.8833, longitude: -72.5178),
            Vendor(name: "Central Plumbing Specialties", address: "1250 Park Avenue, New York, NY", phone: "2127222975", website: "", latitude: 40.7782, longitude: -73.9574),
            Vendor(name: "Central Plumbing Specialties", address: "423 Third Avenue, New York, NY", phone: "2128128622", website: "", latitude: 40.7439, longitude: -73.9798),
            Vendor(name: "Central Plumbing Specialties", address: "54 Kennedy Drive, Spring Valley, NY", phone: "8455730090", website: "", latitude: 41.1131, longitude: -74.0472),
            
            Vendor(name: "City Water Meter Repair Co. Inc", address: "526 East 13th Street, New York, NY", phone: "2124737296", website: "", latitude: 40.7291, longitude: -73.9793),
            
            Vendor(name: "Coastal Supply Group", address: "38-16 Skillman Avenue, Queens, NY", phone: "7189423300", website: "", latitude: 40.7475, longitude: -73.9266),
            Vendor(name: "Coastal Supply Group", address: "135 New Dorp Lane, Staten Island, NY", phone: "7189790011", website: "", latitude: 40.5736, longitude: -74.1111),
            Vendor(name: "Coastal Supply Group", address: "2274 Arthur Kill Road, Staten Island, NY", phone: "7189668382", website: "", latitude: 40.5178, longitude: -74.2327),
            Vendor(name: "Coastal Supply Group", address: "480 Bay Street, Staten Island, NY", phone: "7184472692", website: "", latitude: 40.6340, longitude: -74.0753),
            
            Vendor(name: "F.W. Webb Company", address: "919 Southern Blvd, Bronx, NY", phone: "7183781010", website: "https://fwwebb.com", latitude: 40.8232, longitude: -73.8907),
            Vendor(name: "F.W. Webb Company", address: "1020 Mamaroneck Avenue, Mamaroneck, NY", phone: "9148352300", website: "https://fwwebb.com", latitude: 40.9565, longitude: -73.7357),
            Vendor(name: "F.W. Webb Company", address: "2 Galasso Place, Maspeth, NY", phone: "7183951954", website: "https://fwwebb.com", latitude: 40.7269, longitude: -73.9108),
            Vendor(name: "F.W. Webb Company", address: "13 West 24th Street, New York, NY", phone: "2122551200", website: "https://fwwebb.com", latitude: 40.7429, longitude: -73.9903),
            Vendor(name: "F.W. Webb Company", address: "2350 12th Avenue, New York, NY", phone: "6464283944", website: "https://fwwebb.com", latitude: 40.7725, longitude: -73.9941),
            Vendor(name: "F.W. Webb Company", address: "34 Lamar Street, West Babylon, NY", phone: "6312130031", website: "https://fwwebb.com", latitude: 40.7189, longitude: -73.3527),
            
            Vendor(name: "General Plumbing Supply", address: "1164 Castleton Avenue, Staten Island, NY", phone: "7188858900", website: "", latitude: 40.6331, longitude: -74.1193),
            Vendor(name: "Gil Meyerowitz, Inc.", address: "70-22 Cypress Hills Street, Ridgewood, NY", phone: "7188216200", website: "", latitude: 40.6998, longitude: -73.9074),
            Vendor(name: "H.C. Oswald Supply Co., Inc.", address: "725 Whittier Street, Bronx, NY", phone: "7186201400", website: "", latitude: 40.8207, longitude: -73.8874),
            Vendor(name: "Heating & Burner Supply", address: "479 Walton Avenue, Bronx, NY", phone: "7186650006", website: "", latitude: 40.8193, longitude: -73.9137),
            Vendor(name: "Mechanical Heating Supply Inc.", address: "476 Timpson Place, Bronx, NY", phone: "7184029765", website: "", latitude: 40.8324, longitude: -73.8982),
            Vendor(name: "New York Replacement Parts Corp", address: "1462 Lexington Avenue, New York, NY", phone: "9149650122", website: "", latitude: 40.7841, longitude: -73.9526),
            Vendor(name: "Nuthouse Hardware", address: "202 East 29th Street, New York, NY", phone: "2125451447", website: "", latitude: 40.7410, longitude: -73.9803),
            Vendor(name: "Pronto Gas Heating Supply Co", address: "681 East 136th Street, Bronx, NY", phone: "7182920707", website: "", latitude: 40.8076, longitude: -73.9191),
            Vendor(name: "Pronto Gas Heating Supply Co", address: "181 Chrystie Street, New York, NY", phone: "2127773366", website: "", latitude: 40.7203, longitude: -73.9915),
            Vendor(name: "Ranger Supply Co.", address: "3137 Bailey Avenue, Bronx, NY", phone: "7185436666", website: "", latitude: 40.8751, longitude: -73.9053),
            Vendor(name: "Washington Plumbing Supply", address: "4290 Third Avenue, Bronx, NY", phone: "7185834400", website: "", latitude: 40.8178, longitude: -73.9146),
            Vendor(name: "Webster Plumbing Supply, Inc.", address: "1758 Webster Avenue, Bronx, NY", phone: "7185831600", website: "", latitude: 40.8440, longitude: -73.8977)
        ]
    }
}
