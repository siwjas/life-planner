# frozen_string_literal: true

class PagesController < ApplicationController
  allow_unauthenticated_access

  def home; end

  def about; end
end
