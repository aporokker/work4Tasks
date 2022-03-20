class Task < ApplicationRecord
    validates :title, presence: true
    validates :startdate, presence: true
    validates :enddate, presence: true
    validates :allday, inclusion: { in: [true, false] }
    validates :memo, length: { in:0..100 }
    validate :enddate_after_startdate

    def enddate_after_startdate
        return if startdate.blank? || enddate.blank?
        errors.add(:enddate, "は開始日以降を入力してください") if enddate < startdate
    end
end
