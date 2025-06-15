#  WeatherApp

**The WeatherApp** project is an application that displays the current weather based on data retrieved from the internet. It is built using URLSession for performing network requests, error handling, programmatic UI layout (without Storyboards), and the MVVM (Model-View-ViewModel) pattern to separate responsibilities and organize the codebase.

## Features

-  Displaying the current weather for a given location.
-  Retrieving weather data from the network using URLSession.
-  Parsing the JSON response to extract the necessary data.
-  Updating the user interface using MVVM and data binding.
-  Handling errors during network requests or data retrieval.

## Installation

1. Clone the WeatherApp repository to your device:
            git clone https://github.com/himynameisartem/WeatherAppMVVM
2. Open the project in Xcode 
3. Build and run the project on the simulator or a physical device.

## Dependencies

    The application does not use any third-party libraries.
    Everything is implemented in Swift using standard iOS frameworks:

-  Foundation
-  UIKit
-  CoreLocation

## Usage

-  On first launch, the app will request access to your location
-  Once granted, it will display the current weather for your area
-  You can also manually enter a city name to fetch weather data for that location

The UI updates automatically upon receiving data, thanks to the MVVM pattern.

## Contact

If you have any questions, suggestions, or issues, please contact me at himynameisartem@icloud.com



#  WeatherApp

**WeatherApp** - это приложение для отображения текущей погоды на основе данных, полученных из сети. Это приложение разработано с использованием URLSession для выполнения сетевых запросов, обработки ошибок, верстки UI через код без использования Storyboard и паттерна MVVM (Model-View-ViewModel) для разделения ответственности и организации кода.

## Возможности

-  Отображение текущей погоды для заданного местоположения.
-  Получение данных о погоде из сети с использованием URLSession.
-  Парсинг JSON-ответа для извлечения необходимых данных.
-  Обновление интерфейса пользователя с помощью MVVM и обратного связывания данных.
-  Обработка ошибок при выполнении сетевых запросов или получении данных.

## Установка

1. Клонируйте репозиторий WeatherApp на свое устройство:
            git clone https://github.com/himynameisartem/WeatherAppMVVM      
2. Откройте проект в Xcode
3. Соберите и запустите проект в симуляторе или на физическом устройстве.

## Зависимости

Приложение не использует сторонние библиотеки. Все реализовано на языке Swift с применением стандартных фреймворков:

-  Foundation
-  UIKit
-  CoreLocation

## Использование

-  При первом запуске приложение запросит доступ к геолокации
-  После разрешения вы увидите текущую погоду для вашего местоположения
-  Вы также можете ввести название города вручную и получить информацию о погоде по запросу

    Интерфейс обновляется автоматически при получении данных, благодаря использованию паттерна MVVM.

## Связь

Если у вас возникли вопросы, предложения или проблемы, свяжитесь со мной по адресу himynameisartem@icloud.com


