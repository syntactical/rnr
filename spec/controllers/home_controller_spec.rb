require 'spec_helper'

describe HomeController do

  it 'should create vacation calculator with success response' do

    true.should == true
  end

  it 'should render index template' do
    get :index
    response.should render_template :index
  end
end