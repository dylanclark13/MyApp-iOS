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
        ),
        Vendor(
            name: "F.W. Webb Company",
            address: "2350 12th Avenue, New York, NY",
            phone: "646-428-3944",
            website: "fwwebb.com",
            latitude: 40.820482,
            longitude: -73.958741,
            notes: nil
        ),
        Vendor(
            name: "General Plumbing Supply",
            address: "1164 Castleton Avenue, Staten Island, NY",
            phone: "718-885-8900",
            website: "generalplumbingsupply.net",
            latitude: 40.633965,
            longitude: -74.123638,
            notes: nil
        ),
        Vendor(
            name: "Gil Meyerowitz, Inc.",
            address: "70-22 Cypress Hills Street, Ridgewood, NY",
            phone: "718-821-6200",
            website: "meyerowitzsupply.com",
            latitude: 40.702333,
            longitude: -73.893958,
            notes: nil
        ),
        Vendor(
            name: "H.C. Oswald Supply Co., Inc.",
            address: "725 Whittier Street, Bronx, NY",
            phone: "718-620-1400",
            website: "oswaldsupply.com",
            latitude: 40.815506,
            longitude: -73.884001,
            notes: nil
        ),
        Vendor(
            name: "Heating & Burner Supply",
            address: "479 Walton Avenue, Bronx, NY",
            phone: "718-665-0006",
            website: "heatingandburner.com",
            latitude: 40.817883,
            longitude: -73.928705,
            notes: nil
        ),
        Vendor(
            name: "Holby Valve, Inc.",
            address: "24 Ferdon Street, Newark, NJ",
            phone: "212-838-6363",
            website: "holby.com",
            latitude: 40.718832,
            longitude: -74.155340,
            notes: nil
        ),
        Vendor(
            name: "Johnstone Supply",
            address: "845 E 138th Street, Bronx, NY",
            phone: "718-402-3707",
            website: "johnstonesupply.com",
            latitude: 40.803249,
            longitude: -73.908853,
            notes: nil
        ),
        Vendor(
            name: "Mechanical Heating Supply Inc.",
            address: "476 Timpson Place, Bronx, NY",
            phone: "718-402-9765",
            website: "mechheat.com",
            latitude: 40.810199,
            longitude: -73.905527,
            notes: nil
        ),
        Vendor(
            name: "New York Replacement Parts Corp",
            address: "1462 Lexington Avenue, New York, NY",
            phone: "914-965-0122",
            website: "nyrpcorp.com",
            latitude: 40.784989,
            longitude: -73.951751,
            notes: nil
        ),
        Vendor(
            name: "Nuthouse Hardware",
            address: "202 East 29th Street, New York, NY",
            phone: "212-545-1447",
            website: "nuthousehardware.com",
            latitude: 40.742279,
            longitude: -73.979968,
            notes: nil
        ),
        Vendor(
            name: "Pronto Gas Heating Supply Co",
            address: "681 East 136th Street, Bronx, NY",
            phone: "718-292-0707",
            website: "prontosupplies.com",
            latitude: 40.804007,
            longitude: -73.914566,
            notes: nil
        ),
        Vendor(
            name: "Pronto Gas Heating Supply Co",
            address: "181 Chrystie Street, New York, NY",
            phone: "212-777-3366",
            website: "prontosupplies.com",
            latitude: 40.721586,
            longitude: -73.992261,
            notes: nil
        ),
        Vendor(
            name: "Ranger Supply Co.",
            address: "3137 Bailey Avenue, Bronx, NY",
            phone: "718-543-6666",
            website: "rangersupplycompany.com",
            latitude: 40.879276,
            longitude: -73.901628,
            notes: nil
        ),
        Vendor(
            name: "W.W. Grainger, Inc.",
            address: "New York, NY",
            phone: "212-629-5660",
            website: "grainger.com",
            latitude: 40.752726,
            longitude: -73.977229,
            notes: nil
        ),
        Vendor(
            name: "Washington Plumbing Supply",
            address: "4290 Third Avenue, Bronx, NY",
            phone: "718-583-4400",
            website: "",
            latitude: 40.848690,
            longitude: -73.894949,
            notes: nil
        ),
        Vendor(
            name: "Webster Plumbing Supply, Inc.",
            address: "1758 Webster Avenue, Bronx, NY",
            phone: "718-583-1600",
            website: "websterplumbingsupply.com",
            latitude: 40.845273,
            longitude: -73.902083,
            notes: nil
        ),
        Vendor(
            name: "AMAF Supply",
            address: "53-13 Van Dam Street, Long Island City, NY",
            phone: "718-358-1100",
            website: "amafsupplyinc.com",
            latitude: 40.735145,
            longitude: -73.937095,
            notes: nil
        ),
        Vendor(
            name: "AMAF Supply",
            address: "210-23 Horace Harding Expressway, Queens, NY",
            phone: "",
            website: "amafsupplyinc.com",
            latitude: 40.746584,
            longitude: -73.766244,
            notes: nil
        ),
        Vendor(
            name: "Bayside Plumbing",
            address: "211-20 Northern Blvd, Bayside, NY",
            phone: "718-229-8330",
            website: "",
            latitude: 40.759718,
            longitude: -73.771054,
            notes: nil
        ),
        Vendor(
            name: "C&L Plumbing Supply",
            address: "196 Merrick Road, Valley Stream, NY",
            phone: "516-561-6000",
            website: "candlplumbingsupply.com",
            latitude: 40.653737,
            longitude: -73.557045,
            notes: nil
        ),
        Vendor(
            name: "Christ Plumbing Supply",
            address: "1310 Jericho Turnpike, New Hyde Park, NY",
            phone: "516-328-0499",
            website: "fore-kastsales.com",
            latitude: 40.733010,
            longitude: -73.682086,
            notes: nil
        ),
        Vendor(
            name: "DJ Plumbing",
            address: "25-92 31st Street, Astoria, NY",
            phone: "718-274-8600",
            website: "djsplumbing.com",
            latitude: 40.768526,
            longitude: -73.920118,
            notes: nil
        ),
        Vendor(
            name: "Great Neck Plumbing",
            address: "404 Northern Blvd, Great Neck, NY",
            phone: "516-773-0111",
            website: "greatneckplumbingsupply.com",
            latitude: 40.787361,
            longitude: -73.731893,
            notes: nil
        ),
        Vendor(
            name: "Green Art",
            address: "65 South Columbus Ave, Freeport, NY",
            phone: "516-379-0449",
            website: "greenartplumbing.com",
            latitude: 40.656383,
            longitude: -73.578102,
            notes: nil
        ),
        Vendor(
            name: "Green Art",
            address: "1576 County Road 39, Southampton, NY",
            phone: "631-488-4210",
            website: "greenartplumbing.com",
            latitude: 40.894720,
            longitude: -72.451081,
            notes: nil
        ),
        Vendor(
            name: "J&J Heating Supply",
            address: "10 Roselle Street, Mineola, NY",
            phone: "516-801-0212",
            website: "",
            latitude: 40.753832,
            longitude: -73.637975,
            notes: nil
        ),
        Vendor(
            name: "LI Pipe Supply",
            address: "586 Commercial Avenue, Garden City, NY",
            phone: "516-222-8008",
            website: "lipipe.com",
            latitude: 40.728982,
            longitude: -73.610619,
            notes: nil
        ),
        Vendor(
            name: "LI Pipe Supply",
            address: "58-58 56th Street, Maspeth, NY",
            phone: "718-456-7877",
            website: "lipipe.com",
            latitude: 40.718578,
            longitude: -73.913280,
            notes: nil
        ),
        Vendor(
            name: "LI Pipe Supply",
            address: "729 Hicks Street, Brooklyn, NY",
            phone: "718-669-7600",
            website: "lipipe.com",
            latitude: 40.677719,
            longitude: -74.004070,
            notes: nil
        ),
        Vendor(
            name: "M&M Heating Supply",
            address: "213-09 Jamaica Avenue, Queens Village, NY",
            phone: "718-341-3060",
            website: "mmplumbingny.com",
            latitude: 40.716388,
            longitude: -73.744474,
            notes: nil
        ),
        Vendor(
            name: "Mayer Malbin",
            address: "62-25 30th Avenue, Woodside, NY",
            phone: "718-937-5100",
            website: "mayermalbin.com",
            latitude: 40.759906,
            longitude: -73.900132,
            notes: nil
        ),
        Vendor(
            name: "Northeast Plumbing",
            address: "393 Jericho Turnpike, Mineola, NY",
            phone: "516-487-6868",
            website: "",
            latitude: 40.745102,
            longitude: -73.652312,
            notes: nil
        ),
        Vendor(
            name: "Quentzel Plumbing",
            address: "379 Throop Avenue, Brooklyn, NY",
            phone: "718-455-6600",
            website: "quentzel.com",
            latitude: 40.690385,
            longitude: -73.942276,
            notes: nil
        ),
        Vendor(
            name: "Viking Supply",
            address: "56-75 49th Street, Maspeth, NY",
            phone: "973-541-2320",
            website: "supplynet.com",
            latitude: 40.725411,
            longitude: -73.919511,
            notes: nil
        ),
        Vendor(
            name: "Franks Plumbing Supply",
            address: "Long Island, NY",
            phone: "516-371-3100",
            website: "frankplumbingsupply.com",
            latitude: 40.709947,
            longitude: -73.654901,
            notes: nil
        ),
        Vendor(
            name: "Total Plumbing Supply",
            address: "Brooklyn, NY",
            phone: "718-377-1900",
            website: "totalplumbingsupply.com",
            latitude: 40.678178,
            longitude: -73.944158,
            notes: nil
        ),
        Vendor(
            name: "Plumbing Exchange",
            address: "182 10th Street, Brooklyn, NY",
            phone: "718-499-6700",
            website: "tpeny.com",
            latitude: 40.668042,
            longitude: -73.990014,
            notes: nil
        ),
        Vendor(
            name: "Park Slope Plumbing Supply",
            address: "601 5th Avenue, Brooklyn, NY",
            phone: "732-673-1674",
            website: "psps601.com",
            latitude: 40.660204,
            longitude: -73.989598,
            notes: nil
        )
    ]
}
