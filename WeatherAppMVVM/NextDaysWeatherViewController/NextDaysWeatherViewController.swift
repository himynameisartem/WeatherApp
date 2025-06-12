//
//  NextDaysWeatherViewController:.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import UIKit

class NextDaysWeatherViewController: UIViewController {
    
    private var backgroundView: UIView!
    private var gradient: CAGradientLayer!
    private var calendarSign: UIImageView!
    private var sevenDaysLabel: UILabel!
    private var backButton: UIButton!
    private var weatherImage: UIImageView!
    private var todayLabel: UILabel!
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
    private var precipitationStackView: UIStackView!
    private var precipitationImageView: UIImageView!
    private var precipitationOptionLabel: UILabel!
    private var precipitationNameLabel: UILabel!
    private var allDetailStackView: UIStackView!
    var nextDaysTableView: UITableView!
    
    var viewModel: NextDaysViewModelProtocol! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        makeConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = backgroundView.bounds
    }

    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        backgroundView = UIView()
        calendarSign = UIImageView()
        sevenDaysLabel = UILabel()
        backButton = UIButton()
        gradient = CAGradientLayer()
        weatherImage = UIImageView()
        todayLabel = UILabel()
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
        precipitationStackView = UIStackView()
        precipitationImageView = UIImageView()
        precipitationOptionLabel = UILabel()
        precipitationNameLabel = UILabel()
        allDetailStackView = UIStackView()
        nextDaysTableView = UITableView()
        
        view.addSubview(backgroundView)
        backgroundView.layer.addSublayer(gradient)
        backgroundView.addSubview(backButton)
        backgroundView.addSubview(calendarSign)
        backgroundView.addSubview(sevenDaysLabel)
        backgroundView.addSubview(weatherImage)
        backgroundView.addSubview(todayLabel)
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
        backgroundView.addSubview(precipitationStackView)
        precipitationStackView.addArrangedSubview(precipitationImageView)
        precipitationStackView.addArrangedSubview(precipitationOptionLabel)
        precipitationStackView.addArrangedSubview(precipitationNameLabel)
        backgroundView.addSubview(allDetailStackView)
        allDetailStackView.addArrangedSubview(windStackView)
        allDetailStackView.addArrangedSubview(humidityStackView)
        allDetailStackView.addArrangedSubview(precipitationStackView)
        view.addSubview(nextDaysTableView)
        
        configureSettings()
    }
    
    private func configureSettings() {
        
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
        sevenDaysLabel.text = " Next Days"
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.image = UIImage(named: viewModel.weatherImage)
        weatherImage.contentMode = .scaleAspectFit
        
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.font = UIFont(name: "helvetica", size: 16)
        todayLabel.text = "Today"
        todayLabel.textAlignment = .center
        todayLabel.textColor = .white
        todayLabel.adjustsFontSizeToFitWidth = true
        todayLabel.minimumScaleFactor = 0.5
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont(name: "helvetica-bold", size: 50)
        tempLabel.textColor = .white
        tempLabel.text = viewModel.temp
        tempLabel.textAlignment = .left
        tempLabel.adjustsFontSizeToFitWidth = true
        tempLabel.minimumScaleFactor = 0.5        
        
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.font = UIFont(name: "helvetica-bold", size: 30)
        minTempLabel.textColor = .white
        minTempLabel.alpha = 0.5
        minTempLabel.textAlignment = .left
        minTempLabel.text = viewModel.tempMin
        minTempLabel.adjustsFontSizeToFitWidth = true
        minTempLabel.minimumScaleFactor = 0.6
        
        weatherDiscription.translatesAutoresizingMaskIntoConstraints = false
        weatherDiscription.font = UIFont(name: "helvetica-light", size: 14)
        weatherDiscription.textColor = .white
        weatherDiscription.textAlignment = .left
        weatherDiscription.alpha = 0.5
        weatherDiscription.adjustsFontSizeToFitWidth = true
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
        settingDetailStackViews(stackView: precipitationStackView,
                                imageView: precipitationImageView,
                                optionalLabel: precipitationOptionLabel,
                                nameLabel: precipitationNameLabel,
                                imageSystemName: "cloud.rain",
                                name: "Chance of rain", optionals: viewModel.chanceOfRain)
        
        allDetailStackView.axis = .horizontal
        allDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        allDetailStackView.distribution = .fillEqually
        
        nextDaysTableView.translatesAutoresizingMaskIntoConstraints = false
        nextDaysTableView.delegate = self
        nextDaysTableView.dataSource = self
        nextDaysTableView.register(NextDaysTableViewCell.self, forCellReuseIdentifier: "NextDaysCell")
        nextDaysTableView.isUserInteractionEnabled = false
        nextDaysTableView.separatorStyle = .none
        
    }
    
    private func makeConstraints() {
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
            
            weatherImage.topAnchor.constraint(equalTo: sevenDaysLabel.bottomAnchor, constant: 10),
            weatherImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            weatherImage.widthAnchor.constraint(equalToConstant: view.frame.width / 2.5 - 10),
            
            tempLabel.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            
            minTempLabel.bottomAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            minTempLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor),
            minTempLabel.centerYAnchor.constraint(equalTo: tempLabel.centerYAnchor, constant: 6),
            minTempLabel.trailingAnchor.constraint(lessThanOrEqualTo: backgroundView.trailingAnchor, constant: -10),
            
            todayLabel.topAnchor.constraint(greaterThanOrEqualTo: sevenDaysLabel.bottomAnchor, constant: 3),
            todayLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            todayLabel.bottomAnchor.constraint(greaterThanOrEqualTo: tempLabel.topAnchor, constant: -20),
            todayLabel.bottomAnchor.constraint(lessThanOrEqualTo: tempLabel.topAnchor, constant: 0),
                        
            weatherDiscription.topAnchor.constraint(greaterThanOrEqualTo: tempLabel.bottomAnchor, constant: -5),
            weatherDiscription.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            
            allDetailStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            allDetailStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            allDetailStackView.bottomAnchor.constraint(lessThanOrEqualTo: backgroundView.bottomAnchor, constant: -10),
            allDetailStackView.bottomAnchor.constraint(greaterThanOrEqualTo: backgroundView.bottomAnchor, constant: -20),
            
            separatorView.bottomAnchor.constraint(lessThanOrEqualTo: allDetailStackView.topAnchor, constant: -5),
            separatorView.bottomAnchor.constraint(greaterThanOrEqualTo: allDetailStackView.topAnchor, constant: -20),
            separatorView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            weatherDiscription.topAnchor.constraint(greaterThanOrEqualTo: tempLabel.bottomAnchor, constant: 2),
            weatherDiscription.topAnchor.constraint(lessThanOrEqualTo: tempLabel.bottomAnchor, constant: 20),
            weatherDiscription.bottomAnchor.constraint(lessThanOrEqualTo: separatorView.topAnchor, constant: -2),
            weatherImage.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -5),
            
            nextDaysTableView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 10),
            nextDaysTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nextDaysTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nextDaysTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
 
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension NextDaysWeatherViewController {
    
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

extension NextDaysWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.numberOfItems() else { return 0 }
        return count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NextDaysCell", for: indexPath) as! NextDaysTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        cell.isSelected = false
        cell.awakeFromNib()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.height - view.frame.height / 3) / 7
    }
    
}
