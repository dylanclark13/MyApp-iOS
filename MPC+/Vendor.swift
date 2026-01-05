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
        )
    ]
}
