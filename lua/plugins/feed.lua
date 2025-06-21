return {
  "neo451/feed.nvim",
  cmd = "Feed",
  ---@module 'feed'
  ---@type feed.config
  opts = {
    feeds = {
      news = {
        world = {
          { "https://feeds.bbci.co.uk/news/world/rss.xml", name = "BBC News" },
          { "https://rss.app/feeds/3e6T5XdYVjnUTNcl.xml", name = "Reuters" },
          { "https://www.theguardian.com/international/rss", name = "The Guardian" },
          { "https://apnews.com/rss", name = "AP News" },
          { "https://rss.dw.com/rdf/rss-en-all", name = "Deutsche Welle" },
        },
        portugal = {
          { "https://feeds.feedburner.com/PublicoRSS", name = "Publico" },
          { "https://rss.app/feeds/rDeVuByvrhHCEq8u.xml", name = "Diário de Coimbra" },
          { "https://rss.app/feeds/KKI3UD2z11ZmCxKV.xml", name = "As Beiras" },
        },
      },
      events = {
        { "https://rss.app/feeds/UCrbxZpXzRyav6Uq.xml", name = "Agenda Cultura de Coimbra" },
      },
      tech = {
        security = {
          { "https://krebsonsecurity.com/feed/", name = "Krebs on Security" },
          { "https://feeds.feedburner.com/TheHackersNews", name = "The Hacker News" },
          { "https://www.bleepingcomputer.com/feed/", name = "Bleeping Computer" },
          { "https://threatpost.com/feed/", name = "Threatpost" },
          { "https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml", name = "NVD Vulnerabilities" },
          { "https://www.schneier.com/blog/atom.xml", name = "Schneier on Security" },
          { "https://www.darkreading.com/rss.xml", name = "Dark Reading" },
        },
        programming = {
          { "https://news.ycombinator.com/rss", name = "Hacker News" },
          { "https://lobste.rs/rss", name = "Lobsters" },
          { "https://www.oreilly.com/radar/feed/index.xml", name = "O'Reilly Radar" },
        },
        general = {
          { "https://arstechnica.com/feed/", name = "Ars Technica" },
          { "https://www.technologyreview.com/feed/", name = "MIT Technology Review" },
        },
      },
      programming = {
        elixir = {
          { "https://elixirstatus.com/rss", name = "Elixir Status" },
        },
        erlang = {
          { "https://www.theerlangelist.com/rss", name = "The Erlangelist" },
        },
      },
      gaming = {
        { "https://www.pcgamer.com/rss/", name = "PC Gamer" },
        { "https://www.rockpapershotgun.com/feed", name = "Rock Paper Shotgun" },
        { "https://www.eurogamer.net/?format=rss", name = "Eurogamer" },
        { "https://kotaku.com/rss", name = "Kotaku" },
      },
      literature = {
        { "https://lithub.com/feed/", name = "Literary Hub" },
        { "https://www.nybooks.com/feed/", name = "NY Books" },
        { "https://www.theparisreview.org/blog/feed/", name = "The Paris Review" },
        { "https://www.tor.com/feed/", name = "Tor.com", subcategory = "sci-fi/fantasy" },
      },
      personal = {
        mindfulness = {
          { "https://zenhabits.net/feed/", name = "Zen Habits" },
          { "https://www.mindful.org/feed/", name = "Mindful.org" },
          { "https://www.raptitude.com/feed/", name = "Raptitude" },
        },
      },
      sports = {
        f1 = {
          { "https://www.formula1.com/en/latest.rss", name = "Formula 1" },
          { "https://www.fia.com/rss/press-release", name = "FIA Press Releases" },
          { "https://www.autosport.com/rss/f1/news", name = "Autosport F1" },
          { "https://f1tv-rss.vercel.app/api/rss", name = "F1 TV" },
        },
      },
      science = {
        space = {
          { "https://www.nasa.gov/news-release/feed/", name = "NASA Breaking News" },
          { "https://apod.nasa.gov/apod.rss", name = "Astronomy Picture of the Day" },
          { "https://science.nasa.gov/feeds/news.xml", name = "NASA Science News" },
          { "https://earthobservatory.nasa.gov/Feeds/rss/eo.rss", name = "NASA Earth Observatory" },
          { "https://www.jpl.nasa.gov/feeds/news.xml", name = "Jet Propulsion Laboratory" },
          { "https://spaceflightnow.com/feed/", name = "Spaceflight Now" },
          { "https://www.planetary.org/blogs/index.xml", name = "Planetary Society" },
        },
      },
    },
  },

  -- Key mappings for easy access
  keys = {
    { "<leader>rf", "<cmd>Feed<cr>", desc = "Open RSS Feed Reader" },
    { "<leader>ru", "<cmd>Feed update<cr>", desc = "Update All RSS Feeds" },
  },
}
