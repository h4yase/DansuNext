class_name Chartset

enum Package {
    NONE,
    COMMUNITY,
    EDITOR,
    OFFICIAL,
    DLC
}

enum RankedStatus {
    NONE,
    RANKED,
    APPROVED,
    PENDING,
    UNRANKED
}

var id: int = 0
var package: Package
var charts: Array[Chart]
var folder_name: String
var ranked_status: RankedStatus = RankedStatus.NONE
var primary_chart:
    get:
        if charts.size() > 0:
            return charts[0]
        return null