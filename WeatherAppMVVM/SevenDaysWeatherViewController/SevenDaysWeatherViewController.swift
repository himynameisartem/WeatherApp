//
//  SevenDaysWeatherViewController.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import UIKit

class SevenDaysWeatherViewController: UIViewController {
    
    private var backgroundView: UIView!
    private var gradient: CAGradientLayer!
    private var calendarSign: UIImageView!
    private var sevenDaysLabel: UILabel!
    private var backButton: UIButton!
    private var weatherImage: UIImageView!
    private var tommorowLabel: UILabel!
    private var tempLabel: UILabel!
    private var minTempLabel: UILabel!
    private var weatherDiscription: UILabel!
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
    
    var viewModel: SevenDaysViewModelProtocol! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupUI()
        setupSettings()
        setupConstraints()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = backgroundView.bounds
        
    }

    
    private func setupUI() {
        backgroundView = UIView()
        calendarSign = UIImageView()
        sevenDaysLabel = UILabel()
        backButton = UIButton()
        gradient = CAGradientLayer()
        weatherImage = UIImageView()
        tommorowLabel = UILabel()
        tempLabel = UILabel()
        minTempLabel = UILabel()
        weatherDiscription = UILabel()
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
        
        view.addSubview(backgroundView)
        backgroundView.layer.addSublayer(gradient)
        backgroundView.addSubview(backButton)
        backgroundView.addSubview(calendarSign)
        backgroundView.addSubview(sevenDaysLabel)
        backgroundView.addSubview(weatherImage)
        backgroundView.addSubview(tommorowLabel)
        backgroundView.addSubview(tempLabel)
        backgroundView.addSubview(minTempLabel)
        backgroundView.addSubview(weatherDiscription)
        backgroundView.addSubview(separatorView)
        backgroundView.addSubview(windStackView)
        windStackView.addArrangedSubview(windImageView)
        windStackView.addArrangedSubview(windOptionLabel)
        windStackView.addArrangedSubview(windNameLabel)
        backgroundView.addSubview(humidityStackView)
        humidityStackView.addArrangedSubview(humidityImageView)
        humidityStackView.addArrangedSubview(humidityOptionLabel)
        humidityStackView.addArrangedSubview(humidityNameLabel)
        backgroundView.addSubview(chanceOfRainStackView)
        chanceOfRainStackView.addArrangedSubview(chanceOfRainImageView)
        chanceOfRainStackView.addArrangedSubview(chanceOfRainOptionLabel)
        chanceOfRainStackView.addArrangedSubview(chanceOfRainNameLabel)
        backgroundView.addSubview(allDetailStackView)
        allDetailStackView.addArrangedSubview(windStackView)
        allDetailStackView.addArrangedSubview(humidityStackView)
        allDetailStackView.addArrangedSubview(chanceOfRainStackView)
    }
    
    private func setupSettings() {
        
        let topColor = #colorLiteral(red: 0.08297913522, green: 0.7363885045, blue: 0.9625709653, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.06859397143, green: 0.4181304872, blue: 0.9508929849, alpha: 1).cgColor
        gradient.colors = [topColor, bottomColor]
        gradient.locations = [0, 1]
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 42
        backgroundView.backgroundColor = .blue
        backgroundView.clipsToBounds = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left.circle"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        calendarSign.translatesAutoresizingMaskIntoConstraints = false
        calendarSign.image = UIImage(systemName: "calendar")
        calendarSign.tintColor = .white
        
        sevenDaysLabel.translatesAutoresizingMaskIntoConstraints = false
        sevenDaysLabel.font = UIFont(name: "helvetica-bold", size: 18)
        sevenDaysLabel.textColor = .white
        sevenDaysLabel.textAlignment = .center
        sevenDaysLabel.text = "7 Days"
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.image = UIImage(named: viewModel.weatherImage)
        weatherImage.contentMode = .scaleAspectFit
        
        tommorowLabel.translatesAutoresizingMaskIntoConstraints = false
        tommorowLabel.font = UIFont(name: "helvetica", size: 16)
        tommorowLabel.text = "Tommorow"
        tommorowLabel.textAlignment = .left
        tommorowLabel.textColor = .white
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont(name: "helvetica-bold", size: 50)
        tempLabel.textColor = .white
        tempLabel.text = viewModel.temp
        tempLabel.textAlignment = .left
        
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.font = UIFont(name: "helvetica-bold", size: 30)
        minTempLabel.textColor = .white
        minTempLabel.alpha = 0.5
        minTempLabel.textAlignment = .left
        minTempLabel.text = viewModel.tempMin
        
        weatherDiscription.translatesAutoresizingMaskIntoConstraints = false
        weatherDiscription.font = UIFont(name: "helvetica-light", size: 14)
        weatherDiscription.textColor = .white
        weatherDiscription.textAlignment = .left
        weatherDiscription.alpha = 0.5
        weatherDiscription.text = viewModel.weatherDescription
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .systemGray5
        separatorView.alpha = 0.1
        
        settingDetailStackViews(stackView: windStackView,
                                imageView: windImageView,
                                optionalLabel: windOptionLabel,
                                nameLabel: windNameLabel,
                                imageSystemName: "wind",
                                name: "Wind", optionals: viewModel.wind)
        settingDetailStackViews(stackView: humidityStackView,
                                imageView: humidityImageView,
                                optionalLabel: humidityOptionLabel,
                                nameLabel: humidityNameLabel,
                                imageSystemName: "humidity",
                                name: "Humidity", optionals: viewModel.humidity)
        settingDetailStackViews(stackView: chanceOfRainStackView,
                                imageView: chanceOfRainImageView,
                                optionalLabel: chanceOfRainOptionLabel,
                                nameLabel: chanceOfRainNameLabel,
                                imageSystemName: "cloud.rain",
                                name: "Chance of rain", optionals: viewModel.chanceOfRain)
        
        allDetailStackView.axis = .horizontal
        allDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        allDetailStackView.distribution = .fillEqually
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            backgroundView.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            
            backButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            sevenDaysLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            sevenDaysLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            calendarSign.centerYAnchor.constraint(equalTo: sevenDaysLabel.centerYAnchor),
            calendarSign.trailingAnchor.constraint(equalTo: sevenDaysLabel.leadingAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: sevenDaysLabel.bottomAnchor, constant: 20),
            weatherImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            weatherImage.widthAnchor.constraint(equalToConstant: view.frame.width / 2.5 - 10),
            weatherImage.heightAnchor.constraint(equalToConstant: (view.frame.height / 3) / 2.5),
            
            tempLabel.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            
            minTempLabel.bottomAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            minTempLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor),
            minTempLabel.trailingAnchor.constraint(lessThanOrEqualTo: backgroundView.trailingAnchor, constant: -10),
            
            tommorowLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            tommorowLabel.bottomAnchor.constraint(equalTo: tempLabel.topAnchor),
            
            weatherDiscription.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            weatherDiscription.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            
            allDetailStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            allDetailStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            allDetailStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            
            separatorView.bottomAnchor.constraint(equalTo: allDetailStackView.topAnchor, constant: -20),
            separatorView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
 
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SevenDaysWeatherViewController {
    
    private func settingDetailStackViews(stackView: UIStackView, imageView: UIImageView, optionalLabel: UILabel, nameLabel: UILabel, imageSystemName: String, name: String, optionals: String) {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        imageView.image = UIImage(systemName: imageSystemName)
        imageView.tintColor = .white
        optionalLabel.font = UIFont.systemFont(ofSize: 14)
        optionalLabel.textColor = .white
        optionalLabel.text = optionals
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textColor = .white
        nameLabel.alpha = 0.5
    }
    
}
