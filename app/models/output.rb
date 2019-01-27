class Output < ApplicationRecord
  
  validates :withdrawal_or_deposit, presence: true

  private
    def withdrawal_or_deposit
      withdrawal.presence or deposit.presence
    end

end
