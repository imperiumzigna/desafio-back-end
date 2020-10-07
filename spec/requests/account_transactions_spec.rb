 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/account_transactions", type: :request do
  # AccountTransaction. As you add validations to AccountTransaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      AccountTransaction.create! valid_attributes
      get account_transactions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      account_transaction = AccountTransaction.create! valid_attributes
      get account_transaction_url(account_transaction)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_account_transaction_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      account_transaction = AccountTransaction.create! valid_attributes
      get edit_account_transaction_url(account_transaction)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new AccountTransaction" do
        expect {
          post account_transactions_url, params: { account_transaction: valid_attributes }
        }.to change(AccountTransaction, :count).by(1)
      end

      it "redirects to the created account_transaction" do
        post account_transactions_url, params: { account_transaction: valid_attributes }
        expect(response).to redirect_to(account_transaction_url(AccountTransaction.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new AccountTransaction" do
        expect {
          post account_transactions_url, params: { account_transaction: invalid_attributes }
        }.to change(AccountTransaction, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post account_transactions_url, params: { account_transaction: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested account_transaction" do
        account_transaction = AccountTransaction.create! valid_attributes
        patch account_transaction_url(account_transaction), params: { account_transaction: new_attributes }
        account_transaction.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the account_transaction" do
        account_transaction = AccountTransaction.create! valid_attributes
        patch account_transaction_url(account_transaction), params: { account_transaction: new_attributes }
        account_transaction.reload
        expect(response).to redirect_to(account_transaction_url(account_transaction))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        account_transaction = AccountTransaction.create! valid_attributes
        patch account_transaction_url(account_transaction), params: { account_transaction: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested account_transaction" do
      account_transaction = AccountTransaction.create! valid_attributes
      expect {
        delete account_transaction_url(account_transaction)
      }.to change(AccountTransaction, :count).by(-1)
    end

    it "redirects to the account_transactions list" do
      account_transaction = AccountTransaction.create! valid_attributes
      delete account_transaction_url(account_transaction)
      expect(response).to redirect_to(account_transactions_url)
    end
  end
end
