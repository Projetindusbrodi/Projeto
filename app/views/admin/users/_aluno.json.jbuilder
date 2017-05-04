json.extract! aluno, :id, :ra, :nome, :password, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
