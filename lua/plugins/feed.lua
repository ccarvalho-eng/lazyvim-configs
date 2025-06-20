return {
  "neo451/feed.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    feeds = {
      -- News
      { "https://feeds.bbci.co.uk/news/world/rss.xml", name = "BBC News", tags = { "news", "world" } },
      {
        "https://news.google.com/rss/search?q=site%3Areuters.com&hl=en-US&gl=US&ceid=US%3A",
        name = "Reuters via Google",
        tags = { "news", "world" },
      },
      { "https://www.theguardian.com/international/rss", name = "The Guardian", tags = { "news", "world" } },
      { "https://apnews.com/rss", name = "AP News", tags = { "news", "world" } },
      { "https://rss.dw.com/rdf/rss-en-all", name = "Deutsche Welle", tags = { "news", "world" } },

      -- Cybersecurity
      { "https://krebsonsecurity.com/feed/", name = "Krebs on Security", tags = { "security", "tech" } },
      { "https://feeds.feedburner.com/TheHackersNews", name = "The Hackers News", tags = { "security", "tech" } },
      { "https://www.bleepingcomputer.com/feed/", name = "Bleeping Computer", tags = { "security", "tech" } },
      { "https://threatpost.com/feed/", name = "Threatpost", tags = { "security", "tech" } },
      {
        "https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml",
        name = "NVD Vulnerabilities",
        tags = { "security", "cve" },
      },
      { "https://www.schneier.com/blog/atom.xml", name = "Schneier on Security", tags = { "security", "privacy" } },
      { "https://www.darkreading.com/rss.xml", name = "Dark Reading", tags = { "security", "tech" } },

      -- Tech & Programming Communities
      { "https://news.ycombinator.com/rss", name = "Hacker News", tags = { "tech", "programming", "community" } },
      { "https://lobste.rs/rss", name = "Lobsters", tags = { "tech", "programming", "community" } },
      { "https://arstechnica.com/feed/", name = "Ars Technica", tags = { "tech", "news" } },
      { "https://www.technologyreview.com/feed/", name = "MIT Technology Review", tags = { "tech", "innovation" } },
      { "https://feeds.feedburner.com/oreilly/radar/atom", name = "O'Reilly Radar", tags = { "tech", "programming" } },

      -- Gaming
      { "https://www.pcgamer.com/rss/", name = "PC Gamer", tags = { "gaming", "pc" } },
      { "https://www.rockpapershotgun.com/feed", name = "Rock Paper Shotgun", tags = { "gaming", "pc" } },
      { "https://www.eurogamer.net/?format=rss", name = "Eurogamer", tags = { "gaming" } },
      { "https://kotaku.com/rss", name = "Kotaku", tags = { "gaming" } },

      -- Literature & Books
      { "https://lithub.com/feed/", name = "Literary Hub", tags = { "books", "literature" } },
      { "https://www.nybooks.com/feed/", name = "NY Review of Books", tags = { "books", "literature" } },
      { "https://www.theparisreview.org/blog/feed/", name = "The Paris Review", tags = { "books", "literature" } },
      { "https://www.tor.com/feed/", name = "Tor.com", tags = { "books", "scifi", "fantasy" } },

      -- Elixir & Erlang
      { "https://elixir-lang.org/blog/feed.xml", name = "Elixir Blog", tags = { "programming", "elixir" } },
      { "https://www.erlang.org/rss.xml", name = "Erlang.org", tags = { "programming", "erlang" } },
      { "https://blog.erlang.org/feed.xml", name = "Erlang Blog", tags = { "programming", "erlang" } },
      { "https://dashbit.co/feed", name = "Dashbit", tags = { "programming", "elixir" } },

      -- Personal Development
      { "https://zenhabits.net/feed/", name = "Zen Habits", tags = { "mindfulness", "personal-development" } },
      { "https://www.mindful.org/feed/", name = "Mindful", tags = { "mindfulness", "personal-development" } },
      { "https://www.raptitude.com/feed/", name = "Raptitude", tags = { "mindfulness", "personal-development" } },
    },
  },

  -- Key mappings for easy access
  keys = {
    { "<leader>rf", "<cmd>Feed<cr>", desc = "Open RSS Feed Reader" },
  },
}
