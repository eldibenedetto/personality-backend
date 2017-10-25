class Api::V1::InsightsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @insights = Insight.all
    render json: @insights, status: 200
  end

  def create
    username = '285b8d9a-f82f-40b4-823f-a357dcc43a18'
    password = 'bepXm5OmNx5a'
    body = params[:insight][:writing_sample]
    require 'rest-client'
    require 'json'
    url = "https://#{username}:#{password}@gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13"

    response = JSON.parse(RestClient.post url, body, :content_type => 'text/plain')
    openness_trait = response["personality"][0]["percentile"] * 100
    agreeableness_trait = response["personality"][3]["percentile"] * 100
    conscientiousness_trait = response["personality"][1]["percentile"] * 100
    extraversion_trait = response["personality"][2]["percentile"] * 100
    emotional_range_trait = response["personality"][4]["percentile"] * 100
    insightable_type_var = User.find_by(username: params[:user][:username]) ? User.find_by(username: params[:user][:username]).class.to_s : Person.find(params[:user][:id].class.to_s)
    insightable_id_var = params[:user][:id].to_i
    insight = Insight.new(writing_sample: params[:insight][:writing_sample], insightJSON: response, openness: openness_trait, agreeableness: agreeableness_trait, conscientiousness: conscientiousness_trait, introversion_extraversion: extraversion_trait, emotional_range: emotional_range_trait, insightable_type: insightable_type_var, insightable_id: insightable_id_var)
    if insight.save

      render json: {insight: insight}
    else

      render json: { message: "Invalid insight"}
    end
  end

  private

  def insight_params
    params.require(:insight).permit(:writing_sample, :insightJSON, :openness, :agreeableness, :conscientiousness, :introversion_extraversion, :emotional_range, :insightable_type, :insightable_id)
  end

end
