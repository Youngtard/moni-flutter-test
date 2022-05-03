import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';

abstract class ClusterRepository {
  Future<Cluster> fetchClusterAgents({required String path});
}