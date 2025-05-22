import { MovieItem } from "../generated/movie";

export default function Movie({
  details,
  isDetailView = false,
}: {
  details: MovieItem;
  isDetailView?: boolean;
}) {
  const poster =
    details.image ||
    "https://a0.muscache.com/im/pictures/airbnb-default.png?im_w=720";

  if (isDetailView) {
    return (
      <div className="flex flex-col md:flex-row bg-zinc-900 text-white rounded-2xl overflow-hidden shadow-2xl border border-zinc-800">
        <img
          src={poster}
          alt={details.title}
          className="w-full md:w-1/3 h-80 md:h-auto object-cover"
          loading="lazy"
        />
        <div className="p-8 flex-1 flex flex-col gap-4">
          <h2 className="text-3xl font-extrabold text-red-600 mb-2">
            {details.title}
          </h2>
          <div className="flex flex-wrap gap-3 items-center text-sm mb-2">
            <span className="bg-zinc-800 text-zinc-200 px-3 py-1 rounded-full border border-zinc-700">
              {details.year}
            </span>
            <span className="bg-red-600/10 text-red-600 px-3 py-1 rounded-full border border-red-600/30">
              {details.genre}
            </span>
            {details.starRating && (
              <span className="flex items-center gap-1 text-yellow-400 font-semibold">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 24 24"
                  fill="currentColor"
                  className="w-5 h-5"
                >
                  <path
                    fillRule="evenodd"
                    d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z"
                    clipRule="evenodd"
                  />
                </svg>
                {details.starRating}
              </span>
            )}
            <span className="text-zinc-400">{details.runtime}</span>
            <span className="text-zinc-400">{details.rating}</span>
          </div>
          <div>
            <h3 className="text-lg font-semibold text-zinc-200 mb-1">Cast</h3>
            <p className="text-zinc-300 text-base">{details.cast}</p>
          </div>
        </div>
      </div>
    );
  }

  // Card/grid view
  return (
    <div className="relative group flex flex-col h-full">
      <div className="relative">
        <img
          src={poster}
          alt={details.title}
          className="w-full h-64 object-cover rounded-t-2xl group-hover:brightness-90 transition"
          loading="lazy"
        />
        <div className="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-zinc-900/80 to-transparent p-4 rounded-b-2xl">
          <h2 className="text-lg font-bold text-white mb-1 truncate">
            {details.title}
          </h2>
          <div className="flex flex-wrap gap-2 items-center text-xs">
            <span className="bg-red-600/80 text-white px-2 py-0.5 rounded-full font-semibold">
              {details.year}
            </span>
            <span className="bg-zinc-800 text-zinc-200 px-2 py-0.5 rounded-full">
              {details.genre}
            </span>
            {details.starRating && (
              <span className="flex items-center gap-1 text-yellow-400 font-semibold">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 24 24"
                  fill="currentColor"
                  className="w-4 h-4"
                >
                  <path
                    fillRule="evenodd"
                    d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z"
                    clipRule="evenodd"
                  />
                </svg>
                {details.starRating}
              </span>
            )}
            <span className="text-zinc-400">{details.runtime}</span>
            <span className="text-zinc-400">{details.rating}</span>
          </div>
        </div>
      </div>
    </div>
  );
}
