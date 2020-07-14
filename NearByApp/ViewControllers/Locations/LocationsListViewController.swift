
//  Created by Kareem on 6/14/20.
//  Copyright © 2020 Kareem. All rights reserved.
//

import UIKit
import ProgressHUD
import CoreLocation


class LocationsListViewController: UIViewController {
    
    //MARK:-  @IBOutlet
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var locationsTableView: UITableView!
        {
        didSet {
            locationsTableView.delegate = self
            locationsTableView.dataSource = self
        }
    }
    
    //MARK:-  Variables
    weak var delegate: makeAlert?
    fileprivate let locationsListPresenter = LocationsListPresenter()
    var locationManager = CLLocationManager()
    var mapLat = CLLocationDegrees()
    var mapLng = CLLocationDegrees()
    var  locationsArray : [Venue]?
    var isRealTimeClicked = false
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsListPresenter.attachView(false, view: self)
        setupLoc()
    }
    //MARK:- Methods
    func setupLoc() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    //MARK:- @IBACtions
    @IBAction func realTimeBtnClicked(_ sender: UIBarButtonItem) {
        self.isRealTimeClicked = true
        self.locationManager.startUpdatingLocation()
    }
}


//MARK: - TableView DataSource
extension LocationsListViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locationsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationsTableViewCell", for: indexPath) as! locationsTableViewCell
        cell.delegate = self
        if let location = self.locationsArray?[indexPath.row] {
            cell.setupCell(location:location)
        }
        return cell
    }
}

//MARK: - LocationsListProtcol
extension LocationsListViewController : LocationsListProtocol {
    func fail(code: Int) {
        self.locationsTableView.isHidden = true
        if code == 200 {
            self.errorLabel.text = "No Data Found"
        } else {
            self.errorLabel.text = "Something Went Wrong"
        }
    }
    func getLocationsArray(locationsArray: [Venue]) {
        self.locationsArray = []
        self.locationsArray = locationsArray
        self.locationsTableView.reloadData()
    }
    func startLoading() {
        ProgressHUD.show()
    }
    func finishLoading() {
        ProgressHUD.dismiss()
    }
}

//MARK: - CLLocationManagerDelegate
extension LocationsListViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last
        {
            self.mapLat = location.coordinate.latitude
            self.mapLng = location.coordinate.longitude
            self.locationsListPresenter.getLocationsList(lat: self.mapLat, lng: self.mapLng)
        }
        if self.isRealTimeClicked {
            
        } else {
            self.locationManager.stopUpdatingLocation()
        }
    }
}

//MARK: - makeAlertDelegate
extension LocationsListViewController : makeAlert {
    func errorAlert(errorMsg: String) {
        self.alertError(alertMsg: errorMsg)
    }
}

