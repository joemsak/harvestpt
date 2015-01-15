task track_harvest_time_in_pivotal: :environment do
  time = PtHarvest::TrackTimeOnStories.time_referencing_stories

  time.each do |time|
    story = PtHarvest::TrackTimeOnStories.story(time)
    story.notes.create(text: "Recently tracked #{time.hours} hours")
  end
end
