//
//  Country.swift
//  MADExercises
//

import Foundation

struct Country: Decodable {
    var ID: String
    var name: String
    var currency: String
    var capital: String
    var native: String
    var continent: String
    var phone: String
    var createTime: Date
    var updateTime: Date
    var languages: [String]

    
    private enum RootCodingKeys: String, CodingKey {
        case ID = "name"
        case createTime
        case updateTime
        case fields
    }
    
    private enum NestedCodingKeys: String, CodingKey {
        case name
        case currency
        case capital
        case native
        case continent
        case phone
        case languages
    }

    private enum StringValueCodingKeys: String, CodingKey {
        case stringValue
    }

    private enum ArrayValueCodingKeys: String, CodingKey {
        case arrayValue
    }

    private enum ArrayValueNestedCodingKeys: String, CodingKey {
        case values
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        ID = (try rootContainer.decode(String.self, forKey: .ID) as NSString).lastPathComponent
        
        createTime = try rootContainer.decode(
            Date.self,
            forKey: .createTime
        )
        
        updateTime = try rootContainer.decode(
            Date.self,
            forKey: .updateTime
        )
        
        let nestedContainer = try rootContainer.nestedContainer(keyedBy: NestedCodingKeys.self, forKey: .fields)
        
        let nameContainer = try nestedContainer.nestedContainer(keyedBy: StringValueCodingKeys.self, forKey: .name)
        
        name = try nameContainer.decode(String.self, forKey: .stringValue)
        
        let currencyContainer = try nestedContainer.nestedContainer(
            keyedBy: StringValueCodingKeys.self,
            forKey: .currency
        )

        currency = try currencyContainer.decode(
            String.self,
            forKey: .stringValue
        )

        let capitalContainer = try nestedContainer.nestedContainer(
            keyedBy: StringValueCodingKeys.self,
            forKey: .capital
        )

        capital = try capitalContainer.decode(
            String.self,
            forKey: .stringValue
        )

        let nativeContainer = try nestedContainer.nestedContainer(
            keyedBy: StringValueCodingKeys.self,
            forKey: .native
        )

        native = try nativeContainer.decode(
            String.self,
            forKey: .stringValue
        )

        let continentContainer = try nestedContainer.nestedContainer(
            keyedBy: StringValueCodingKeys.self,
            forKey: .continent
        )

        continent = try continentContainer.decode(
            String.self,
            forKey: .stringValue
        )

        let phoneContainer = try nestedContainer.nestedContainer(
            keyedBy: StringValueCodingKeys.self,
            forKey: .phone
        )

        phone = try phoneContainer.decode(
            String.self,
            forKey: .stringValue
        )
        
        let languagesContainer = try nestedContainer.nestedContainer(
            keyedBy: ArrayValueCodingKeys.self,
            forKey: .languages
        )

        let arrayValueContainer = try languagesContainer.nestedContainer(
            keyedBy: ArrayValueNestedCodingKeys.self,
            forKey: .arrayValue
        )

        var valuesContainer = try arrayValueContainer.nestedUnkeyedContainer(
            forKey: .values
        )

        var decodedLanguages: [String] = []

        while !valuesContainer.isAtEnd {
            let languageContainer = try valuesContainer.nestedContainer(
                keyedBy: StringValueCodingKeys.self
            )

            let language = try languageContainer.decode(
                String.self,
                forKey: .stringValue
            )

            decodedLanguages.append(language)
        }

        languages = decodedLanguages

    }
}

struct DocumentsContainer: Decodable {
    var documents: [Country]
}
