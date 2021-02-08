class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :project_url
end
