defmodule MediumGraphqlApi.Accounts.Session do
  alias MediumGraphqlApi.Accounts.User
  alias MediumGraphqlApi.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case check_password(user, args) do
        true -> {:ok, user}
        _ -> {:error, "Incorrect Login Credentials"} 
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> Comeonin.Argon2.dummy_checkpw()
      _ -> Comeonin.Argon2.checkpw(args.password, user.password_hash)
    #   _ -> Comeonin.Argon2.verify_pass(args.password, user.password)
    end
  end
end
