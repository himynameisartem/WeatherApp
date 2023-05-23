//
//  WeatherTodayViewController.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import UIKit

class WeatherTodayViewController: UIViewController {
    
    private var todayView: UIView!
    private var gradient: CAGradientLayer!
    private var searchButton: UIButton!
    private var currentLocationButton: UIButton!
    private var choiseCityTextField: UITextField!
    private var cityNameLabel: UILabel!
    private var weatherImage: UIImageView!
    private var temperatureLabel: UILabel!
    private var degreeSign: UILabel!
    private var weatherDescriptionLabel: UILabel!
    private var dateLabel: UILabel!
    private var separatorView: UIView!
    private var windStackView: UIStackView!
    private var windImageView: UIImageView!
    private var windOptionLabel: UILabel!
    private var windNameLabel: UILabel!
    private var humidityStackView: UIStackView!
    private var humidityImageView: UIImageView!
    private var humidityOptionLabel: UILabel!
    private var humidityNameLabel: UILabel!
    private var chanceOfRainStackView: UIStackView!
    private var chanceOfRainImageView: UIImageView!
    private var chanceOfRainOptionLabel: UILabel!
    private var chanceOfRainNameLabel: UILabel!
    private var allDetailStackView: UIStackView!
    private var todayLabel: UILabel!
    private var sevenDaysButton: UIButton!
    private var allHoursCollectionView: UICollectionView!
    private var layout: UICollectionViewFlowLayout!

    
    var viewModel: WeatherTodayViewModelProtocol! {
        didSet {
            viewModel.fetchWeather {
                guard let weather = self.viewModel.weather?.currentConditions else { return }
                DispatchQueue.main.async {
                    self.cityNameLabel.text = self.viewModel.weather?.resolvedAddress ?? ""
                    self.temperatureLabel.text = String(weather.temp ?? 0.0)
                    self.weatherDescriptionLabel.text = weather.conditions ?? "error"
                    self.windOptionLabel.text = "\(String(weather.windspeed ?? 0.0)) km/h"
                    self.humidityOptionLabel.text = "\(String(weather.humidity ?? 0.0))%"
                    self.chanceOfRainOptionLabel.text = "\(String(weather.precipprob ?? 0.0))%"
                    self.weatherImage.image = UIImage(named: weather.icon ?? "")
                    self.dateLabel.text = DateManager.shared.todayDate(type: .full)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = WeatherTodayViewModel()
        
        setupUI()
        setupProperties()
        setupConstraints()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = todayView.bounds
    }
    
    private func setupUI() {
        todayView = UIView()
        gradient = CAGradientLayer()
        searchButton = UIButton()
        currentLocationButton = UIButton()
        choiseCityTextField = UITextField()
        cityNameLabel = UILabel()
        weatherImage = UIImageView()
        temperatureLabel = UILabel()
        degreeSign = UILabel()
        weatherDescriptionLabel = UILabel()
        dateLabel = UILabel()
        separatorView = UIView()
        windStackView = UIStackView()
        windImageView = UIImageView()
        windOptionLabel = UILabel()
        windNameLabel = UILabel()
        humidityStackView = UIStackView()
        humidityImageView = UIImageView()
        humidityOptionLabel = UILabel()
        humidityNameLabel = UILabel()
        chanceOfRainStackView = UIStackView()
        chanceOfRainImageView = UIImageView()
        chanceOfRainOptionLabel = UILabel()
        chanceOfRainNameLabel = UILabel()
        allDetailStackView = UIStackView()
        todayLabel = UILabel()
        sevenDaysButton = UIButton()
        layout = UICollectionViewFlowLayout()
        allHoursCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(todayView)
        todayView.layer.addSublayer(gradient)
        todayView.addSubview(searchButton)
        todayView.addSubview(currentLocationButton)
        todayView.addSubview(choiseCityTextField)
        todayView.addSubview(cityNameLabel)
        todayView.addSubview(weatherImage)
        todayView.addSubview(temperatureLabel)
        todayView.addSubview(degreeSign)
        todayView.addSubview(weatherDescriptionLabel)
        todayView.addSubview(dateLabel)
        todayView.addSubview(separatorView)
        todayView.addSubview(windStackView)
        windStackView.addArrangedSubview(windImageView)
        windStackView.addArrangedSubview(windOptionLabel)
        windStackView.addArrangedSubview(windNameLabel)
        todayView.addSubview(humidityStackView)
        humidityStackView.addArrangedSubview(humidityImageView)
        humidityStackView.addArrangedSubview(humidityOptionLabel)
        humidityStackView.addArrangedSubview(humidityNameLabel)
        todayView.addSubview(chanceOfRainStackView)
        chanceOfRainStackView.addArrangedSubview(chanceOfRainImageView)
        chanceOfRainStackView.addArrangedSubview(chanceOfRainOptionLabel)
        chanceOfRainStackView.addArrangedSubview(chanceOfRainNameLabel)
        todayView.addSubview(allDetailStackView)
        allDetailStackView.addArrangedSubview(windStackView)
        allDetailStackView.addArrangedSubview(humidityStackView)
        allDetailStackView.addArrangedSubview(chanceOfRainStackView)
        view.addSubview(todayLabel)
        view.addSubview(sevenDaysButton)
        view.addSubview(allHoursCollectionView)
        
        choiseCityTextField.delegate = self
    }
    
    private func setupProperties() {
        
        let topColor = #colorLiteral(red: 0.08297913522, green: 0.7363885045, blue: 0.9625709653, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.06859397143, green: 0.4181304872, blue: 0.9508929849, alpha: 1).cgColor
        gradient.colors = [topColor, bottomColor]
        gradient.locations = [0, 1]
        todayView.translatesAutoresizingMaskIntoConstraints = false
        todayView.layer.cornerRadius = 42
        todayView.backgroundColor = .blue
        todayView.clipsToBounds = true
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        currentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        currentLocationButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
        currentLocationButton.tintColor = .white
        currentLocationButton.addTarget(self, action: #selector(currentLocation), for: .touchUpInside)
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = UIFont(name: "helvetica-bold", size: 26)
        cityNameLabel.textColor = .white
        cityNameLabel.numberOfLines = 2
        cityNameLabel.adjustsFontSizeToFitWidth = true
        cityNameLabel.minimumScaleFactor = 0.5
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.image = UIImage(named: "partly-cloudy")
        weatherImage.contentMode = .scaleAspectFit
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont(name: "helvetica-bold", size: 90)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        
        degreeSign.translatesAutoresizingMaskIntoConstraints = false
        degreeSign.font = UIFont(name: "helvetica", size: 70)
        degreeSign.textColor = .white
        degreeSign.alpha = 0.5
        degreeSign.text = "°"
        
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherDescriptionLabel.font = UIFont(name: "helvetica-bold", size: 26)
        weatherDescriptionLabel.textColor = .white
        weatherDescriptionLabel.textAlignment = .center
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont(name: "helvetica", size: 16)
        dateLabel.textColor = .white
        dateLabel.alpha = 0.5
        dateLabel.textAlignment = .center
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .systemGray5
        separatorView.alpha = 0.1
        
        choiseCityTextField.translatesAutoresizingMaskIntoConstraints = false
        choiseCityTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2200693295)
        choiseCityTextField.textAlignment = .center
        choiseCityTextField.layer.cornerRadius = 8
        choiseCityTextField.textColor = .white
        choiseCityTextField.font = UIFont.systemFont(ofSize: 20)
        choiseCityTextField.placeholder = "Please enter city"
        choiseCityTextField.tintColor = .white
        
        settingDetailStackViews(stackView: windStackView,
                                imageView: windImageView,
                                optionalLabel: windOptionLabel,
                                nameLabel: windNameLabel,
                                imageSystemName: "wind",
                                name: "Wind")
        settingDetailStackViews(stackView: humidityStackView,
                                imageView: humidityImageView,
                                optionalLabel: humidityOptionLabel,
                                nameLabel: humidityNameLabel,
                                imageSystemName: "humidity",
                                name: "Humidity")
        settingDetailStackViews(stackView: chanceOfRainStackView,
                                imageView: chanceOfRainImageView,
                                optionalLabel: chanceOfRainOptionLabel,
                                nameLabel: chanceOfRainNameLabel,
                                imageSystemName: "cloud.rain",
                                name: "Chance of rain")
        
        allDetailStackView.axis = .horizontal
        allDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        allDetailStackView.distribution = .fillEqually
        
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.text = "Today"
        todayLabel.textColor = UIColor(named: "TextColor")
        todayLabel.font = UIFont(name: "helvetica-bold", size: 14)
        todayLabel.textAlignment = .left
        
        sevenDaysButton.translatesAutoresizingMaskIntoConstraints = false
        sevenDaysButton.setTitle("7 days ᐳ", for: .normal)
        sevenDaysButton.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        sevenDaysButton.titleLabel?.font = UIFont(name: "helvetica-light", size: 12)
        sevenDaysButton.titleLabel?.textAlignment = .right

        allHoursCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            todayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            todayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            todayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            todayView.heightAnchor.constraint(equalToConstant: view.frame.height / 1.4),
            
            searchButton.topAnchor.constraint(equalTo: todayView.topAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -10),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            
            currentLocationButton.topAnchor.constraint(equalTo: todayView.topAnchor, constant: 10),
            currentLocationButton.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 10),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 40),
            currentLocationButton.widthAnchor.constraint(equalToConstant: 40),
            
            choiseCityTextField.centerYAnchor.constraint(equalTo: currentLocationButton.centerYAnchor),
            choiseCityTextField.leadingAnchor.constraint(equalTo: currentLocationButton.trailingAnchor, constant: 10),
            choiseCityTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
            choiseCityTextField.heightAnchor.constraint(equalToConstant: 30),
            
            cityNameLabel.topAnchor.constraint(equalTo: choiseCityTextField.bottomAnchor, constant: 10),
            cityNameLabel.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 10),
            cityNameLabel.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -10),
            
