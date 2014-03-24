namespace :models do
  desc "Create all OC2 models from config/oc2_models.txt"
  task :gen do
    models = File.open('models.txt').readlines

    # For each table name, create a model
    models.each do |vmodel|
      name = vmodel.strip.singularize
      unless name.include?("#")
        doc = <<EOF
class #{name.camelcase} < ActiveRecord::Base
end
EOF

        path = "app/models/#{name.underscore}.rb"
        File.open(path, 'w') {|f| f.write(doc) } unless File.exist?(path)
      end
    end
  end

end

