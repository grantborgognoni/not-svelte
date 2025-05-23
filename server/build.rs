fn main() -> Result<(), Box<dyn std::error::Error>> {
  tonic_build::compile_protos("proto/cfb_team_stats.proto")?;
  Ok(())
}
