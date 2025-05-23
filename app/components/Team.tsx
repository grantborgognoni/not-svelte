import { TeamStats } from "../generated/cfb_team_stats";

export default function Team({
  details,
  isDetailView = false,
}: {
  details: TeamStats;
  isDetailView?: boolean;
}) {
  // Card view for grid/list
  if (!isDetailView) {
    return (
      <div className="relative group flex flex-col h-full bg-zinc-900 rounded-2xl shadow border border-zinc-800 p-4 hover:shadow-lg transition">
        <h2 className="text-xl font-bold text-red-500 mb-2 truncate">
          {details.team}
        </h2>
        <div className="flex flex-wrap gap-2 text-sm text-zinc-300 mb-2">
          <span className="bg-zinc-800 px-2 py-0.5 rounded-full">
            Season: {details.season}
          </span>
          <span className="bg-green-700/80 text-white px-2 py-0.5 rounded-full">
            W: {details.wins}
          </span>
          <span className="bg-red-700/80 text-white px-2 py-0.5 rounded-full">
            L: {details.losses}
          </span>
        </div>
        <div className="flex flex-wrap gap-2 text-xs text-zinc-400">
          <span>PPG: {details.pointsPerGame}</span>
          <span>Total Points: {details.totalPoints}</span>
          <span>Off Rank: {details.offenseRank}</span>
          <span>Def Rank: {details.defenseRank}</span>
        </div>
      </div>
    );
  }

  // Detail view
  return (
    <div className="flex flex-col md:flex-row bg-zinc-900 text-white rounded-2xl overflow-hidden shadow-2xl border border-zinc-800">
      <div className="p-8 flex-1 flex flex-col gap-4">
        <h2 className="text-3xl font-extrabold text-red-600 mb-2">
          {details.team}
        </h2>
        <div className="flex flex-wrap gap-3 items-center text-sm mb-4">
          <span className="bg-zinc-800 text-zinc-200 px-3 py-1 rounded-full border border-zinc-700">
            Season: {details.season}
          </span>
          <span className="bg-green-700/80 text-white px-3 py-1 rounded-full border border-green-700/30">
            Wins: {details.wins}
          </span>
          <span className="bg-red-700/80 text-white px-3 py-1 rounded-full border border-red-700/30">
            Losses: {details.losses}
          </span>
          <span className="bg-zinc-700 text-zinc-300 px-3 py-1 rounded-full border border-zinc-600">
            Games: {details.games}
          </span>
        </div>
        <div className="grid grid-cols-2 md:grid-cols-3 gap-4 text-base text-zinc-200">
          <div>
            <div className="font-semibold text-zinc-400">Points Per Game</div>
            <div>{details.pointsPerGame}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">Total Points</div>
            <div>{details.totalPoints}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">Offense Rank</div>
            <div>{details.offenseRank}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">
              Offense Yards/Game
            </div>
            <div>{details.offenseYardsPerGame}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">Defense Rank</div>
            <div>{details.defenseRank}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">Points Allowed</div>
            <div>{details.pointsAllowed}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">
              Avg Points Allowed/Game
            </div>
            <div>{details.avgPointsPerGameAllowed}</div>
          </div>
          <div>
            <div className="font-semibold text-zinc-400">Turnover Margin</div>
            <div>{details.turnoverMargin}</div>
          </div>
        </div>
        <div className="mt-6 grid grid-cols-2 md:grid-cols-4 gap-4 text-xs text-zinc-400">
          <div>
            Pass Yards:{" "}
            <span className="text-zinc-200">{details.passYards}</span>
          </div>
          <div>
            Rush Yards:{" "}
            <span className="text-zinc-200">{details.rushYards}</span>
          </div>
          <div>
            Pass TDs:{" "}
            <span className="text-zinc-200">{details.passTouchdowns}</span>
          </div>
          <div>
            Rush TDs:{" "}
            <span className="text-zinc-200">{details.rushTouchdowns}</span>
          </div>
          <div>
            Interceptions Thrown:{" "}
            <span className="text-zinc-200">{details.interceptionsThrown}</span>
          </div>
          <div>
            Interceptions Gained:{" "}
            <span className="text-zinc-200">{details.interceptionsGained}</span>
          </div>
          <div>
            Fumbles Recovered:{" "}
            <span className="text-zinc-200">{details.fumblesRecovered}</span>
          </div>
          <div>
            Turnovers Lost:{" "}
            <span className="text-zinc-200">{details.turnoversLost}</span>
          </div>
        </div>
      </div>
    </div>
  );
}
