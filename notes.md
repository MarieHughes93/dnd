Dnd App

User 
    has_many :characters
    has_many :memberships
    has_many campeigns, through: membership
    has_many :sessions, through: campeign
    has_many :dugeons, :class_name => 'Campeign', :foreign_key => 'dm_id'
    (name, username, email, password_digest, location)


Character
    belongs_to :user
    (user_id, Name, race, level, bio)


Membership (join)
    belongs_to :user
    belongs_to :campeign
    (user_id, campeign_id, status => default accepted)

Campeign
    has_many users, through: membership
    has_many :sessions
    belongs_to :dm, :class_name=> 'User'
    (dm_id,name, location, story, difficulty level)

Session
    belongs_to :campeign
    (campeign_id, date/time, address)
