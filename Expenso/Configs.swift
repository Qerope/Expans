//
//  Configs.swift
//  Expans
//
//  Created by Qerope31/01/21.
//

import Foundation

// App Globals
let APP_NAME = "Expans"
let APP_LINK = "https://github.com/sameersyd/Expans"
let SHARED_FROM_EXPENSO = """
    Shared from \(APP_NAME) App: \(APP_LINK)
    """

// IMAGE_ICON NAMES
let IMAGE_DELETE_ICON = "delete_icon"
let IMAGE_SHARE_ICON = "share_icon"
let IMAGE_FILTER_ICON = "filter_icon"
let IMAGE_OPTION_ICON = "settings_icon"

// User Defaults
let UD_USE_BIOMETRIC = "useBiometric"
let UD_EXPENSE_CURRENCY = "expenseCurrency"

let CURRENCY_LIST = ["₹", "$", "€", "¥", "£", "¢", "₭"]

// Transaction types
let TRANS_TYPE_INCOME = "income"
let TRANS_TYPE_EXPENSE = "expense"

// Transaction tags
let TRANS_TAG_TRANSPORT = "transport"
let TRANS_TAG_FOOD = "food"
let TRANS_TAG_HOUSING = "housing"
let TRANS_TAG_ELECTRONICS = "electronics"
let TRANS_TAG_MEDICAL = "medical"
let TRANS_TAG_SAVINGS = "savings"
let TRANS_TAG_PERSONAL = "personal"
let TRANS_TAG_ENTERTAINMENT = "entertainment"
let TRANS_TAG_INCOME = "others"
let TRANS_TAG_UTILITIES = "utilities"

func getTransTagIcon(transTag: String) -> String {
    switch transTag {
        case TRANS_TAG_TRANSPORT: return "trans_type_transport"
        case TRANS_TAG_FOOD: return "trans_type_food"
        case TRANS_TAG_HOUSING: return "trans_type_housing"
        case TRANS_TAG_ELECTRONICS: return "trans_type_electronics"
        case TRANS_TAG_MEDICAL: return "trans_type_medical"
        case TRANS_TAG_SAVINGS: return "trans_type_savings"
        case TRANS_TAG_PERSONAL: return "trans_type_personal"
        case TRANS_TAG_ENTERTAINMENT: return "trans_type_entertainment"
        case TRANS_TAG_INCOME: return "trans_type_others"
        case TRANS_TAG_UTILITIES: return "trans_type_utilities"
        default: return "trans_type_others"
    }
}

func getTransTagTitle(transTag: String) -> String {
    switch transTag {
        case TRANS_TAG_TRANSPORT: return "Transport"
        case TRANS_TAG_FOOD: return "Food"
        case TRANS_TAG_HOUSING: return "Housing"
        case TRANS_TAG_ELECTRONICS: return "Electronics"
        case TRANS_TAG_MEDICAL: return "Medical"
        case TRANS_TAG_SAVINGS: return "Savings"
        case TRANS_TAG_PERSONAL: return "Personal"
        case TRANS_TAG_ENTERTAINMENT: return "Entertainment"
        case TRANS_TAG_INCOME: return "Income"
        case TRANS_TAG_UTILITIES: return "Utilities"
        default: return "Unknown"
    }
}

func getDateFormatter(date: Date?, format: String = "yyyy-MM-dd") -> String {
    guard let date = date else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: date)
}
