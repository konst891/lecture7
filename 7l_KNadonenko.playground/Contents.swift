import Foundation

struct RegularCar {
    var brand: String
    var year: Int
}

enum CarShopError: Error {
    case notFound, reachedMaximumCapacity
}

extension RegularCar: CustomStringConvertible {
    var description: String {
        return """
            Car brand \(brand) was made in \(year)
            """
    }
}

class CarShop {
    var maxCars = 5
    var cars = [
        "001": RegularCar(brand: "BMW", year: 2015),
        "002": RegularCar(brand: "Toyota", year: 2016),
        "003": RegularCar(brand: "Volkswagen", year: 2020),
        "004": RegularCar(brand: "Renault", year: 2017)
    ]
    
    func getInfo(_ car: String) throws -> RegularCar {
        guard let model = cars[car] else {
            throw CarShopError.notFound
        }
        return model
    }
    
    func addCar(num: String, _ car: RegularCar) throws {
        guard cars.count < maxCars else {
            throw CarShopError.reachedMaximumCapacity
        }
        self.cars.updateValue(car, forKey: num)
    }
    
}

let cars = CarShop()
do {
    let student = try cars.getInfo("001")
    print(student.description)
} catch CarShopError.notFound {
    print("There is no car available")
}

do {
    try cars.addCar(num: "005", RegularCar(brand: "Volvo", year: 2010))
} catch CarShopError.reachedMaximumCapacity {
    print("Shop has no space available")
}

