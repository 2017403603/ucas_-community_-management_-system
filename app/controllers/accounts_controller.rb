class AccountsController < ApplicationController
  def login
  end

  def signup
      @account = Account.new
  end
end
