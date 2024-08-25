//
//  BackendJSON.swift
//  WeatherAppTests
//
//  Created by Chetankumar Dobariya on 25.08.24.
//

import Foundation

func getCurrentWeatherDataDictionary() -> Data {
    let result: [String : Any] = [
            "lat": 33.07,
            "lon": -96.55,
            "timezone": "America/Chicago",
            "timezone_offset": -18000,
            "current": [
                "dt": 1724472927,
                "sunrise": 1724414110,
                "sunset": 1724461356,
                "temp": 84.45,
                "feels_like": 91.11,
                "pressure": 1016,
                "humidity": 69,
                "dew_point": 73.17,
                "uvi": 0,
                "clouds": 0,
                "visibility": 10000,
                "wind_speed": 11.5,
                "wind_deg": 160,
                "weather": [
                    [
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01n"
                    ]
                ]
            ],
            "hourly": [
                [
                    "dt": 1724472000,
                    "temp": 84.45,
                    "feels_like": 91.11,
                    "pressure": 1016,
                    "humidity": 69,
                    "dew_point": 73.17,
                    "uvi": 0,
                    "clouds": 0,
                    "visibility": 10000,
                    "wind_speed": 14.47,
                    "wind_deg": 164,
                    "wind_gust": 27.31,
                    "weather": [
                        [
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        ]
                    ],
                    "pop": 0.8
                ],
                [
                    "dt": 1724475600,
                    "temp": 84.34,
                    "feels_like": 90.55,
                    "pressure": 1016,
                    "humidity": 68,
                    "dew_point": 72.63,
                    "uvi": 0,
                    "clouds": 8,
                    "visibility": 10000,
                    "wind_speed": 13.18,
                    "wind_deg": 180,
                    "wind_gust": 26.31,
                    "weather": [
                        [
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        ]
                    ],
                    "pop": 0.8
                ]
            ],
            "daily": [
                [
                    "dt": 1724436000,
                    "sunrise": 1724414110,
                    "sunset": 1724461356,
                    "moonrise": 1724470380,
                    "moonset": 1724429820,
                    "moon_phase": 0.65,
                    "summary": "Expect a day of partly cloudy with rain",
                    "temp": [
                        "day": 99.12,
                        "min": 74.97,
                        "max": 105.48,
                        "night": 84.45,
                        "eve": 97.56,
                        "morn": 74.97
                    ],
                    "feels_like": [
                        "day": 105.85,
                        "night": 91.11,
                        "eve": 104,
                        "morn": 75.78
                    ],
                    "pressure": 1015,
                    "humidity": 38,
                    "dew_point": 69.3,
                    "wind_speed": 18.61,
                    "wind_deg": 159,
                    "wind_gust": 32.06,
                    "weather": [
                        [
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        ]
                    ],
                    "clouds": 3,
                    "pop": 1,
                    "rain": 2.09,
                    "uvi": 9.58
                ],
                [
                    "dt": 1724522400,
                    "sunrise": 1724500550,
                    "sunset": 1724547684,
                    "moonrise": 1724558940,
                    "moonset": 1724520420,
                    "moon_phase": 0.69,
                    "summary": "Expect a day of partly cloudy with rain",
                    "temp": [
                        "day": 96.98,
                        "min": 79.9,
                        "max": 101.5,
                        "night": 89.8,
                        "eve": 99.37,
                        "morn": 79.9
                    ],
                    "feels_like": [
                        "day": 99.34,
                        "night": 88.9,
                        "eve": 99.18,
                        "morn": 79.9
                    ],
                    "pressure": 1017,
                    "humidity": 34,
                    "dew_point": 64.2,
                    "wind_speed": 13.89,
                    "wind_deg": 186,
                    "wind_gust": 26.31,
                    "weather": [
                        [
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        ]
                    ],
                    "clouds": 46,
                    "pop": 1,
                    "rain": 1.27,
                    "uvi": 9.6
                ],
                [
                    "dt": 1724608800,
                    "sunrise": 1724586991,
                    "sunset": 1724634011,
                    "moonrise": 1724647800,
                    "moonset": 1724611080,
                    "moon_phase": 0.73,
                    "summary": "Expect a day of partly cloudy with clear spells",
                    "temp": [
                        "day": 97.29,
                        "min": 81.34,
                        "max": 98.74,
                        "night": 86.5,
                        "eve": 93.33,
                        "morn": 81.34
                    ],
                    "feels_like": [
                        "day": 97.84,
                        "night": 86.97,
                        "eve": 93.85,
                        "morn": 83.05
                    ],
                    "pressure": 1018,
                    "humidity": 30,
                    "dew_point": 61.21,
                    "wind_speed": 9.91,
                    "wind_deg": 159,
                    "wind_gust": 20.24,
                    "weather": [
                        [
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        ]
                    ],
                    "clouds": 12,
                    "pop": 0.28,
                    "uvi": 9.53
                ],
                [
                    "dt": 1724695200,
                    "sunrise": 1724673431,
                    "sunset": 1724720337,
                    "moonrise": 0,
                    "moonset": 1724701620,
                    "moon_phase": 0.75,
                    "summary": "Expect a day of partly cloudy with clear spells",
                    "temp": [
                        "day": 96.26,
                        "min": 78.3,
                        "max": 98.04,
                        "night": 89.38,
                        "eve": 97.66,
                        "morn": 78.3
                    ],
                    "feels_like": [
                        "day": 97.16,
                        "night": 89.49,
                        "eve": 96.26,
                        "morn": 78.93
                    ],
                    "pressure": 1018,
                    "humidity": 32,
                    "dew_point": 61.97,
                    "wind_speed": 13.22,
                    "wind_deg": 175,
                    "wind_gust": 27.81,
                    "weather": [
                        [
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        ]
                    ],
                    "clouds": 12,
                    "pop": 0,
                    "uvi": 8.85
                ],
                [
                    "dt": 1724781600,
                    "sunrise": 1724759871,
                    "sunset": 1724806663,
                    "moonrise": 1724737020,
                    "moonset": 1724791920,
                    "moon_phase": 0.8,
                    "summary": "Expect a day of partly cloudy with rain",
                    "temp": [
                        "day": 98.31,
                        "min": 80.33,
                        "max": 100.85,
                        "night": 80.33,
                        "eve": 89.91,
                        "morn": 80.67
                    ],
                    "feels_like": [
                        "day": 99.48,
                        "night": 82.58,
                        "eve": 90.88,
                        "morn": 82.63
                    ],
                    "pressure": 1017,
                    "humidity": 30,
                    "dew_point": 62.06,
                    "wind_speed": 11.99,
                    "wind_deg": 88,
                    "wind_gust": 20.31,
                    "weather": [
                        [
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        ]
                    ],
                    "clouds": 10,
                    "pop": 1,
                    "rain": 2.2,
                    "uvi": 9.2
                ]
            ],
            "alerts": [
                [
                    "sender_name": "NWS Fort Worth TX",
                    "event": "Heat Advisory",
                    "start": 1724466060,
                    "end": 1724551200,
                    "description": "* WHAT...Heat index values up to 107.\n\n* WHERE...A portion of north central Texas.\n\n* WHEN...Until 9 PM CDT Saturday.\n\n* IMPACTS...Hot temperatures and high humidity will increase the\nrisk for heat-related illnesses to occur, particularly for those\nworking or participating in outdoor activities.",
                    "tags": [
                        "Extreme high temperature"
                    ]
                ]
            ]
        
    ]
    return try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
}

