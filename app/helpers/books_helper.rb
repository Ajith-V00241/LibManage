module BooksHelper
	def  errors_for(form, field)
		content_tag(:p, form.object.errors[field].try(:first))
	end

	def form_group_for(form, field, opts={}, &block)
		has_errors = form.object.errors[field].present?

		content_tag :div do 
			concat capture(&block)
			concat errors_for(form, field)
		end
	end
end
