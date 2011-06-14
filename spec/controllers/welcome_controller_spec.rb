require 'spec_helper'

describe WelcomeController do

  describe "with account" do
    let(:account) { Account.make }  
    
    before { controller.should_receive(:current_account).and_return(account) }
    
    context "get index" do
      before { get :index }  
  
      it { response.should be_success }
    
      it { assigns[:accounts].should_not be_nil }
    
      it { assigns[:accounts].should == [account] }
    end
  end

end
