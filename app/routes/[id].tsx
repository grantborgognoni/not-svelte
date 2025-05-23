import { Link, useParams } from "react-router";
import { useQuery } from "@tanstack/react-query";
import {
  StatsClientImpl,
  GrpcWebImpl,
  TeamStatsResponse,
} from "../generated/cfb_team_stats";
import Team from "../components/Team";

const rpc = new GrpcWebImpl("http://localhost:50051", {});
const client = new StatsClientImpl(rpc);

function fetchTeamStats(team: string): Promise<TeamStatsResponse> {
  return client.GetTeamStats({
    team: team,
  });
}

export default function MovieDetail() {
  const params = useParams();
  const team = params.id || "";

  const { data, isLoading, error } = useQuery<TeamStatsResponse>({
    queryKey: ["team-stats", team],
    queryFn: () => fetchTeamStats(team),
  });

  if (isLoading)
    return (
      <div className="flex justify-center items-center min-h-[70vh] bg-zinc-900 text-white">
        <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-red-600" />
      </div>
    );

  if (error)
    return (
      <div className="flex justify-center items-center min-h-[70vh] bg-zinc-900 text-white">
        <div className="text-red-600 bg-red-900/30 p-6 rounded-lg shadow-md border border-red-800">
          <h3 className="text-lg font-semibold mb-2">Error Loading Movie</h3>
          <p>{String(error)}</p>
        </div>
      </div>
    );

  const movie = data?.stats?.find((m) => m.team === team);

  if (!movie) {
    return (
      <div className="max-w-4xl mx-auto py-8 px-4 sm:px-6 lg:px-8 bg-zinc-900 text-white min-h-screen">
        <div className="bg-yellow-900/30 border-l-4 border-yellow-600 p-4 mb-6 rounded-md shadow-sm">
          <div className="flex">
            <div className="flex-shrink-0">
              <svg
                className="h-5 w-5 text-yellow-400"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fillRule="evenodd"
                  d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z"
                  clipRule="evenodd"
                />
              </svg>
            </div>
            <div className="ml-3">
              <p className="text-yellow-300 font-medium">Movie not found</p>
              <p className="text-yellow-200 text-sm mt-1">
                The movie you're looking for doesn't exist or has been removed.
              </p>
            </div>
          </div>
        </div>
        <Link
          to="/"
          className="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-600 transition-colors"
        >
          <svg
            className="mr-2 -ml-1 h-5 w-5"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
            fill="currentColor"
          >
            <path
              fillRule="evenodd"
              d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z"
              clipRule="evenodd"
            />
          </svg>
          Back to teams
        </Link>
      </div>
    );
  }

  return (
    <div className="max-w-6xl mx-auto py-8 px-4 sm:px-6 lg:px-8 bg-zinc-900 text-white min-h-screen">
      <div className="mb-8">
        <Link
          to="/"
          className="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-600 transition-colors"
        >
          <svg
            className="mr-2 -ml-1 h-5 w-5"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
            fill="currentColor"
          >
            <path
              fillRule="evenodd"
              d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z"
              clipRule="evenodd"
            />
          </svg>
          Back to movies
        </Link>
      </div>
      <div className="bg-zinc-900 rounded-2xl shadow-2xl overflow-hidden border border-zinc-700">
        <Team details={movie} isDetailView={true} />
      </div>
    </div>
  );
}
