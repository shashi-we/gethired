module ApplicationHelper
	class EmailCampaignApi
		def self.add_email_mailchip(email,tn,tp,ct,cp,pt,pp,colortitle,colorprice,total,password)
		  gb = Gibbon::API.new
		  result = gb.lists.subscribe({:id => '77dc70cd32', :email => {:email => email},:merge_vars => {:TNAME => tn, :TPRICE => tp,:CDAY=>ct,:CDAYPRICE=>cp,:NOPAGE=>pt,:PPRICE=>pp,:COLOR=>colortitle,:CPRICE=>colorprice,:TOTALPRICE=>total, :PASSWORD=>password}, :double_optin => false})
		  
		  Rails.logger.error("Error from MailChimp: #{result['error']}") if result["status"] == "error"
		end
		def self.add_email_mailchip_digital(email,password,tn,td_price)
		  gb = Gibbon::API.new
		  result = gb.lists.subscribe({:id => '77dc70cd32', :email => {:email => email},:merge_vars => {:TNAME => tn, :TPRICE => td_price, :PASSWORD=>password}, :double_optin => false})
		  
		  Rails.logger.error("Error from MailChimp: #{result['error']}") if result["status"] == "error"
		end
	end
end
