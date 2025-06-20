return {
  "neo451/feed.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "neo451/snacks.nvim",
  },
  opts = {
    feeds = {
      -- News
      "https://feeds.bbci.co.uk/news/world/rss.xml",
      "https://news.google.com/rss/search?q=site%3Areuters.com&hl=en-US&gl=US&ceid=US%3A",
      "https://www.theguardian.com/international/rss",
      "https://apnews.com/rss",
      "https://rss.dw.com/rdf/rss-en-all",

      -- Cybersecurity
      "https://krebsonsecurity.com/feed/",
      "https://feeds.feedburner.com/TheHackersNews",
      "https://www.bleepingcomputer.com/feed/",
      "https://threatpost.com/feed/",
      "https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml",
      "https://www.schneier.com/blog/atom.xml",
      "https://www.darkreading.com/rss.xml",

      -- Tech & Programming Communities
      "https://news.ycombinator.com/rss",
      "https://lobste.rs/rss",
      "https://arstechnica.com/feed/",
      "https://www.technologyreview.com/feed/",
      "https://feeds.feedburner.com/oreilly/radar/atom",

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
    },
  },

  -- Key mappings for easy access
  keys = {
    { "<leader>rf", "<cmd>Feed<cr>", desc = "Open RSS Feed Reader" },
  },
}
