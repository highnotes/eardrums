ActiveAdmin.register Master do
  config.sort_order = "group_asc"

  filter :group
  filter :name
  filter :description
end
