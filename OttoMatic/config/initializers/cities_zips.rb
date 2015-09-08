city_info = []
names = []
zips = []
cities = {}
IO.foreach("public/cities.txt") do |f|
  city_info << f.to_s.strip
end
city_info.sort!
city_info.each do |city|
  temp = city.split("  ")
  zips << temp[0]
  names << temp[1]
  cities[temp[0]] = temp[1]
end

ZIP_CODES = zips
CITY_NAMES = names
CITIES = cities

APPLIANCE_BRAND = ['bosch', 'ge', 'insinkerator', 'kenmore', 'kitchenaid',
  'maytag', 'thermador', 'whirlpool']

APPLIANCE_KIND = [ 'cooktop', 'dishwasher', 'disposal', 'dryer', 'faucet',
  'hood', 'hot water dispenser', 'microwave', 'oven', 'range', 'washer' ]

STREET_SUFFIX_NAME = ["Alley", "Annex", "Arcade", "Avenue", "Bayou", "Beach",
  "Bend", "Bluff", "Bottom", "Boulevard", "Branch", "Bridge", "Brook",
  "Burg", "Bypass", "Camp", "Canyon", "Cape", "Causeway", "Center", "Circle",
  "Cliffs", "Club", "Corner", "Corners", "Course", "Court", "Courts", "Cove",
  "Creek", "Crescent", "Crossing", "Dale", "Dam", "Divide", "Drive", "Estates",
  "Expressway", "Extension", "Fall", "Falls", "Ferry", "Field", "Fields",
  "Flats", "Ford", "Forest", "Forge", "Fork", "Forks", "Fort", "Freeway",
  "Gardens", "Gateway", "Glen", "Green", "Grove", "Harbor", "Haven", "Heights",
  "Highway", "Hill", "Hills", "Hollow", "Inlet", "Island", "Islands", "Isle",
  "Junction", "Key", "Knolls", "Lake", "Lakes", "Landing", "Lane", "Light",
  "Loaf", "Locks", "Lodge", "Loop", "Mall", "Manor", "Meadows", "Mill", "Mills",
  "Mission", "Mount", "Mountain", "Neck", "Orchard", "Oval", "Park", "Parkway",
  "Pass", "Path", "Pike", "Pines", "Plain", "Plains", "Plaza", "Point", "Port",
  "Prairie", "Radial", "Ranch", "Rapids", "Rest", "Ridge", "River", "Road", "Row",
  "Run", "Shoal", "Shoals", "Shore", "Shores", "Spring", "Springs", "Spur", "Square",
  "Station", "Stravenues", "Stream", "Street", "Summit", "Terrace", "Trace", "Track",
  "Trail", "Trailer", "Tunnel", "Turnpike", "Union", "Valle", "View", "Village",
  "Ville", "Vista", "Walk", "Way", "Wells"]

STREET_SUFFIX_ABREV = ["ALY", "ANX", "ARC", "AVE", "YU", "BCH", "BND", "BLF",
  "BTM", "BLVD", "BR", "BRG", "BRK", "BG", "BYP", "CP", "CYN", "CPE",
  "CSWY", "CTR", "CIR", "CLFS", "CLB", "COR", "CORS", "CRSE", "CT",
  "CTS", "CV", "CRK", "CRES", "XING", "DL", "DM", "DV", "DR", "EST",
  "EXPY", "EXT", "FALL", "FLS", "FRY", "FLD", "FLDS", "FLT", "FOR",
  "FRST", "FGR", "FORK", "FRKS", "FT", "FWY", "GDNS", "GTWY", "GLN",
  "GN", "GRV", "HBR", "HVN", "HTS", "HWY", "HL", "HLS", "HOLW", "INLT",
  "IS", "ISS", "ISLE", "JCT", "CY", "KNLS", "LK", "LKS", "LNDG", "LN",
  "LGT", "LF", "LCKS", "LDG", "LOOP", "MALL", "MNR", "MDWS", "ML", "MLS",
  "MSN", "MT", "MTN", "NCK", "ORCH", "OVAL", "PARK", "PKY", "PASS", "PATH",
  "PIKE", "PNL", "PLN", "PLNS", "PLZ", "PT", "PRT", "PR", "RADL", "RNCH",
  "RPDS", "RST", "RDG", "RIV", "RD", "ROW", "RUN", "SHL", "SHLS", "SHR",
  "SHRS", "SPG", "SPGS", "SPUR", "SQ", "STA", "STRA", "STRM", "ST", "SMT",
  "TER", "TRCE", "TRAK", "TRL", "TRLR", "TUNL", "TPKE", "UN", "VIA", "VW",
  "VLG", "VL", "VIS", "WALK", "WAY", "WLS"]

