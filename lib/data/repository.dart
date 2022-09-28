import 'models/hotel_model.dart';
import 'network_service.dart';

class Repository {
  final NetworkService networkService;
  Repository({required this.networkService});

  Future<Hotel> getHotel() async {
    final data = await networkService.getHotel();
    return Hotel.fromJson(data);
  }
}
