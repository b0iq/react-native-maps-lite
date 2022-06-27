import MapKit

@objc(MapsLiteViewManager)
class MapsLiteViewManager: RCTViewManager {
    override class func requiresMainQueueSetup() -> Bool {
        true
    }
    override func view() -> (MapsLiteView) {
        return MapsLiteView()
    }
}

class MapsLiteView : MKMapView, MKMapViewDelegate {
    
    @objc var onMapWillMove: RCTDirectEventBlock?
    @objc var onMapDidMove: RCTDirectEventBlock?
    
    @objc var initialRegion: NSDictionary = [:] {
        didSet {
            setupMap()
        }
    }
    
    @objc var showUserLocation: NSNumber = 0 {
        didSet {
            self.showsUserLocation = Bool(showsUserLocation)
        }
    }
    
    @objc var showCompass: NSNumber = 0 {
        didSet {
            self.showsCompass = Bool(showsCompass)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMap() {
        
        setupInitialRegion()
    }
    
    private func setupInitialRegion() {
        guard let latitude = initialRegion["latitude"] as? Double,
              let longitude = initialRegion["longitude"] as? Double,
              let zoomLevel = initialRegion["zoomLevel"] as? Int else {
            print("Error while parsing initialRegion")
            return
        }
        let width = self.frame.width > 0.0 ? self.frame.width : UIScreen.main.bounds.width
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let d = 360 / pow(2, Double(zoomLevel)) * Double(width) / 256
        print(d)
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: d)
        self.region = MKCoordinateRegion(center: coordinates, span: span)
    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        if self.onMapWillMove != nil {
            self.onMapWillMove!([:])
        }
        
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if self.onMapDidMove != nil {
            let width = self.frame.width > 0.0 ? self.frame.width : UIScreen.main.bounds.width
            let val = (360 * width / 256) / self.region.span.longitudeDelta
            let zoomLevel = round(log2(val))
            self.onMapDidMove!([
                "latitude": self.region.center.latitude,
                "longitude": self.region.center.longitude,
                "latitudeDelta": self.region.span.latitudeDelta,
                "longitudeDelta": self.region.span.longitudeDelta,
                "zoomLevel": zoomLevel
            ])
        }
    }
    deinit {
        print("Map did deinit")
    }
}
