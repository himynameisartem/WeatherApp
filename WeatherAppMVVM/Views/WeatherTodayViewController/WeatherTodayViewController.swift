//
//  WeatherTodayViewController.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import UIKit
import CoreLocation

class WeatherTodayViewController: UIViewController {
    
    private var locationManager: CLLocationManager!
    private var longitude: CLLocationDegrees!
    private var latitude: CLLocationDegrees!
    private var todayView: UIView!
    private var gradient: CAGradientLayer!
    private var searchButton: UIButton!
    private var currentLocationButton: UIButton!
    private var choiseCityTextField: UITextField!
    private var cityNameLabel: UILabel!
    private var weatherImage: UIImageView!
    private var temperatureLabel: UILabel!
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
    private var precipitationStackView: UIStackView!
    private var precipitationImageView: UIImageView!
    private var precipitationOptionLabel: UILabel!
    private var precipitationNameLabel: UILabel!
    private var allDetailStackView: UIStackView!
    private var todayLabel: UILabel!
    private var nextDaysButton: UIButton!
    private var allHoursCollectionView: UICollectionView!
    private var layout: UICollectionViewFlowLayout!
    private var tapGesture: UITapGestureRecognizer!
    
    
    var viewModel: WeatherTodayViewModelProtocol! {
        didSet {
            viewModel.fetchWeather { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success:
                    self.cityNameLabel.text = viewModel.cityName
                    self.temperatureLabel.text = viewModel.tempC
                    self.weatherDescriptionLabel.text = viewModel.weatherDescription
                    self.weatherImage.image = UIImage(named: viewModel.iconName)
                    self.windOptionLabel.text = viewModel.windSpeed
                    self.humidityOptionLabel.text = viewModel.humidity
                    self.precipitationOptionLabel.text = viewModel.precipitation
                    self.nextDaysButton.isEnabled = true
                    self.allHoursCollectionView.reloadData()
                case .failure(let error):
                    self.showErrorAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherTodayViewModel()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = todayView.bounds
    }
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "backgroundColor")
        locationManager = CLLocationManager()
        longitude = CLLocationDegrees()
        latitude = CLLocationDegrees()
        todayView = UIView()
        gradient = CAGradientLayer()
        searchButton = UIButton()
        currentLocationButton = UIButton()
        choiseCityTextField = UITextField()
        cityNameLabel = UILabel()
        weatherImage = UIImageView()
        temperatureLabel = UILabel()
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
        precipitationStackView = UIStackView()
        precipitationImageView = UIImageView()
        precipitationOptionLabel = UILabel()
        precipitationNameLabel = UILabel()
        allDetailStackView = UIStackView()
        todayLabel = UILabel()
        nextDaysButton = UIButton(type: .system)
        layout = UICollectionViewFlowLayout()
        allHoursCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tapGesture = UITapGestureRecognizer()
        
        view.addSubview(todayView)
        todayView.layer.addSublayer(gradient)
        todayView.addSubview(searchButton)
        todayView.addSubview(currentLocationButton)
        todayView.addSubview(choiseCityTextField)
        todayView.addSubview(cityNameLabel)
        todayView.addSubview(weatherImage)
        todayView.addSubview(temperatureLabel)
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
        todayView.addSubview(precipitationStackView)
        precipitationStackView.addArrangedSubview(precipitationImageView)
        precipitationStackView.addArrangedSubview(precipitationOptionLabel)
        precipitationStackView.addArrangedSubview(precipitationNameLabel)
        todayView.addSubview(allDetailStackView)
        allDetailStackView.addArrangedSubview(windStackView)
        allDetailStackView.addArrangedSubview(humidityStackView)
        allDetailStackView.addArrangedSubview(precipitationStackView)
        view.addSubview(todayLabel)
        view.addSubview(nextDaysButton)
        view.addSubview(allHoursCollectionView)
        view.addGestureRecognizer(tapGesture)
        choiseCityTextField.delegate = self
        
        configureProperties()
        makeConstraints()
    }
    
