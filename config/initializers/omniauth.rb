Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "cc3839072a579508fc4e", "4c699847ee8e6d567ca841d6d66c661b041c1860"
end