func getCityDataDictionary() -> Data {
    
    let result: [[String : Any]] = [
        [
            "name": "Munich",
            "local_names": [
                "uk": "Мюнхен",
                "kk": "Мюнхен",
                "fr": "Munich",
                "zh": "慕尼黑",
                "ka": "მიუნხენი",
                "feature_name": "Munich",
                "pl": "Monachium",
                "be": "Мюнхен",
                "nl": "München",
                "ca": "Munic",
                "da": "München",
                "pt": "Munique",
                "eo": "Munkeno",
                "lv": "Minhene",
                "cs": "Mnichov",
                "es": "Múnich",
                "lt": "Miunchenas",
                "ar": "ميونخ",
                "kn": "ಮುನಿಕ್",
                "en": "Munich",
                "it": "Monaco",
                "ta": "மியூனிக்",
                "mk": "Минхен",
                "bg": "Мюнхен",
                "ja": "ミュンヘン",
                "tr": "Münih",
                "fy": "München",
                "sr": "Минхен",
                "sk": "Mníchov",
                "oc": "Munic",
                "hi": "म्यूनिख",
                "fa": "مونیخ",
                "ascii": "Munich",
                "ru": "Мюнхен",
                "hr": "München",
                "gl": "Múnic",
                "de": "München",
                "la": "Monacum",
                "vi": "München",
                "az": "Münhen",
                "eu": "Munich",
                "bs": "Minhen",
                "el": "Μόναχο",
                "ur": "میونخ",
                "hy": "Մյունխեն",
                "uz": "Munhen",
                "fi": "München",
                "ko": "뮌헨",
                "he": "מינכן",
                "sh": "München"
            ],
            "lat": 48.1371079,
            "lon": 11.5753822,
            "country": "DE",
            "state": "Bavaria"
        ]
        
    ]
    return try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
}
