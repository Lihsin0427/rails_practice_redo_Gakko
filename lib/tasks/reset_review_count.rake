desc "重新計算 Review Count"
task :reset_review_count => :environment do
	Course.all.each do |course|
	Course.reset_counters(course.id, :reviews)
	end
end