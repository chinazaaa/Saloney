// //import 'package:starter_project/Salon/pages/screens/published_service.dart';
// import 'package:starter_project/core/api/bookings_api/bookings_api.dart';
// import 'package:starter_project/index.dart';
// import 'package:starter_project/models/api_response_variants/bookings_response.dart';
// import 'package:starter_project/core/api/api_utils/network_exceptions.dart';

// import '../../locator.dart';

// class BookingRepo extends BaseNotifier {
//   // API
//   final _api = locator<BookingsApi>();


//     List<Bookings> customerUnCompletedOrders = [];
//   Future<bool> getCustomerUnCompletedOrders({bool silently = false}) async {
//     if(!silently){
//       if(customerUnCompletedOrders.isEmpty) setState(ViewState.Busy);
//     }
//     BookingsResponse resp;
//     try {
//       resp = await _api.getCustomerUnCompletedBookings();
//       if(resp.data.isEmpty){
//         setState(ViewState.NoDataAvailable);
//         customerUnCompletedOrders = resp.data;
//         return false;
//       }
//       customerUnCompletedOrders = resp.data;
//       setState(ViewState.DataFetched);
//       return true;
//     } on NetworkException {
//       setError('No Internet');
//     } catch (e){
//       setError(e.toString());
//     }
//     return false;
//   }
// }
