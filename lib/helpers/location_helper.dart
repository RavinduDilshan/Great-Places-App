const GOOGLE_API_KEY = 'AIzaSyDknqFj0JWneHcaFb1FSEtSTk157QO4Qdk';

class LocationHelper {
  static String generateLocationPriviewImage({required double latitude,required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,-$longitude&key=$GOOGLE_API_KEY';
  }
}
