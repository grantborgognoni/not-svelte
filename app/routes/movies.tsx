import { Link } from "react-router";
import { useQuery } from "@tanstack/react-query";
import {
  MovieClientImpl,
  GrpcWebImpl,
  MovieResponse,
} from "../generated/movie";
import { useState } from "react";
import Movie from "../components/movie";

const rpc = new GrpcWebImpl("http://localhost:50051", {});
const client = new MovieClientImpl(rpc);

function fetchMovies(): Promise<MovieResponse> {
  return client.GetMovies({});
}

export default function MoviesList() {
  const { data, isLoading, error } = useQuery<MovieResponse>({
    queryKey: ["movies"],
    queryFn: fetchMovies,
  });

  const [search, setSearch] = useState("");

  const filteredMovies = data?.movies?.filter((movie) =>
    movie.title?.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="min-h-screen bg-zinc-900 text-white">
      <header className="bg-zinc-900 shadow-lg sticky top-0 z-10 border-b border-zinc-800">
        <div className="max-w-7xl mx-auto px-4 py-6 flex flex-col sm:flex-row items-center justify-between gap-4">
          <h1 className="text-4xl font-extrabold text-red-600 tracking-tight font-sans drop-shadow-md select-none">
            ReactRust
          </h1>
          <input
            type="text"
            placeholder="Search movies..."
            className="w-full sm:w-80 px-4 py-2 rounded-lg border border-zinc-800 bg-zinc-800 text-white placeholder-zinc-400 focus:outline-none focus:ring-2 focus:ring-red-600 transition shadow-sm"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
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
            <h3 className="text-lg font-semibold mb-2">Error Loading Movies</h3>
            <p>{String(error)}</p>
          </div>
        </div>
      )}
      <main className="max-w-7xl mx-auto py-10 px-4">
        {filteredMovies?.length === 0 && (
          <div className="text-center text-zinc-400 mt-20">
            No movies found matching your search.
          </div>
        )}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-8">
          {filteredMovies?.map((movie) => (
            <Link
              key={movie.id}
              to={`/${movie.id}`}
              className="group bg-zinc-800 rounded-2xl shadow-xl border border-zinc-700 hover:shadow-2xl transition overflow-hidden flex flex-col cursor-pointer transform hover:scale-[1.03] focus:ring-2 focus:ring-red-600 focus:outline-none"
            >
              <Movie details={movie} isDetailView={false} />
            </Link>
          ))}
        </div>
      </main>
    </div>
  );
}
