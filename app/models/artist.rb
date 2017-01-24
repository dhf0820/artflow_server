class Artist < ApplicationRecord
  belongs_to :user
  has_many :jobs

  def current_job()
    job = ArtRequest.where(['artist_id = :artist_id and status = :status', {artist_id: self.id, status: 'ACTIVE'}])
    return nil if job.count == 0
    job[0]
  end
end