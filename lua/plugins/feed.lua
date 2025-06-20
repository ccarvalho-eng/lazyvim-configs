return {
  "neo451/feed.nvim",
  cmd = "Feed",
  ---@module 'feed'
  ---@type feed.config
  opts = {
    feeds = {
      -- News
      "https://feeds.bbci.co.uk/news/world/rss.xml",
      "https://rss.app/feeds/3e6T5XdYVjnUTNcl.xml", -- Reuters
      "https://www.theguardian.com/international/rss",
      "https://apnews.com/rss",
      "https://rss.dw.com/rdf/rss-en-all",
      "https://feeds.feedburner.com/PublicoRSS", -- Publico
      "https://rss.app/feeds/rDeVuByvrhHCEq8u.xml", -- Diário de Coimbra
      "https://rss.app/feeds/KKI3UD2z11ZmCxKV.xml", -- As Beiras

      -- Cybersecurity
      "https://krebsonsecurity.com/feed/",
      "https://feeds.feedburner.com/TheHackersNews",
      "https://www.bleepingcomputer.com/feed/",
      "https://threatpost.com/feed/",
      "https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml", -- NVD Vulnerabilities
      "https://www.schneier.com/blog/atom.xml", -- Schneier on Security
      "https://www.darkreading.com/rss.xml",

      -- Tech & Programming Communities
      "https://news.ycombinator.com/rss",
      "https://lobste.rs/rss",
      "https://arstechnica.com/feed/",
      "https://www.technologyreview.com/feed/", -- MIT Technology Review
      "https://feeds.feedburner.com/oreilly/radar/atom", -- O'Reilly Radar

      -- Gaming
      "https://www.pcgamer.com/rss/",
      "https://www.rockpapershotgun.com/feed",
      "https://www.eurogamer.net/?format=rss",
      "https://kotaku.com/rss",

      -- Literature & Books
      "https://lithub.com/feed/",
      "https://www.nybooks.com/feed/",
      "https://www.theparisreview.org/blog/feed/",
      "https://www.tor.com/feed/",

      -- Elixir & Erlang
      "https://elixir-lang.org/blog/feed.xml",
      "https://www.erlang.org/rss.xml",
      "https://blog.erlang.org/feed.xml",
      "https://dashbit.co/feed",

      -- Personal Development
      "https://zenhabits.net/feed/",
      "https://www.mindful.org/feed/",
      "https://www.raptitude.com/feed/",

      -- Formula 1
      "https://www.formula1.com/en/latest.rss",
      "https://www.fia.com/rss/press-release",
      "https://www.autosport.com/rss/f1/news",
      "https://f1tv-rss.vercel.app/api/rss", -- Unofficial F1 TV

      -- Space & NASA
      "https://www.nasa.gov/news-release/feed/", -- NASA Breaking News
      "https://apod.nasa.gov/apod.rss", -- Astronomy Picture of the Day
      "https://science.nasa.gov/feeds/news.xml", -- NASA Science News
      "https://earthobservatory.nasa.gov/Feeds/rss/eo.rss", -- NASA Earth Observatory
      "https://www.jpl.nasa.gov/feeds/news.xml", -- Jet Propulsion Laboratory
      "https://spaceflightnow.com/feed/", -- Launches & live missions
      "https://www.planetary.org/blogs/index.xml", -- Planetary Society deep dives
    },
  },

  -- Key mappings for easy access
  keys = {
    { "<leader>rf", "<cmd>Feed<cr>", desc = "Open RSS Feed Reader" },
  },
}
