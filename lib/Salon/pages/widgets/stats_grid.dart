import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/core/repositories/dashboard_repository.dart';
import 'package:starter_project/ui_helpers/responsive_state/responsive_state.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';
import 'package:starter_project/ui_helpers/widgets/error_retry_widget.dart';

class StatsGrid extends StatefulWidget {
  final String salonId;
  final int allCustomers, allOrders;

  const StatsGrid({Key key, this.salonId, this.allCustomers, this.allOrders}) : super(key: key);
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DashboardRepo>(context, listen: false).dashboard(widget.salonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DashboardRepo>(context);
    return  Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  ...model.salonDashboard.map((e) => StatsGrid(
                  allCustomers: e.allCustomers,
                  allOrders: e.allOrders,
                  
                )).toList(),
                
                  //  _buildStatCard('Total Customers', model.dashboardResponse.data.allCustomers.toString(), Colors.orange),
                  _buildStatCard('Total Customers', widget.allCustomers.toString(), Colors.orange),
                  
    
                  _buildStatCard('Total Orders', '${widget.allOrders}', Colors.red),
                ],
                
              ),
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Published Services', '391 K', Colors.green),
                  _buildStatCard(
                      'Unpublished Services', '1.31 M', Colors.lightBlue),
                  //_buildStatCard('Messages', 'N/A', Colors.purple),
                ],
              ),
            ),
          ],
        ),
    
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