STREET_SUFFIX = {"ALY"=>"Alley", "ANX"=>"Annex", "ARC"=>"Arcade",
  "AVE"=>"Avenue", "YU"=>"Bayou", "BCH"=>"Beach", "BND"=>"Bend",
  "BLF"=>"Bluff", "BTM"=>"Bottom", "BLVD"=>"Boulevard", "BR"=>"Branch",
  "BRG"=>"Bridge", "BRK"=>"Brook", "BG"=>"Burg", "BYP"=>"Bypass",
  "CP"=>"Camp", "CYN"=>"Canyon", "CPE"=>"Cape", "CSWY"=>"Causeway",
  "CTR"=>"Center", "CIR"=>"Circle", "CLFS"=>"Cliffs", "CLB"=>"Club",
  "COR"=>"Corner", "CORS"=>"Corners", "CRSE"=>"Course", "CT"=>"Court",
  "CTS"=>"Courts", "CV"=>"Cove", "CRK"=>"Creek", "CRES"=>"Crescent",
  "XING"=>"Crossing", "DL"=>"Dale", "DM"=>"Dam", "DV"=>"Divide",
  "DR"=>"Drive", "EST"=>"Estates", "EXPY"=>"Expressway",
  "EXT"=>"Extension", "FALL"=>"Fall", "FLS"=>"Falls", "FRY"=>"Ferry",
  "FLD"=>"Field", "FLDS"=>"Fields", "FLT"=>"Flats", "FOR"=>"Ford",
  "FRST"=>"Forest", "FGR"=>"Forge", "FORK"=>"Fork", "FRKS"=>"Forks",
  "FT"=>"Fort", "FWY"=>"Freeway", "GDNS"=>"Gardens", "GTWY"=>"Gateway",
  "GLN"=>"Glen", "GN"=>"Green", "GRV"=>"Grove", "HBR"=>"Harbor",
  "HVN"=>"Haven", "HTS"=>"Heights", "HWY"=>"Highway", "HL"=>"Hill",
  "HLS"=>"Hills", "HOLW"=>"Hollow", "INLT"=>"Inlet", "IS"=>"Island",
  "ISS"=>"Islands", "ISLE"=>"Isle", "JCT"=>"Junction", "CY"=>"Key",
  "KNLS"=>"Knolls", "LK"=>"Lake", "LKS"=>"Lakes", "LNDG"=>"Landing",
  "LN"=>"Lane", "LGT"=>"Light", "LF"=>"Loaf", "LCKS"=>"Locks", "LDG"=>"Lodge",
  "LOOP"=>"Loop", "MALL"=>"Mall", "MNR"=>"Manor", "MDWS"=>"Meadows",
  "ML"=>"Mill", "MLS"=>"Mills", "MSN"=>"Mission", "MT"=>"Mount",
  "MTN"=>"Mountain", "NCK"=>"Neck", "ORCH"=>"Orchard", "OVAL"=>"Oval",
  "PARK"=>"Park", "PKY"=>"Parkway", "PASS"=>"Pass", "PATH"=>"Path",
  "PIKE"=>"Pike", "PNL"=>"Pines", "PLN"=>"Plain", "PLNS"=>"Plains",
  "PLZ"=>"Plaza", "PT"=>"Point", "PRT"=>"Port", "PR"=>"Prairie",
  "RADL"=>"Radial", "RNCH"=>"Ranch", "RPDS"=>"Rapids", "RST"=>"Rest",
  "RDG"=>"Ridge", "RIV"=>"River", "RD"=>"Road", "ROW"=>"Row", "RUN"=>"Run",
  "SHL"=>"Shoal", "SHLS"=>"Shoals", "SHR"=>"Shore", "SHRS"=>"Shores",
  "SPG"=>"Spring", "SPGS"=>"Springs", "SPUR"=>"Spur", "SQ"=>"Square",
  "STA"=>"Station", "STRA"=>"Stravenues", "STRM"=>"Stream", "ST"=>"Street",
  "SMT"=>"Summit", "TER"=>"Terrace", "TRCE"=>"Trace", "TRAK"=>"Track",
  "TRL"=>"Trail", "TRLR"=>"Trailer", "TUNL"=>"Tunnel", "TPKE"=>"Turnpike",
  "UN"=>"Union", "VIA"=>"Valle", "VW"=>"View", "VLG"=>"Village", "VL"=>"Ville",
  "VIS"=>"Vista", "WALK"=>"Walk", "WAY"=>"Way", "WLS"=>"Wells"}
