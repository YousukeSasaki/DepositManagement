class InstitutionsController < ApplicationController
  layout "main_application"
  before_action :set_institutions, only: [:index]
  before_action :set_institution, only: [:show, :edit, :update, :destroy]

  def new
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(institution_params)
    if @institution.save
      flash[:notice] = "登録が完了しました"
      redirect_to institutions_path
    else
      flash.now[:alert] = '登録に失敗しました。必須項目を確認してください。'
      render :new
    end
  end

  def update
    if @institution.update(institution_params)
      flash.now[:notice] = "正常に変更されました"
      render :edit
    else
      flash.now[:alert] = '変更に失敗しました。必須項目を確認してください。'
      render :edit
    end
  end

  private

  def set_institutions
    @institutions = Institution.all.order('id DESC')
  end

  def set_institution
    @institution = Institution.find(params[:id])
  end

  def institution_params
    params.require(:institution).permit(:name, :kana, :phone_number_one, :phone_number_two, :postal_code, :prefecture_id, :city, :address, :building, :institution_type_id, :image)
  end
end
