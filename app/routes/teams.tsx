import { Link } from "react-router";
import { useQuery } from "@tanstack/react-query";
import {
  StatsClientImpl,
  GrpcWebImpl,
  TeamStatsResponse,
} from "../generated/cfb_team_stats";
import { useState } from "react";
import Team from "../components/Team";

const rpc = new GrpcWebImpl("http://localhost:50051", {});
const client = new StatsClientImpl(rpc);

function fetchTeamStats(
  search: string,
  season: number
): Promise<TeamStatsResponse> {
  return client.GetTeamStats({
    ...(search && { team: search }),
    ...(season && { season: season }),
  });
}

export default function MoviesList() {
  const [search, setSearch] = useState("");
  const [season, setSeason] = useState(2019);

  const { data, isLoading, error } = useQuery<TeamStatsResponse>({
    queryKey: ["teams", search, season],
    queryFn: async () => {
      console.log("fetching teams", search, season);
      const result = await fetchTeamStats(search, season);
      console.log("result", result);
      return result;
    },
  });

  return (
    <div className="min-h-screen bg-zinc-900 text-white">
      <header className="bg-zinc-900 shadow-lg sticky top-0 z-10 border-b border-zinc-800">
        <div className="max-w-7xl mx-auto px-4 py-6 flex flex-col sm:flex-row items-center justify-between gap-4">
          <h1 className="text-4xl font-extrabold text-blue-500 tracking-tight font-sans drop-shadow-md select-none">
            College Football Stats
          </h1>
          <input
            type="text"
            placeholder="Search teams..."
            className="w-full sm:w-80 px-4 py-2 rounded-lg border border-zinc-800 bg-zinc-800 text-white placeholder-zinc-400 focus:outline-none focus:ring-2 focus:ring-red-600 transition shadow-sm"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
          <input
            type="number"
            placeholder="Season"
            className="w-full sm:w-80 px-4 py-2 rounded-lg border border-zinc-800 bg-zinc-800 text-white placeholder-zinc-400 focus:outline-none focus:ring-2 focus:ring-red-600 transition shadow-sm"
            value={season}
            onChange={(e) => setSeason(parseInt(e.target.value))}
          />
        </div>
      </header>
      {isLoading && (
        <div className="flex justify-center items-center min-h-[60vh]">
          <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-red-600"></div>
        </div>
      )}
      {error && (
        <div className="flex justify-center items-center min-h-[60vh]">
          <div className="text-red-600 bg-red-900/30 p-6 rounded-lg shadow-md border border-red-800">
            <h3 className="text-lg font-semibold mb-2">Error Loading Teams</h3>
            <p>{String(error)}</p>
          </div>
        </div>
      )}
      <main className="max-w-7xl mx-auto py-10 px-4">
        {data?.stats?.length === 0 && (
          <div className="text-center text-zinc-400 mt-20">
            No teams found matching your search.
          </div>
        )}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-8">
          {data?.stats?.map((stats) => (
            <Link
              key={stats.team}
              to={`/${stats.team}`}
              className="group bg-zinc-800 rounded-2xl shadow-xl border border-zinc-700 hover:shadow-2xl transition overflow-hidden flex flex-col cursor-pointer transform hover:scale-[1.03] focus:ring-2 focus:ring-red-600 focus:outline-none"
            >
              <Team details={stats} isDetailView={false} />
            </Link>
          ))}
        </div>
      </main>
    </div>
  );
}