            weatherImage.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
            weatherImage.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 20),
            weatherImage.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -20),
            weatherImage.heightAnchor.constraint(equalToConstant: view.frame.height / 4.5),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            degreeSign.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            degreeSign.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor),
             
            weatherDescriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 0),
            weatherDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: weatherDescriptionLabel.bottomAnchor, constant: 0),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            allDetailStackView.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 10),
            allDetailStackView.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -10),
            allDetailStackView.bottomAnchor.constraint(equalTo: todayView.bottomAnchor, constant: -20),
            
            separatorView.bottomAnchor.constraint(equalTo: allDetailStackView.topAnchor, constant: -20),
            separatorView.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            weatherDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: separatorView.topAnchor, constant: -10),
            
            todayLabel.topAnchor.constraint(equalTo: todayView.bottomAnchor, constant: 10),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            sevenDaysButton.topAnchor.constraint(equalTo: todayView.bottomAnchor, constant: 10),
            sevenDaysButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sevenDaysButton.heightAnchor.constraint(equalToConstant: 20),
            
            allHoursCollectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor),
            allHoursCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            allHoursCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            allHoursCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func searchButtonTapped() {
        
    }
    
    @objc func currentLocation() {
        
    }
}

extension WeatherTodayViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let enteredCity = textField.text, !enteredCity.isEmpty else { return false }
        
        viewModel.city = enteredCity
        
        viewModel.fetchWeather {
            DispatchQueue.main.async {
                self.cityNameLabel.text = self.viewModel.weather?.resolvedAddress ?? ""
                self.temperatureLabel.text = String(self.viewModel.weather?.currentConditions?.temp ?? 0.0)
                self.weatherDescriptionLabel.text = self.viewModel.weather?.currentConditions?.conditions ?? "error"
                self.windOptionLabel.text = "\(String(self.viewModel.weather?.currentConditions?.windspeed ?? 0.0)) km/h"
                self.humidityOptionLabel.text = "\(String(self.viewModel.weather?.currentConditions?.humidity ?? 0.0))%"
                self.chanceOfRainOptionLabel.text = "\(String(self.viewModel.weather?.currentConditions?.precipprob ?? 0.0))%"
                self.weatherImage.image = UIImage(named: self.viewModel.weather?.currentConditions?.icon ?? "")
                self.dateLabel.text = DateManager.shared.todayDate(type: .full)
            }
        }
        
        textField.resignFirstResponder()
        
        return true
    }
    
}

extension WeatherTodayViewController {
    
    func settingDetailStackViews(stackView: UIStackView, imageView: UIImageView, optionalLabel: UILabel, nameLabel: UILabel, imageSystemName: String, name: String) {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        imageView.image = UIImage(systemName: imageSystemName)
        imageView.tintColor = .white
        optionalLabel.font = UIFont.systemFont(ofSize: 14)
        optionalLabel.textColor = .white
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textColor = .white
        nameLabel.alpha = 0.5
    }
    
}