    private func configureProperties() {
        
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
        temperatureLabel.adjustsFontSizeToFitWidth = true
        temperatureLabel.minimumScaleFactor = 0.5
        
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherDescriptionLabel.font = UIFont(name: "helvetica-bold", size: 26)
        weatherDescriptionLabel.textColor = .white
        weatherDescriptionLabel.textAlignment = .center
        weatherDescriptionLabel.adjustsFontSizeToFitWidth = true
        weatherDescriptionLabel.minimumScaleFactor = 0.5
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont(name: "helvetica", size: 16)
        dateLabel.textColor = .white
        dateLabel.alpha = 0.5
        dateLabel.textAlignment = .center
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.minimumScaleFactor = 0.5
        
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
        settingDetailStackViews(stackView: precipitationStackView,
                                imageView: precipitationImageView,
                                optionalLabel: precipitationOptionLabel,
                                nameLabel: precipitationNameLabel,
                                imageSystemName: "cloud.rain",
                                name: "Precipitation")
        
        allDetailStackView.axis = .horizontal
        allDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        allDetailStackView.distribution = .fillEqually
        
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.text = "Today"
        todayLabel.font = UIFont(name: "helvetica-bold", size: 14)
        todayLabel.textAlignment = .left
        
        nextDaysButton.translatesAutoresizingMaskIntoConstraints = false
        nextDaysButton.tintColor = UIColor(named: "textColor")
        nextDaysButton.setTitle("next days ᐳ", for: .normal)
        nextDaysButton.titleLabel?.font = UIFont(name: "helvetica-light", size: 12)
        nextDaysButton.titleLabel?.textAlignment = .right
        nextDaysButton.isEnabled = false
        nextDaysButton.addTarget(self, action: #selector(sevenDaysButtonTransition), for: .touchUpInside)
        
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        allHoursCollectionView.showsHorizontalScrollIndicator = false
        allHoursCollectionView.layer.cornerRadius = 10
        allHoursCollectionView.translatesAutoresizingMaskIntoConstraints = false
        allHoursCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        allHoursCollectionView.delegate = self
        allHoursCollectionView.dataSource = self
        allHoursCollectionView.register(AllHoursCollectionViewCell.self, forCellWithReuseIdentifier: "allHoursCollectionViewCell")
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        tapGesture.addTarget(self, action: #selector(endEdidtingTapped))
        
    }
    
    private func makeConstraints() {
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
            
            cityNameLabel.topAnchor.constraint(equalTo: choiseCityTextField.bottomAnchor, constant: 20),
            cityNameLabel.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 10),
            cityNameLabel.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -10),
            
            weatherImage.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 20),
            weatherImage.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -20),
            weatherImage.heightAnchor.constraint(lessThanOrEqualToConstant: view.frame.height / 4.5),
            weatherImage.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.height / 6),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            weatherDescriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            weatherDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 20),
            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: weatherDescriptionLabel.bottomAnchor, constant: 0),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15),
            
            allDetailStackView.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 10),
            allDetailStackView.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -10),
            allDetailStackView.bottomAnchor.constraint(equalTo: todayView.bottomAnchor, constant: -20),
            
            separatorView.bottomAnchor.constraint(equalTo: allDetailStackView.topAnchor, constant: -20),
            separatorView.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            todayLabel.topAnchor.constraint(equalTo: todayView.bottomAnchor, constant: 10),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nextDaysButton.topAnchor.constraint(equalTo: todayView.bottomAnchor, constant: 10),
            nextDaysButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextDaysButton.heightAnchor.constraint(equalToConstant: 20),
            
            allHoursCollectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor),
            allHoursCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            allHoursCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            allHoursCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: separatorView.topAnchor, constant: -5),
        ])
    }
    
    @objc private func searchButtonTapped() {
        guard let enteredCity = choiseCityTextField.text else { return }
        viewModel.city = enteredCity
        choiseCityTextField.resignFirstResponder()
    }
    
    @objc private func currentLocation() {
        let coordinate = String(latitude) + "," + String(longitude)
        viewModel.city = coordinate
    }
    
    @objc private func sevenDaysButtonTransition() {
        let vc = NextDaysWeatherViewController()
        vc.viewModel = viewModel.sevenDaysWeather()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func endEdidtingTapped() {
        choiseCityTextField.endEditing(true)
    }
    
    private func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
}

extension WeatherTodayViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let enteredCity = textField.text, !enteredCity.isEmpty else { return false }
        viewModel.city = enteredCity
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension WeatherTodayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allHoursCollectionViewCell", for: indexPath) as! AllHoursCollectionViewCell
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 4 , height: collectionView.frame.height - 10)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherTodayViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showErrorAlert(message: "Failed to determine the location: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            showErrorAlert(message: "Access to geolocation is prohibited. Allow access in the settings.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            longitude = location.coordinate.longitude
            latitude = location.coordinate.latitude
            
            DispatchQueue.main.async {
                let coordinate = String(self.latitude) + "," + String(self.longitude)
                self.viewModel.city = coordinate
            }
        }
    }
}

//MARK: - settingDetailStackViews

extension WeatherTodayViewController {
    
    private func settingDetailStackViews(stackView: UIStackView, imageView: UIImageView, optionalLabel: UILabel, nameLabel: UILabel, imageSystemName: String, name: String) {
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
