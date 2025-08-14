local witcher_quotes = {
  {
    quote = "Evil is evil. Lesser, greater, middling...\nmakes no difference.",
    author = "Geralt of Rivia",
  },
  {
    quote = "People like to invent monsters and monstrosities.\nThen they seem less monstrous themselves.",
    author = "Geralt of Rivia",
  },
  {
    quote = "To be neutral does not mean to be indifferent\nor insensitive. You don't have to kill your feelings.",
    author = "Geralt of Rivia",
  },
  {
    quote = "If I'm to choose between one evil and another,\nI'd rather not choose at all.",
    author = "Geralt of Rivia",
  },
  {
    quote = "Mistakes... are also important to me.\nI don't cross them out of my life, or memory.",
    author = "Geralt of Rivia",
  },
  {
    quote = "Destiny is just the embodiment of the soul's desire\nto grow.",
    author = "Yennefer of Vengerberg",
  },
  {
    quote = "Magic is chaos, art and science.\nIt is a curse, a blessing and progress.",
    author = "Yennefer of Vengerberg",
  },
  {
    quote = "No one wants to suffer. But yet it is our lot.\nAnd some suffer more. Not necessarily of their own volition.",
    author = "Dandelion",
  },
  {
    quote = "Sometimes there is nothing worse than getting\nexactly what you wished for.",
    author = "Tissaia de Vries",
  },
  {
    quote = "The sword of destiny has two edges.\nYou are one of them.",
    author = "Calanthe",
  },
  {
    quote = "We never get to choose. We just... adapt.",
    author = "Ciri",
  },
  {
    quote = "Fear is an illness. If you catch it and leave it untreated,\nit can consume you.",
    author = "Calanthe",
  },
  {
    quote = "Before a sword pierces a body,\nit must first pierce the soul.",
    author = "Cahir",
  },
  {
    quote = "I manage because I have to. Because I've no other way out.\nBecause I've overcome the vanity and pride of being different.",
    author = "Geralt of Rivia",
  },
  {
    quote = "When you know about something it stops being a nightmare.\nWhen you know how to fight something, it stops being so threatening.",
    author = "Uncle Vesemir",
  },
  {
    quote = "Well, we're afeared. And what of it? Do we sit down and weep and tremble?\nLife must go on.",
    author = "Yurga",
  },
  {
    quote = "It is easy to kill with a bow, girl. How easy it is to release\nthe bowstring and think, it is not I, it is the arrow.",
    author = "Geralt of Rivia",
  },
  {
    quote = "Only Evil and Greater Evil exist and beyond them,\nin the shadows, lurks True Evil.",
    author = "Renfri",
  },
  {
    quote = "The world is full of evil, so it's sufficient to stride ahead,\nand destroy the Evil encountered on the way.",
    author = "Regis",
  },
  {
    quote = "Every myth, every fable must have some roots.\nMost often a dream, a wish, a desire, a yearning.",
    author = "Geralt of Rivia",
  },
  {
    quote = "But do you know when stories stop being stories?\nThe moment someone begins to believe in them.",
    author = "Codringher",
  },
}

local function get_random_witcher_quote()
  math.randomseed(os.time())
  local selected = witcher_quotes[math.random(#witcher_quotes)]
  local lines = {}
  for line in selected.quote:gmatch("[^\n]+") do
    table.insert(lines, string.format("%80s", '"' .. line .. '"'))
  end
  table.insert(lines, string.format("%80s", "- " .. selected.author))
  return table.concat(lines, "\n")
end

return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
⠀⠀⠀⠀⠀⢀⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢾⢿⣄⡀⠀⠀⠀⠀⠀⠱⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠎⠀⠀⠀⠀⠀⢀⣠⡿⡷⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⡳⣿⣻⣿⣶⣤⣄⡀⠀⠘⣿⣷⡼⣦⡹⣿⣿⣿⣿⣿⣿⢏⣴⢇⣾⣿⠃⠀⢀⣠⣤⣶⣿⣟⣿⢞⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢳⡠⡙⠷⣯⣻⢿⣿⣿⣶⢌⣩⣭⣭⣥⣽⣿⣿⣿⣿⣯⣮⣭⣭⣍⡡⣶⣿⣿⡿⣟⣽⠾⢋⠄⡞⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⢧⢻⣶⡝⠻⣿⣿⡿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⢿⣿⣿⠟⢫⣶⡟⡼⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⢧⡛⣿⣶⡄⠙⢵⣷⣯⣻⢿⣷⣿⢿⣿⢸⡇⣿⡿⣿⣾⡿⣟⣽⣾⡮⠋⢠⣶⣿⢏⡼⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠐⠒⠺⠿⢿⣦⠀⠙⢌⠛⢇⣴⣷⡌⠙⣻⢽⣾⣟⡏⣿⣿⣿⣿⢹⣻⣷⡯⣿⠏⢡⣾⣦⡸⠛⡡⠋⠀⣰⡿⠿⠗⠒⠂⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣁⣠⣴⣜⡿⣿⣿⡼⣄⡉⠉⠈⠙⡿⣿⡟⢿⣿⢿⠋⠁⠉⢉⣠⢯⣿⣿⢿⣣⣦⣄⣈⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣷⣯⣻⢿⣭⣿⣼⣿⢽⣿⣧⣼⣿⡯⣷⣧⣿⣭⡷⣟⣽⣾⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⠀⠀⠀
⠐⠚⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠚⠙⢿⡻⢯⣿⣿⣿⣿⡽⢟⡿⠋⠓⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠓⠂
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣶⣶⣶⡦⠀⣯⣖⠈⠉⠉⠁⣲⣽⠀⢴⣶⣶⣶⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣰⣾⣿⣿⣿⣿⣿⡿⠟⠉⠀⠀⢛⡿⠿⠿⠿⠿⢿⡟⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⢸⡟⡶⡤⢤⢼⢻⡇⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⣠⣴⡖⠀⠸⠀⠃⠀⠀⠘⠀⠇⠀⢲⣦⣄⠀⠀⠀⠀⠉⠻⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣰⣿⣿⠟⠋⠀⠀⠀⠀⢀⣤⣾⣿⠏⠀⠀⢡⠀⡀⠀⠀⢀⠀⡌⠀⠀⠹⣿⣷⣤⡀⠀⠀⠀⠀⠙⠻⣿⣿⣆⠀⠀⠀⠀
⠀⠀⢀⣼⡿⠏⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠏⠀⠀⠀⢸⡇⣿⣦⣴⣿⢸⡇⠀⠀⠀⠸⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠹⢿⣧⡀⠀⠀
⠀⢀⠜⠉⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠋⠀⠀⠀⠀⢸⡇⣿⣿⣿⣿⢸⡇⠀⠀⠀⠀⠙⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠉⠣⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⠃⠀⠀⠀⠀⠀⠸⠀⠙⠿⠿⠊⠀⠇⠀⠀⠀⠀⠀⠘⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠈⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡣⠤⠤⢜⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢛⣤⣤⣤⣤⡓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠛⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

]]
          .. get_random_witcher_quote()
          .. [[
        ]],
      },
    },
  },
}
