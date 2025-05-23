use tonic::{transport::Server, Request, Response, Status};
use sqlx::SqlitePool;
use sqlx::Row;

/// Generated gRPC/protobuf module for CFB stats service.
pub mod grpc_cfb {
    tonic::include_proto!("cfb");
}
use grpc_cfb::stats_server::{Stats, StatsServer};
use grpc_cfb::{TeamStatsRequest, TeamStatsResponse, TeamStats};

/// Service holding the SQLite connection pool.
#[derive(Debug)]
pub struct CfbService {
    pool: SqlitePool,
}

#[tonic::async_trait]
impl Stats for CfbService {
    /// Handles the gRPC get_team_stats request.
    /// 
    /// How she works:
    /// Accepts an optional season and/or team name, builds a SQL query,
    /// and returns a list of matching team stats.
    async fn get_team_stats(
        &self,
        request: Request<TeamStatsRequest>,
    ) -> Result<Response<TeamStatsResponse>, Status> {
        // Extract the request fields
        let req = request.into_inner();
        // Start with a base query
        let mut query = String::from("SELECT * FROM cfb_team_stats WHERE 1=1");

        // Add filters if present
        if req.season.is_some() {
            query.push_str(" AND season = ?");
        }
        if req.team.is_some() {
            query.push_str(" AND team = ?");
        }

        // Prepare the query and bind parameters in order
        let mut q = sqlx::query(&query);
        if req.season.is_some() {
            q = q.bind(req.season);
        }
        if req.team.is_some() {
            q = q.bind(req.team);
        }

        // Set query and map errors to gRPC Status
        let rows = q
            .fetch_all(&self.pool)
            .await
            .map_err(|e| Status::internal(e.to_string()))?;

        // Map each row to the TeamStats protobuf struct
        let stats: Vec<TeamStats> = rows.into_iter().map(|row| {
            TeamStats {
                season: row.get("season"),
                team: row.get("team"),
                games: row.get("games"),
                wins: row.get("wins"),
                losses: row.get("losses"),
                points_per_game: row.get("points_per_game"),
                total_points: row.get("total_points"),
                offense_rank: row.get("offense_rank"),
                offense_plays: row.get("offense_plays"),
                offense_yards: row.get("offense_yards"),
                offense_yards_per_play: row.get("offense_yards_per_play"),
                offense_touchdowns: row.get("offense_touchdowns"),
                offense_yards_per_game: row.get("offense_yards_per_game"),
                defense_rank: row.get("defense_rank"),
                defense_plays: row.get("defense_plays"),
                yards_allowed: row.get("yards_allowed"),
                yards_per_play_allowed: row.get("yards_per_play_allowed"),
                total_touchdowns_allowed: row.get("total_touchdowns_allowed"),
                points_allowed: row.get("points_allowed"),
                avg_points_per_game_allowed: row.get("avg_points_per_game_allowed"),
                pass_attempts: row.get("pass_attempts"),
                pass_completions: row.get("pass_completions"),
                pass_yards: row.get("pass_yards"),
                pass_touchdowns: row.get("pass_touchdowns"),
                interceptions_thrown: row.get("interceptions_thrown"),
                pass_yards_per_attempt: row.get("pass_yards_per_attempt"),
                rush_attempts: row.get("rush_attempts"),
                rush_yards: row.get("rush_yards"),
                rush_touchdowns: row.get("rush_touchdowns"),
                yards_per_rush: row.get("yards_per_rush"),
                fumbles_recovered: row.get("fumbles_recovered"),
                interceptions_gained: row.get("interceptions_gained"),
                turnovers_lost: row.get("turnovers_lost"),
                turnover_margin: row.get("turnover_margin"),
            }
        }).collect();

        Ok(Response::new(TeamStatsResponse { stats }))
    }
}

/// Entrypoint: sets up the gRPC server & database connection
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    dotenvy::dotenv().ok();
    let addr = std::env::var("GRPC_ADDR").expect("GRPC_ADDR must be set").parse()?;
    let db_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = SqlitePool::connect(&db_url).await?;

    let service = CfbService { pool };
    let service = tonic_web::enable(StatsServer::new(service));

    let (mut health_reporter, health_service) = tonic_health::server::health_reporter();
    health_reporter.set_serving::<StatsServer<CfbService>>().await;

    println!("Running on http://{}", addr);
    Server::builder()
        .accept_http1(true)
        .add_service(health_service)
        .add_service(service)
        .serve(addr)
        .await?;

    Ok(())
}