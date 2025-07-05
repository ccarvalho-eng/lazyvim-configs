return {
  news = {
    international = {
      { "https://www.theguardian.com/international/rss", name = "The Guardian" },
    },
  },
  tech = {
    security = {
      { "https://feeds.feedburner.com/TheHackersNews", name = "The Hacker News" },
      { "https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml", name = "NVD Vulnerabilities" },
      { "https://www.schneier.com/blog/atom.xml", name = "Schneier on Security" },
    },
    programming = {
      general = {
        { "https://news.ycombinator.com/rss", name = "Hacker News" },
      },
      languages = {
        elixir = {
          { "https://elixirstatus.com/rss", name = "Elixir Status" },
        },
      },
    },
  },
}
