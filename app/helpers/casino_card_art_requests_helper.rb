module CasinoCardArtRequestsHelper
  def available_colors
    CardColor.all.collect{|cc| [cc.name, cc.id]} + [["Custom", "Custom"]]
  end
end
