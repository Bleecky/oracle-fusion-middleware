class oracle_fusion_middleware::weblogic (
  $install_path     = "${oracle_fusion_middleware::params::installpath}/Middleware",
  $media_src_dir    = $oracle_fusion_middleware::params::downloadfile,
  $weblogic_version = $oracle_fusion_middleware::params::default_weblogic_version,
){
  case $weblogic_version {
        '12.1.3' : { $downloadfile = "weblogic-${weblogic_version}.jar" }
        '12.1.1' : { $downloadfile = "weblogic-${weblogic_version}.jar" }
        '10.3.6' : { $downloadfile = "weblogic-${weblogic_version}.jar" }
        default  : { $downloadfile = "weblogic-${weblogic_version}.jar" }
      }
}