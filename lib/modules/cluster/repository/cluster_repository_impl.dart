import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';
import 'package:moni_flutter_test/modules/cluster/repository/cluster_repository.dart';
import 'package:moni_flutter_test/modules/cluster/service/cluster_service.dart';
import 'package:moni_flutter_test/modules/cluster/service/cluster_service_impl.dart';

class ClusterRepositoryImpl implements ClusterRepository {
  ClusterService clusterService = ClusterServiceImpl();
  @override
  Future<Cluster> fetchClusterAgents({required String path}) async {

    return await clusterService.fetchClusterAgents(path: path);

  }

}