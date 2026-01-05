import Foundation
import CoreLocation

struct Vendor: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let phone: String
    let website: String
    let latitude: Double
    let longitude: Double
    let notes: String?
}

extension Vendor {

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }

    var websiteWithScheme: String {
        if website.hasPrefix("http://") || website.hasPrefix("https://") {
            return website
        }
        return "https://" + website
    }

    static let sampleData: [Vendor] = [
        Vendor(
            name: "AF Supply Corp",
            address: "942 Lafayette Avenue, Brooklyn, NY",
            phone: "718-443-6900",
            website: "afsupply.com",
            latitude: 40.691693,
            longitude: -73.934629,
            notes: nil
        ),
        Vendor(
            name: "Bruce Supply",
            address: "8805 18th Avenue, Brooklyn, NY",
            phone: "718-259-4900",
            website: "brucesupplies.com",
            latitude: 40.602942,
            longitude: -74.006945,
            notes: nil
        ),
        Vendor(
            name: "AM/PM Supply",
            address: "2293 Second Avenue, New York, NY",
            phone: "718-381-2845",
            website: "ampmsupply.com",
            latitude: 40.803109,
            longitude: -73.933908,
            notes: nil
        ),
        Vendor(
            name: "AM/PM Supply",
            address: "59-23 55th Street, Queens, NY",
            phone: "718-381-2845",
            website: "ampmsupply.com",
            latitude: 40.716732,
            longitude: -73.913012,
            notes: nil
        ),
        Vendor(
            name: "Allied Sprinkler Corp.",
            address: "118 West 18th Street, New York, NY",
            phone: "212-675-8062",
            website: "alliedsprinklerco.com",
            latitude: 40.741021,
            longitude: -73.995334,
            notes: nil
        ),
        Vendor(
            name: "Central Plumbing Specialties",
            address: "3619 White Plains Road, Bronx, NY",
            phone: "718-798-9799",
            website: "centralplumbingspec.com",
            latitude: 40.847431,
            longitude: -73.868889,
            notes: nil
        ),
        Vendor(
            name: "Central Plumbing Specialties",
            address: "1250 Park Avenue, New York, NY",
            phone: "212-722-2975",
            website: "centralplumbingspec.com",
            latitude: 40.785091,
            longitude: -73.952835,
            notes: nil
        ),
        Vendor(
            name: "City Water Meter Repair Co. Inc",
            address: "526 East 13th Street, New York, NY",
            phone: "212-473-7296",
            website: "citywatermeterrepair.com",
            latitude: 40.729117,
            longitude: -73.979659,
            notes: nil
        ),
        Vendor(
            name: "Coastal Supply Group",
            address: "38-16 Skillman Avenue, Queens, NY",
            phone: "718-942-3300",
            website: "coastalsupplygroup.com",
            latitude: 40.747370,
            longitude: -73.926016,
            notes: nil
        ),
        Vendor(
            name: "Coastal Supply Group",
            address: "135 New Dorp Lane, Staten Island, NY",
            phone: "718-979-0011",
            website: "coastalsupplygroup.com",
            latitude: 40.556436,
            longitude: -74.211471,
            notes: nil
        ),
        Vendor(
            name: "F.W. Webb Company",
            address: "919 Southern Blvd, Bronx, NY",
            phone: "718-378-1010",
            website: "fwwebb.com",
            latitude: 40.820145,
            longitude: -73.892516,
            notes: nil
        ),
        Vendor(
            name: "F.W. Webb Company",
            address: "13 West 24th Street, New York, NY",
            phone: "212-255-1200",
            website: "fwwebb.com",
            latitude: 40.742826,
            longitude: -73.990257,
            notes: nil
        )
    ]
}
