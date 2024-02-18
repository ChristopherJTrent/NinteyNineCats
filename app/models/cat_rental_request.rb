class CatRentalRequest < ApplicationRecord
    STATUS_CODES = %w(PENDING APPROVED DENIED)
    validates :status, inclusion: {in: STATUS_CODES}
    validates :cat_id, :start_date, :end_date, presence: true
    validate :does_not_overlap_approved_requests
    belongs_to :cat

    def approve!
        transaction do
            if update({status: "APPROVED"})
                overlapping_pending_requests.each do |request|
                    request.deny!
                end
            end
        end
        self
    end

    def deny!
        update({status: "DENIED"})
    end

    def pending? 
        status == "PENDING"
    end

    def overlapping_requests
        # using the range syntax in postgresql to efficiently detect overlaps.
        CatRentalRequest.where(cat_id: cat_id).where(<<-SQL, sd: start_date, ed: end_date, id: id)
            -- the date range representing the time that this request would rent out the cat
            daterange(:sd, :ed) 
            -- the date range we're comparing to
            && daterange(cat_rental_requests.start_date, cat_rental_requests.end_date)
            -- exclude self
            AND NOT cat_rental_requests.id = :id
        SQL
    end
    def overlapping_approved_requests
        overlapping_requests.where(status:"APPROVED")
    end
    def overlapping_pending_requests
        overlapping_requests.where(status: "PENDING")
    end
    def does_not_overlap_approved_requests
        if overlapping_approved_requests.exists? && status == "APPROVED"
            errors.add(:start_date, "cannot overlap an existing approved request")
        end
    end
end
