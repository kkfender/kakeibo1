class Output < ApplicationRecord
  
  validates :withdrawal_or_deposit, presence: true
  validates :memo,length: { maximum: 10 }

  private
    def withdrawal_or_deposit
      withdrawal.presence or deposit.presence
    end
end
