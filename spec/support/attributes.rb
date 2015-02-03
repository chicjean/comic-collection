def series_attributes(overrides = {})
  random_number = (0..9).to_a.shuffle[0..10].join
  {
    name: "Uncanny X-Men #{random_number}",
  }.merge(overrides)
end