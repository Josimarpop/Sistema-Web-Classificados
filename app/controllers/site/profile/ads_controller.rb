class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only: [:edit, :update]

  def index
    @ads = Ad.to_the(current_member)
  end

  def edit
    #
  end

  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: "Anúncio atualizado com sucesso"
    else
      render :edit, notice: "O Anúncio #{@ad.title} não foi atualizado, tente novamente"
    end
  end

  private

    def set_ad
      @ad = Ad.find(params[:id])
    end

    def params_ad
      params.require(:ad).permit(:id, :price :category_id, :title, :description, :picture)
    end
end
