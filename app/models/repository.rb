class Repository < ApplicationRecord
  belongs_to :user
  has_many :issues, dependent: :destroy

  validates :name, uniqueness: { scope: :user_id }

  delegate :username, to: :user, prefix: :owner
  delegate :email, to: :user, prefix: :owner

  def search_on_github(username, repo)
    Octokit.repo("#{username}/#{repo}") rescue nil
  end

  def get_issues
    remote_issues = Octokit.issues("#{user.username}/#{name}")

    remote_issues.select { |issue| Labels.list(issue).include?('RubyNoob') }
  end
end