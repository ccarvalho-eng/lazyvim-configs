return {
  "neo451/feed.nvim",
  cmd = "Feed",
  ---@module 'feed'
  ---@type feed.config
  opts = {
    feeds = {
      news = {
        international = {
          { "https://feeds.bbci.co.uk/news/world/rss.xml", name = "BBC News" },
          { "https://www.theguardian.com/international/rss", name = "The Guardian" },
          { "https://rss.dw.com/rdf/rss-en-all", name = "Deutsche Welle" },
          { "https://rss.app/feeds/rA3OZudwJXtrWbCO.xml", name = "Reuters" },
          { "https://www.aljazeera.com/xml/rss/all.xml", name = "Al Jazeera" },
        },
        portugal = {
          national = {
            { "https://feeds.feedburner.com/PublicoRSS", name = "Publico" },
          },
          coimbra = {
            { "https://rss.app/feeds/dqtxv8A8mZA90HQZ.xml", name = "Diário de Coimbra" },
            { "https://rss.app/feeds/guCkXl4qJDh3wqRR.xml", name = "As Beiras" },
          },
        },
      },
      tech = {
        security = {
          { "https://podcast.darknetdiaries.com/", name = "DarkNet Diaries" },
          { "https://feeds.feedburner.com/TheHackersNews", name = "The Hacker News" },
          { "https://www.bleepingcomputer.com/feed/", name = "Bleeping Computer" },
          { "https://threatpost.com/feed/", name = "Threatpost" },
          { "https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml", name = "NVD Vulnerabilities" },
          { "https://www.schneier.com/blog/atom.xml", name = "Schneier on Security" },
          { "https://www.darkreading.com/rss.xml", name = "Dark Reading" },
        },
        programming = {
          general = {
            { "https://news.ycombinator.com/rss", name = "Hacker News" },
            { "https://lobste.rs/rss", name = "Lobsters" },
            { "https://www.oreilly.com/radar/feed/index.xml", name = "O'Reilly Radar" },
            { "https://github.blog/feed/", name = "GitHub Blog" },
            { "https://martinfowler.com/feed.atom", name = "Martin Fowler" },
          },
          languages = {
            elixir = {
              { "https://elixirstatus.com/rss", name = "Elixir Status" },
              { "https://rss.app/feeds/1qjJmqgEhqLduwpr.xml", name = "Elixir Blog" },
            },
          },
        },
        news = {
          { "https://arstechnica.com/feed/", name = "Ars Technica" },
          { "https://www.technologyreview.com/feed/", name = "MIT Technology Review" },
        },
      },
      culture = {
        events = {
          { "https://rss.app/feeds/UCrbxZpXzRyav6Uq.xml", name = "Agenda Cultura de Coimbra" },
        },
        literature = {
          general = {
            { "https://lithub.com/feed/", name = "Literary Hub" },
            { "https://www.nybooks.com/feed/", name = "NY Books" },
            { "https://www.theparisreview.org/blog/feed/", name = "The Paris Review" },
          },
          genres = {
            { "https://www.tor.com/feed/", name = "Tor.com", subcategory = "sci-fi/fantasy" },
          },
        },
        discoveries = {
          { "https://www.atlasobscura.com/feeds/latest", name = "Atlas Obscura" },
        },
      },
      science = {
        space = {
          { "https://www.nasa.gov/news-release/feed/", name = "NASA Breaking News" },
          { "https://apod.nasa.gov/apod.rss", name = "Astronomy Picture of the Day" },
        },
      },
      entertainment = {
        gaming = {
          { "https://www.pcgamer.com/rss/", name = "PC Gamer" },
          { "https://www.rockpapershotgun.com/feed", name = "Rock Paper Shotgun" },
          { "https://www.eurogamer.net/?format=rss", name = "Eurogamer" },
          { "https://kotaku.com/rss", name = "Kotaku" },
        },
        sports = {
          motorsports = {
            { "https://rss.app/feeds/3Ckbj4GdOcpA1h0w.xml", name = "Formula 1" },
          },
          chess = {
            { "https://rss.app/feeds/fRBQ0oVwhnsEdlCI.xml", name = "Chess.com News" },
          },
        },
      },
    },
  },
  -- Key mappings for easy access
  keys = {
    { "<leader>rf", "<cmd>Feed index<cr>", desc = "Open RSS Feed Reader" },
    { "<leader>ru", "<cmd>Feed update<cr>", desc = "Update All RSS Feeds" },
  },
}
