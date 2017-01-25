class Artist < ApplicationRecord
  belongs_to :user
  has_many :jobs

  def current_job()
    job = ArtRequest.where(['artist_id = :artist_id and status = :status', {artist_id: self.id, status: 'ACTIVE'}])
    return nil if job.count == 0
    job[0]
  end


  def next_job()
    # get return the active one if there is one
    next_request = ArtRequest.where(['artist_id = :artist_id and status = :status', {artist_id: self.id, status: 'ACTIVE'}])
    return next_request[0] if next_request.count > 0
    #next_request = ArtRequest.where("status = 'PENDING'").order(created_at: :asc)
    next_request = ArtRequest.where(status: 'PENDING').order('created_at ASC')
    return nil if next_request.count == 0
    request = next_request[0]
    pry
    request.artist = self
    request.status = 'ACTIVE'
    request.save
    request
  end


  def on_holds()
    held_list = ArtRequest.where(['artist_id = :artist_id and status = :status', {artist_id: self.id, status: 'HOLD'}])

    return nil if held_list.count == 0
    return held_list
  end

  def on_hold(job_id)
    held_job = ArtRequest.where(['artist_id = :artist_id and id = :id', {artist_id: self.id, id: job_id}])
    return nil if held_job.count == 0
    current_job = self.current_job
    unless current_job.nil?
      current_job.status = 'HOLD'
      current_job.save
    end
    held_job[0].status = 'ACTIVE'
    held_job[0].save
    return held_job[0]
  end
end