module ComicsHelper

	def redemption_status(redeemable)
		redeemable.redeemed? ? 'Unredeem' : 'Redeem'
	end

	def redemption_style(redemption_status)
		redemption_status.redeemed? ? 'redeemed' : ''
	end

end
